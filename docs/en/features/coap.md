# CoAP Connection

The CoAP (Constrained Application Protocol) client in TraceMQ allows interaction with constrained IoT devices.

## Operating Modes

-   **Client**: Sends requests to a CoAP server.
-   **Server**: Listens and responds to incoming requests.

## Configuration

### General Settings
-   **Host / Bind Address**:
    -   *Client*: Target server address (e.g., `coap://localhost:5683`).
    -   *Server*: Listening interface (e.g., `0.0.0.0` for all interfaces).
-   **Port**: Standard UDP port 5683 (unsecured) or 5684 (secured).

### Security

TraceMQ supports several advanced security modes for CoAP:

#### 1. DTLS (Datagram Transport Layer Security)
Transport layer security (TLS equivalent for UDP).
-   **Certificates (X.509)**:
    -   **Client Certificate**
    -   **Private Key**
    -   **Root CA**
-   **PSK (Pre-Shared Key)**: Shared key authentication.
    -   **Identity**: Client identifier.
    -   **Key**: Secret key.

#### 2. OSCORE (Object Security for Constrained RESTful Environments)
Application layer security (end-to-end encryption).
-   **Master Secret**: Shared master secret.
-   **Sender ID**: Sender ID.
-   **Recipient ID**: Recipient ID.
-   **ID Context**: (Optional) Security context.

### Features
-   Support for GET, POST, PUT, DELETE methods.
-   Resource observation (Observe option).
-   Block-wise transfer for large payloads.
