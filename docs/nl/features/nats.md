# NATS

Client voor het NATS high-performance berichtensysteem (NATS Core en JetStream compatibel).

## Configuratie

### Verbinding
-   **URL**: Komma-gescheiden lijst van NATS-servers (bijv. `nats://localhost:4222`).
-   **Subject Prefix**: Optionele prefix toegepast op alle publicaties/abonnementen.

### Authenticatie
TraceMQ ondersteunt de meeste NATS-authenticatiemechanismen:
1.  **Geen**: Anonieme verbinding.
2.  **Token**: Enkelvoudige token-authenticatie.
3.  **User/Pass**: Klassieke gebruikersnaam en wachtwoord.
4.  **NKey**: Ed25519 sleutelauthenticatie (Seed Bestand vereist).
5.  **JWT (JSON Web Token)**: Gebruik van ondertekende JWT's (vaak gekoppeld aan NKey).
    -   *JWT Bestand*: Pad naar het `.creds` of `.jwt` bestand.

### Belangrijkste Functies
-   **Pub/Sub**: Ultrasnelle publicatie en abonnement.
-   **Request-Reply**: Native request-response patroon.
-   **Wildcards**: Ondersteuning voor wildcards `*` (token matching) en `>` (full depth matching).
-   **Queue Groups**: Belastingverdeling tussen abonnees (Load Balancing).

## Prestaties
NATS is ontworpen voor pure prestaties. De TraceMQ-client maakt gebruik van deze lichtheid om gegevensstromen met minimale latentie weer te geven.
