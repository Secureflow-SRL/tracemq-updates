# Simulation Engine

The simulation module allows generating realistic traffic without the need for physical hardware or complex scripts. It is ideal for testing your dashboards, alerts, or broker load.

## How it Works

A simulation publishes periodic messages to a given topic. The content of each message is dynamically generated from a **Template** and **Variables**.

## Create a Simulation

1.  Open the **Simulator** panel (Test tube or Play icon in the sidebar).
2.  Create a new configuration (+).
3.  **Basic Settings**:
    *   **Topic**: The publication subject (e.g., `factory/sensor/temp`).
    *   **Frequency**: Send interval in seconds (e.g., `1.0` for 1Hz, `0.1` for 10Hz).
    *   **Retain**: (For MQTT) Mark the message as retained.

## Dynamic Variables

Variables allow the message content to vary with each send.

| Type | Description | Parameters |
| :--- | :--- | :--- |
| **Random Int** | Random integer | Min, Max |
| **Random Float** | Random decimal | Min, Max, Precision |
| **Sequence** | Incremental counter | Start, Step |
| **Choice** | Random choice from a list | List of values (e.g., "ON", "OFF") |
| **Sine** | Sine wave (Cycles) | Min, Max, Period |
| **Timestamp** | Current date/time | Format (ISO8601, Unix, etc.) |

## Payload Template

The payload is defined in JSON format (or text) and uses creating Go template syntax `{{.VariableName}}` to insert values.

**Concrete Example:**

1.  **Variables**:
    *   `temp`: Sine (Min: 20, Max: 30)
    *   `id`: Choice ("S1", "S2", "S3")
    *   `ts`: Timestamp (ISO8601)

2.  **Template**:
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

3.  **Generated Result**:
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

## Possibilities

*   **Load Simulation**: Enable multiple simultaneous high-frequency simulations.
*   **Hybrid Behavior**: Combine static and dynamic data.
*   **Multi-Protocol**: Simulations use the active connection, regardless of the protocol (MQTT, NATS, etc.).
