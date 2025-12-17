# Moteur de Simulation

Le module de simulation permet de générer du trafic réaliste sans avoir besoin de matériel physique.

## Créer une Simulation
1.  Ouvrez le panneau **Simulateur** (icône Play/Test Tube).
2.  Créez une nouvelle configuration.
3.  **Topic** : Le topic de publication (ex: `factory/sensor/temp`).
4.  **Fréquence** : Intervalle d'envoi en secondes (ex: `1.0` pour 1Hz).

## Variables Dynamiques
Le payload supporte un système de template puissant. Vous pouvez définir des variables qui changent à chaque envoi.

### Types de Variables
-   **Random Int** : Entier aléatoire entre Min et Max.
-   **Random Float** : Décimal aléatoire.
-   **Sequence** : Compteur qui s'incrémente (`CurrentVal += Step`).
-   **Choice** : Sélectionne une valeur au hasard dans une liste (`["ON", "OFF", "ERR"]`).
-   **Sine** : Génère une onde sinusoïdale (utile pour simuler des cycles température/journée).
-   **Timestamp** : Date/Heure courante (Format ISO8601).

## Template de Payload
Utilisez la syntaxe Go Template `{{.NomVariable}}`.

**Exemple :**
Configuration des variables :
-   `temp` (Sine, Min: 20, Max: 30)
-   `id` (Choice, ["S1", "S2"])

Template :
```json
{
  "sensor_id": "{{.id}}",
  "temperature": {{.temp}},
  "timestamp": "{{.timestamp}}",
  "status": "OK"
}
```

Rendu :
```json
{ "sensor_id": "S1", "temperature": 24.5, "timestamp": "2024-01-01T12:00:00Z", "status": "OK" }
```
