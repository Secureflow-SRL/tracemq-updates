# Message Visualization

The core of TraceMQ is the real-time message list.

## Message List
-   **Auto-Scroll**: The list scrolls by default. Pause to inspect a message.
-   **Filtering**: Use the search bar at the top.
    -   Simple text: `error`
    -   Topic: `topic:sensor/temp`
    -   Payload (JSON): `payload.value > 20` (if supported by advanced filter).

## Message Detail
Click on a message to open the right sidebar.
-   **Format**: TraceMQ automatically detects JSON, XML, Hex, or Plain Text.
-   **Protobuf Decoding**: If you have configured `.proto` schemas, binary messages will be decoded automatically.
-   **Metadata**: Displays QoS, Retain flag, precise Timestamp, and Message ID.

## Diff Viewer
Select two messages (Ctrl+Click) to see the exact differences between their payloads. Useful for debugging subtle state changes.
