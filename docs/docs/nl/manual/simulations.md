# Simulatie Engine

De simulatiemodule maakt het genereren van realistisch verkeer mogelijk zonder fysieke hardware of complexe scripts. Het is ideaal voor het testen van uw dashboards, waarschuwingen of brokerbelasting.

## Hoe het werkt

Een simulatie publiceert periodieke berichten naar een bepaald topic. De inhoud van elk bericht wordt dynamisch gegenereerd op basis van een **Sjabloon** en **Variabelen**.

## Een Simulatie Maken

1.  Open het **Simulator** paneel (Reageerbuis of Play-pictogram in de zijbalk).
2.  Maak een nieuwe configuratie (+).
3.  **Basisinstellingen**:
    *   **Topic**: Het publicatieonderwerp (bijv. `factory/sensor/temp`).
    *   **Frequentie**: Verzendinterval in seconden (bijv. `1.0` voor 1Hz, `0.1` voor 10Hz).
    *   **Retain**: (Voor MQTT) Markeer het bericht als retained.

## Dynamische Variabelen

Variabelen maken het mogelijk de berichtinhoud bij elke verzending te variëren.

| Type | Beschrijving | Parameters |
| :--- | :--- | :--- |
| **Random Int** | Willekeurig geheel getal | Min, Max |
| **Random Float** | Willekeurig decimaal getal | Min, Max, Precisie |
| **Sequence** | Oplopende teller | Start, Stap |
| **Choice** | Willekeurige keuze uit een lijst | Lijst met waarden (bijv. "AAN", "UIT") |
| **Sine** | Sinusgolf (Cycli) | Min, Max, Periode |
| **Timestamp** | Huidige datum/tijd | Formaat (ISO8601, Unix, enz.) |

## Payload Sjabloon

De payload wordt gedefinieerd in JSON-formaat (of tekst) en gebruikt de Go-template syntax `{{.VariabeleNaam}}` om waarden in te voegen.

**Concreet Voorbeeld:**

1.  **Variabelen**:
    *   `temp`: Sine (Min: 20, Max: 30)
    *   `id`: Choice ("S1", "S2", "S3")
    *   `ts`: Timestamp (ISO8601)

2.  **Sjabloon**:
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

3.  **Gegenereerd Resultaat**:
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

## Mogelijkheden

*   **Belastingssimulatie**: Schakel meerdere gelijktijdige hoogfrequente simulaties in.
*   **Hybride Gedrag**: Combineer statische en dynamische data.
*   **Multi-Protocol**: Simulaties gebruiken de actieve verbinding, ongeacht het protocol (MQTT, NATS, enz.).
