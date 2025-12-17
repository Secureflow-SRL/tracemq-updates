# Simulation Engine

The simulation module allows generating realistic traffic without the need for physical hardware.

## Create a Simulation
1.  Open the **Simulator** panel (Play/Test Tube icon).
2.  Create a new configuration.
3.  **Topic**: The publication topic (e.g., `factory/sensor/temp`).
4.  **Frequency**: Send interval in seconds (e.g., `1.0` for 1Hz).

## Dynamic Variables
The payload supports a powerful template system. You can define variables that change with each send.

### Variable Types
-   **Random Int**: Random integer between Min and Max.
-   **Random Float**: Random decimal.
-   **Sequence**: Counter that increments (`CurrentVal += Step`).
-   **Choice**: Selects a random value from a list (`["ON", "OFF", "ERR"]`).
-   **Sine**: Generates a sine wave (useful for simulating daily temperature cycles).
-   **Timestamp**: Current Date/Time (ISO8601 Format).

## Payload Template
Use Go Template syntax `{{.VariableName}}`.

**Example:**
Variable Configuration:
-   `temp` (Sine, Min: 20, Max: 30)
-   `id` (Choice, ["S1", "S2"])

Template:
```json
{
  "sensor_id": "{{.id}}",
  "temperature": {{.temp}},
  "timestamp": "{{.timestamp}}",
  "status": "OK"
}
```

Rendered:
```json
{ "sensor_id": "S1", "temperature": 24.5, "timestamp": "2024-01-01T12:00:00Z", "status": "OK" }
```
