# Moteur de Simulation

Le module de simulation permet de générer du trafic réaliste sans avoir besoin de matériel physique ou de scripts complexes. Il est idéal pour tester vos dashboards, vos alertes, ou la charge de votre broker.

## Fonctionnement

Une simulation publie des messages périodiques sur un topic donné. Le contenu de chaque message est généré dynamiquement à partir d'un **Template** et de **Variables**.

## Créer une Simulation

1.  Ouvrez le panneau **Simulateur** (icône "Tube à essai" ou "Play" dans la barre latérale).
2.  Créez une nouvelle configuration (+).
3.  **Paramètres de base** :
    *   **Topic** : Le sujet de publication (ex: `factory/sensor/temp`).
    *   **Fréquence** : Intervalle d'envoi en secondes (ex: `1.0` pour 1Hz, `0.1` pour 10Hz).
    *   **Retain** : (Pour MQTT) Marquer le message comme retenu.

## Variables Dynamiques

Les variables permettent de faire varier le contenu du message à chaque envoi.

| Type | Description | Paramètres |
| :--- | :--- | :--- |
| **Random Int** | Entier aléatoire | Min, Max |
| **Random Float** | Décimal aléatoire | Min, Max, Précision |
| **Sequence** | Compteur incrémental | Start, Step |
| **Choice** | Choix aléatoire dans une liste | Liste de valeurs (ex: "ON", "OFF") |
| **Sine** | Onde sinusoïdale (Cycles) | Min, Max, Période |
| **Timestamp** | Date/Heure courante | Format (ISO8601, Unix, etc.) |

## Template de Payload

Le payload est défini au format JSON (ou texte) et utilise la syntaxe de template Go `{{.NomVariable}}` pour insérer les valeurs.

**Exemple Concret :**

1.  **Variables** :
    *   `temp`: Sine (Min: 20, Max: 30)
    *   `id`: Choice ("S1", "S2", "S3")
    *   `ts`: Timestamp (ISO8601)

2.  **Template** :
    ```json
    {
      "sensor_id": "{{.id}}",
      "values": {
        "temperature": {{.temp}},
        "humidity": 45.0
      },
      "timestamp": "{{.ts}}"
    }
    ```

3.  **Résultat généré** :
    ```json
    {
      "sensor_id": "S1",
      "values": {
        "temperature": 24.52,
        "humidity": 45.0
      },
      "timestamp": "2024-01-01T12:00:00Z"
    }
    ```

## Possibilités

*   **Simulation de charge** : Activez plusieurs simulations simultanées à haute fréquence.
*   **Comportement Hybride** : Combinez des données statiques et dynamiques.
*   **Multi-Protocoles** : Les simulations utilisent la connexion active, quel que soit le protocole (MQTT, NATS, etc.).
