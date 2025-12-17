# Configuration Examples

## Standard MQTT Test Topology

### Broker Profile
-   **Name**: Local Mosquitto
-   **URL**: `tcp://localhost:1883`
-   **Client ID**: `TraceMQ-Monitor`

### Simulation (Temperature Sensor)
-   **Topic**: `home/livingroom/temp`
-   **Variables**:
    -   `t`: Sine Wave (Min: 18, Max: 22, Step: 0.1)
-   **Payload**: `{"val": {{.t}}, "unit": "C"}`

## NATS Load Test
To test the robustness of a NATS cluster.

1.  Create 3 NATS profiles pointing to the 3 cluster nodes.
2.  Launch 3 simulators (one per connection) with a frequency of 0.01s (100Hz).
3.  Use the **Traffic Monitor** (Dashboard) to view the overall throughput.
