# Simulatie Engine

De simulatiemodule maakt het genereren van realistisch verkeer mogelijk zonder fysieke hardware.

## Een Simulatie Maken
1.  Open het **Simulator** paneel (Play/Reageerbuis pictogram).
2.  Maak een nieuwe configuratie.
3.  **Topic**: Het publicatieonderwerp (bijv. `factory/sensor/temp`).
4.  **Frequentie**: Verzendinterval in seconden (bijv. `1.0` voor 1Hz).

## Dynamische Variabelen
De payload ondersteunt een krachtig sjabloonsysteem. U kunt variabelen definiëren die bij elke verzending veranderen.

### Variabeletypes
-   **Random Int**: Willekeurig geheel getal tussen Min en Max.
-   **Random Float**: Willekeurig decimaal getal.
-   **Sequence**: Teller die oploopt (`CurrentVal += Step`).
-   **Choice**: Selecteert willekeurig een waarde uit een lijst (`["AAN", "UIT", "FOUT"]`).
-   **Sine**: Genereert een sinusgolf (nuttig voor het simuleren van dagelijkse temperatuurcycli).
-   **Timestamp**: Huidige Datum/Tijd (ISO8601 Formaat).

## Payloadsjabloon
Gebruik Go Template syntaxis `{{.VariabeleNaam}}`.

**Voorbeeld:**
Variabeleconfiguratie:
-   `temp` (Sine, Min: 20, Max: 30)
-   `id` (Choice, ["S1", "S2"])

Sjabloon:
```json
{
  "sensor_id": "{{.id}}",
  "temperature": {{.temp}},
  "timestamp": "{{.timestamp}}",
  "status": "OK"
}
```

Gerenderd:
```json
{ "sensor_id": "S1", "temperature": 24.5, "timestamp": "2024-01-01T12:00:00Z", "status": "OK" }
```
