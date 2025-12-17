# Configuratievoorbeelden

## Standaard MQTT Testtopologie

### Brokerprofiel
-   **Naam**: Lokaal Mosquitto
-   **URL**: `tcp://localhost:1883`
-   **Client ID**: `TraceMQ-Monitor`

### Simulatie (Temperatuursensor)
-   **Topic**: `home/woonkamer/temp`
-   **Variabelen**:
    -   `t`: Sine Wave (Min: 18, Max: 22, Stap: 0.1)
-   **Payload**: `{"val": {{.t}}, "unit": "C"}`

## NATS Belastingstest
Om de robuustheid van een NATS-cluster te testen.

1.  Maak 3 NATS-profielen die verwijzen naar de 3 cluster-nodes.
2.  Start 3 simulators (één per verbinding) met een frequentie van 0.01s (100Hz).
3.  Gebruik de **Traffic Monitor** (Dashboard) om de totale doorvoer te bekijken.
