# OPC UA Connection

TraceMQ acts as a complete OPC UA client or server, compatible with industrial automation standards.

## Supported Roles

-   **Client**: Connect to PLCs, SCADA servers, or other OPC UA servers.
-   **Server**: Simulates an OPC UA server to expose data to other clients.

## Connection Configuration

### Endpoint
-   **Endpoint URL**: Server address (e.g., `opc.tcp://localhost:4840`).
-   **Bind Address** (Server only): Listening interface.
-   **Port**: TCP port (default 4840).

### Security (Security Policy & Mode)
Fine-grained configuration of encryption and signing levels:

-   **Security Policy**:
    -   *None*
    -   *Basic256*
    -   *Basic256Sha256*
    -   *Aes128_Sha256_RsaOaep*
    -   *Aes256_Sha256_RssPss*
-   **Security Mode**:
    -   *None*: No security.
    -   *Sign*: Message signing only.
    -   *SignAndEncrypt*: Full signing and encryption.

### User Authentication
Method of identification with the server:
-   **Anonymous**: Connection without credentials.
-   **UserName**: Username and password.
-   **Certificate**: Authentication via X.509 certificate.

### Application Certificates
-   **Local Certificate**: Certificate of the TraceMQ instance.
-   **Private Key**: Associated key.
-   **Auto Accept Certs**: Automatically accept unknown certificates (useful in dev).

## Features
-   **Browsing**: Explore the server's node tree.
-   **Read/Write**: Interact with variables.
-   **Monitoring (Subscriptions)**: Subscribe to value changes (Monitored Items) with configurable sampling interval.
-   **Methods**: Call RPC methods exposed by the server.
