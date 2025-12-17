# MQTT Client

TraceMQ integrates a robust and complete MQTT client, supporting the latest protocol specifications.

## Supported Versions

-   **MQTT 3.1**
-   **MQTT 3.1.1**: Widely used standard.
-   **MQTT 5.0**: Latest major version adding advanced features (User Properties, Reason Codes, etc.).

## Connection Configuration

### General
-   **Broker URL**: Server address (e.g., `tcp://localhost:1883` or `ws://localhost:8083`).
-   **Client ID**: Unique client identifier.
-   **Clean Session**:
    -   *Enabled*: New session on each connection.
    -   *Disabled*: Resume existing session (queued messages delivered).
-   **Keep Alive**: Interval (in seconds) to keep the connection active.
-   **Connect Timeout**: Maximum wait time for connection.

### Transport
-   **TCP**: Standard socket connection.
-   **WebSocket**:
    -   **Path**: WebSocket endpoint path (e.g., `/mqtt`).
    -   **Headers**: Custom HTTP headers to include during handshake.

### Authentication
-   **Type**: None, Username/Password.
-   **Username**: Username.
-   **Password**: Password.

### Security (TLS/SSL)
-   **TLS Mode**: Enable encryption.
-   **Certificates & Keys**:
    -   **CA Certificate**: Certificate Authority certificate.
    -   **Client Certificate**: Client certificate (mutual authentication).
    -   **Client Key**: Client private key.
-   **Insecure Skip Verify**: Ignore server certificate validation (useful for development/self-signed certificates).

## Advanced Features (MQTT 5.0)

For MQTT 5.0, additional options are available:
-   **Auto Reconnect**: Automatic reconnection in case of loss.
-   **Session Expiry Interval**: Session retention duration by the broker (in seconds).
-   **Receive Maximum**: Maximum number of unacknowledged messages allowed.
-   **Maximum Packet Size**: Maximum supported packet size.
-   **Topic Alias Maximum**: Maximum number of topic aliases.
-   **Request/Response Info**: Request response information from the broker.
-   **User Properties**: Custom metadata (key-value) sent during connection.

## Last Will & Testament (LWT)

Configuration of the message sent by the broker if the client disconnects unexpectedly.
-   **Topic**: LWT message topic.
-   **Payload**: Message content.
-   **QoS**: Quality of Service (0, 1, 2).
-   **Retain**: Retain the message.
-   **Delay (MQTT 5)**: Delay before sending LWT.
-   **Message Expiry (MQTT 5)**: LWT message expiry.
-   **User Properties (MQTT 5)**: LWT metadata.

## Performance
The client is optimized for high throughput (> 10k msg/s) with intelligent display management (Virtual Scrolling) to avoid freezing the interface.
