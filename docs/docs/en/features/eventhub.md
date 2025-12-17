# Azure Event Hubs / Kafka

Native integration with Azure Event Hubs and compatibility with the Kafka ecosystem via AMQP support.

## Configuration

### Connection
-   **Connection String**: Full connection string provided by Azure (including Endpoint, SharedAccessKeyName, SharedAccessKey).
-   **Entities**:
    -   **Event Hub Name**: Event Hub instance name (Topic).
    -   **Consumer Group**: Consumer group (default `$Default`).
    -   **Namespace**: Namespace (often extracted from the connection string).

### Authentication
-   **SAS (Shared Access Signature)**: Use of access keys (RootManageSharedAccessKey or specific keys).
-   **Azure AD (Active Directory)**: *Planned/Partial support*.

### Protocol
-   **AMQP**: High-performance standard protocol (port 5671).
-   **AMQP over WebSockets**: To traverse strict firewalls (port 443).

### Reading Messages
-   **Start Position**:
    -   *Earliest*: Read from the beginning of retention.
    -   *Latest*: Read only new messages.
-   **Partition Key**: Target a specific partition (optional).
-   **Batch Size**: Message batch size.
-   **Max Wait Time**: Max wait time for a batch.

## Use Cases
-   Massive ingestion of telemetry data.
-   Real-time streaming from Azure cloud.
-   Debugging IoT Hub pipelines (via Event Hub compatible endpoint).
