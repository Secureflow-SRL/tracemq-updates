# Exemples de Configuration

## Topologie de Test MQTT Standard

### Profil Broker
-   **Nom** : Mosquitto Local
-   **URL** : `tcp://localhost:1883`
-   **Client ID** : `TraceMQ-Monitor`

### Simulation (Capteur Température)
-   **Topic** : `home/livingroom/temp`
-   **Variables** :
    -   `t` : Sine Wave (Min: 18, Max: 22, Step: 0.1)
-   **Payload** : `{"val": {{.t}}, "unit": "C"}`

## Test de Charge NATS
Pour tester la robustesse d'un cluster NATS.

1.  Créer 3 profils NATS pointant vers les 3 nœuds du cluster.
2.  Lancer 3 simulateurs (un par connexion) avec une fréquence de 0.01s (100Hz).
3.  Utiliser le **Traffic Monitor** (Tableau de bord) pour voir le débit global.
