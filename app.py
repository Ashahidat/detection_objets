import os
import time
import pickle
import pymysql
from flask import Flask, request, render_template, redirect, url_for, session, flash, send_from_directory
from werkzeug.security import generate_password_hash, check_password_hash
from PIL import Image
import numpy as np
import cv2
import datetime

# Initialisation de l'application Flask
app = Flask(__name__)
app.secret_key = "votre_cle_secrete"

# Configuration des fichiers téléchargés
UPLOAD_FOLDER = "uploads"
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)
app.config["UPLOAD_FOLDER"] = UPLOAD_FOLDER

# Connexion à la base de données
def get_db_connection():
    return pymysql.connect(
        host="localhost",
        user="root",  # Remplacez par votre utilisateur MySQL
        password="",  # Remplacez par votre mot de passe MySQL
        database="prediction",
        cursorclass=pymysql.cursors.DictCursor
    )

# Charger le modèle YOLO
with open("yolov8_model.pkl", "rb") as file:
    model = pickle.load(file)

# Classes du modèle
class_names = [
    "person", "bicycle", "car", "motorbike", "aeroplane", "bus", "train", "truck", "boat", "traffic light", 
    "fire hydrant", "stop sign", "parking meter", "bench", "bird", "cat", "dog", "horse", "sheep", "cow", 
    "elephant", "bear", "zebra", "giraffe", "backpack", "umbrella", "handbag", "tie", "suitcase", "frisbee", 
    "skis", "snowboard", "sports ball", "kite", "baseball bat", "baseball glove", "skateboard", "surfboard", 
    "tennis racket", "bottle", "wine glass", "cup", "fork", "knife", "spoon", "bowl", "banana", "apple", 
    "sandwich", "orange", "broccoli", "carrot", "hot dog", "pizza", "donut", "cake", "chair", "sofa", 
    "pottedplant", "bed", "diningtable", "toilet", "tvmonitor", "laptop", "mouse", "remote", "keyboard", 
    "cell phone", "microwave", "oven", "toaster", "sink", "refrigerator", "book", "clock", "vase", "scissors", 
    "teddy bear", "hair drier", "toothbrush"
]

@app.route("/", methods=["GET", "POST"])
def index():
    # On s'assure que l'utilisateur n'est pas déjà connecté
    if "user_id" in session:
        return redirect(url_for("predict"))  # Redirige l'utilisateur vers la page de prédiction

    if request.method == "POST":
        email = request.form["email"]
        password = request.form["password"]
        conn = get_db_connection()
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM utilisateurs WHERE email = %s", (email,))
            user = cursor.fetchone()
            if user:
                # Vérifie le mot de passe
                if check_password_hash(user["mot_de_passe"], password):
                    session["user_id"] = user["id"]
                    session["email"] = user["email"]
                    flash("Connexion réussie!", "success")
                    return redirect(url_for("predict"))  # Redirige vers la page de prédiction
                else:
                    flash("Mot de passe incorrect.", "error")
            else:
                # Crée un nouvel utilisateur
                hashed_password = generate_password_hash(password)
                cursor.execute("INSERT INTO utilisateurs (email, mot_de_passe, nb_predictions) VALUES (%s, %s, %s)",
                               (email, hashed_password, 0))
                conn.commit()
                session["user_id"] = cursor.lastrowid
                session["email"] = email
                flash("Inscription réussie!", "success")
                return redirect(url_for("predict"))  # Redirige vers la page de prédiction
        conn.close()

    return render_template("auth.html")  # Page d'authentification


@app.route("/predict", methods=["GET", "POST"])
def predict():
    # Vérifie que l'utilisateur est connecté
    if "user_id" not in session:
        flash("Veuillez vous connecter pour effectuer une prédiction.", "error")
        return redirect(url_for("index"))  # Redirige vers la page de connexion

    user_email = session.get("email")

    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("SELECT nb_predictions FROM utilisateurs WHERE id = %s", (session["user_id"],))
        nb_predictions = cursor.fetchone()["nb_predictions"]

    if request.method == "POST":
        if "image" not in request.files:
            flash("Aucune image téléchargée.", "error")
            return redirect(url_for("predict"))

        file = request.files["image"]
        filepath = os.path.join(app.config["UPLOAD_FOLDER"], file.filename)
        file.save(filepath)

        # Mesurer le temps de début
        start_time = time.time()

        # Prédictions du modèle
        image = Image.open(filepath).convert("RGB")
        image_np = np.array(image)
        results = model.predict(image_np)

        # Calcul du temps de réponse
        response_time = time.time() - start_time

        predictions = []
        for result in results:
            for box in result.boxes:
                coords = box.xyxy[0].numpy()
                cls = int(box.cls[0])
                conf = box.conf[0]
                label = f"{class_names[cls]} ({conf:.2f})"
                predictions.append(label)

        predictions = list(set(predictions))

        # Annoter l'image
        image_cv = cv2.cvtColor(image_np, cv2.COLOR_RGB2BGR)
        for result in results:
            for box in result.boxes:
                coords = box.xyxy[0].numpy()
                cls = int(box.cls[0])
                label = class_names[cls]
                p1 = (int(coords[0]), int(coords[1]))
                p2 = (int(coords[2]), int(coords[3]))
                cv2.rectangle(image_cv, p1, p2, (0, 255, 0), 2)
                cv2.putText(image_cv, label, (p1[0], p1[1] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)

        annotated_path = os.path.join(app.config["UPLOAD_FOLDER"], f"annotated_{file.filename}")
        cv2.imwrite(annotated_path, image_cv)

        # Ajouter les données à la table `objets`
        with conn.cursor() as cursor:
            cursor.execute(
                """INSERT INTO objets (utilisateur_id, type_objet, image_url, temps_reponse, date_detection) 
                VALUES (%s, %s, %s, %s, %s)""",
                (
                    session["user_id"], 
                    ", ".join(predictions), 
                    annotated_path, 
                    round(response_time, 2),  # Temps de réponse en secondes (arrondi à 2 décimales)
                    datetime.datetime.now()  # Date actuelle
                )
            )
            cursor.execute(
                "UPDATE utilisateurs SET nb_predictions = nb_predictions + 1 WHERE id = %s",
                (session["user_id"],)
            )
        conn.commit()
        conn.close()

        return render_template(
            "index.html", 
            predictions=predictions, 
            result_image=url_for("uploaded_file", filename=f"annotated_{file.filename}"),
            user_email=user_email,
            show_satisfaction=True  # Permet d'afficher les boutons de satisfaction
        )

    return render_template("index.html", user_email=user_email)

@app.route("/satisfaction", methods=["POST"])
def satisfaction():
    # Vérifie que l'utilisateur est connecté
    if "user_id" not in session:
        flash("Veuillez vous connecter.", "error")
        return redirect(url_for("index"))

    utilisateur_id = session["user_id"]
    satisfaction_value = request.form.get("satisfaction")  # Récupère la valeur du bouton cliqué

    conn = get_db_connection()
    with conn.cursor() as cursor:
        if satisfaction_value == "satisfait":
            cursor.execute(
                "INSERT INTO satisfactions (utilisateur_id, satisfait, non_satisfait) VALUES (%s, %s, %s) "
                "ON DUPLICATE KEY UPDATE satisfait = satisfait + 1",
                (utilisateur_id, 1, 0)
            )
        elif satisfaction_value == "non_satisfait":
            cursor.execute(
                "INSERT INTO satisfactions (utilisateur_id, satisfait, non_satisfait) VALUES (%s, %s, %s) "
                "ON DUPLICATE KEY UPDATE non_satisfait = non_satisfait + 1",
                (utilisateur_id, 0, 1)
            )
        conn.commit()
    conn.close()

    flash("Merci pour votre retour !", "success")
    return redirect(url_for("predict"))

# Route pour servir les fichiers téléchargés
@app.route("/uploads/<filename>")
def uploaded_file(filename):
    return send_from_directory(app.config["UPLOAD_FOLDER"], filename)

@app.route("/logout")
def logout():
    session.clear()
    flash("Vous êtes déconnecté.", "success")
    return redirect(url_for("index"))

if __name__ == "__main__":
    app.run(debug=True)