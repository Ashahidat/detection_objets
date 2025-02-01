# Projet Flask App avec Streamlit et FlaskJ

## Description

Ce projet est une application web composée de trois parties principales :
1. **Flask (`app.py`)** : le backend qui gère la logique du serveur.
2. **Streamlit (`frontend.py`)** : le frontend interactif qui permet à l'utilisateur d'interagir avec l'application.
3. **FlaskJ (`backend.py`)** : un composant pour la gestion de tâches supplémentaires (ou un autre aspect fonctionnel du backend).

L'objectif est de créer une interface utilisateur fluide et interactive avec Streamlit, tout en gérant la logique et les opérations côté serveur via Flask et FlaskJ.

## Structure du projet

```plaintext
/mon-projet
│
├── app.py                # Backend principal (Flask)
├── frontend.py           # Interface utilisateur (Streamlit)
├── backend.py            # Logique secondaire du backend (FlaskJ)
├── requirements.txt      # Liste des dépendances
├── README.md             # Ce fichier
└── /static               # Dossier pour les fichiers statiques (images, CSS, JS, etc.)
└── /templates            # Dossier pour les templates Jinja2 (si utilisés par Flask)
