# Managing Connections

TraceMQ supports a wide range of messaging protocols. Each connection is saved in a reusable "Profile".

## Creating a Profile

1.  Open the creation modal ("+" Button).
2.  **Name**: Give an identifying name (e.g., "Prod Cluster").
3.  **Protocol**: Select the protocol suitable for your infrastructure.

---

## Supported Profiles

### 1. MQTT (Message Queuing Telemetry Transport)
The standard for IoT. TraceMQ supports MQTT v3.1, v3.1.1, and v5.0.

*   **Features**:
    *   **Versions**: Full support for MQTT 5.0 (User Properties, Reason Codes, Session Expiry).
    *   **Keep Alive**: Configurable connection maintenance.
    *   **Clean Session**:
        *   *Clean*: New session on each connection.
        *   *Persistent*: Resume missed messages upon reconnection.
    *   **Last Will & Testament (LWT)**: "Goodbye" message automatically sent by the broker if the client disconnects ungracefully.

### 2. NATS & NATS JetStream
For high-performance systems and microservices architectures.

*   **Configuration**:
    *   **URL**: Format `nats://localhost:4222`. Supports clustering (comma-separated).
    *   **Subject Prefix**: Global prefix applied to all publications/subscriptions.
    *   **Authentication**:
        *   *Token*: Simple token.
        *   *User/Pass*: Classic credentials.
        *   *NKey*: Cryptographic authentication (Ed25519).
        *   *JWT*: Support for `.creds` files for secure NATS (Synadia/NGS).
*   **Features**:
    *   **Pub/Sub**: Ultra-fast message exchange.
    *   **Wildcards**: Supports `*` (single token) and `>` (multi-token).
    *   **Queue Groups**: Allows load-balancing between multiple consumers.

### 3. Azure Event Hubs / Kafka
Native integration with the Azure ecosystem and Kafka via AMQP.

*   **Configuration**:
    *   **Connection String**: The full string provided by Azure (Endpoint + SharedAccessKey).
    *   **Entity Path**: Event Hub Name (Topic).
    *   **Consumer Group**: Default `$Default`.
*   **Particulars**:
    *   **Read Position**:
        *   *Earliest*: Read all available history (Retention).
        *   *Latest*: See only new messages.
    *   **AMQP over WebSocket**: Option to bypass strict firewalls (port 443).
    *   **Partitions**: Support for reading by specific partition or globally (via Partition Key).

### 4. CoAP (Constrained Application Protocol)
For highly constrained IoT devices (UDP).

*   **Modes**:
    *   **Client**: Sends requests (GET, PUT, POST, DELETE) to a CoAP server.
    *   **Server**: TraceMQ acts as a server and listens for incoming messages on port 5683.

### 5. WebSocket
For testing raw socket endpoints or custom servers that do not use a standard protocol over TCP/WS.

---

## Security & Authentication

TraceMQ manages advanced security mechanisms for all protocols:

*   **TLS/SSL (mTLS)**:
    *   Load your certificates: **CA**, **Client Certificate**, and **Private Key**.
    *   `Insecure Skip Verify` option for dev environments with self-signed certificates.
*   **User/Password**: Standard for most brokers.

## Common Features

*   **Server Mode**: TraceMQ can listen instead of initiating the connection (useful for CoAP or local testing).
*   **Export/Share**: Right-click on a profile to export it (private keys are excluded for security) and share it with your team.
