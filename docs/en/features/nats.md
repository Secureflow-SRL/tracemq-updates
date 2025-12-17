# NATS

Client for the NATS high-performance messaging system (NATS Core and JetStream compatible).

## Configuration

### Connection
-   **URL**: Comma-separated list of NATS servers (e.g., `nats://localhost:4222`).
-   **Subject Prefix**: Optional prefix applied to all publications/subscriptions.

### Authentication
TraceMQ supports the majority of NATS authentication mechanisms:
1.  **None**: Anonymous connection.
2.  **Token**: Single token authentication.
3.  **User/Pass**: Classic username and password.
4.  **NKey**: Ed25519 key authentication (Seed File required).
5.  **JWT (JSON Web Token)**: Use of signed JWTs (often coupled with NKey).
    -   *JWT File*: Path to the `.creds` or `.jwt` file.

### Key Features
-   **Pub/Sub**: Ultra-fast publication and subscription.
-   **Request-Reply**: Native request-response pattern.
-   **Wildcards**: Support for wildcards `*` (token matching) and `>` (full depth matching).
-   **Queue Groups**: Load distribution among subscribers (Load Balancing).

## Performance
NATS is designed for pure performance. The TraceMQ client leverages this lightweight nature to display data streams with minimal latency.
