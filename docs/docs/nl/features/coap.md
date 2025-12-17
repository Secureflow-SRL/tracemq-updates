# CoAP Verbinding

De CoAP (Constrained Application Protocol) client in TraceMQ maakt interactie met beperkte IoT-apparaten mogelijk.

## Bedrijfsmodi

-   **Client**: Stuurt verzoeken naar een CoAP-server.
-   **Server**: Luistert en reageert op inkomende verzoeken.

## Configuratie

### Algemene Instellingen
-   **Host / Bind Adres**:
    -   *Client*: Doelserveradres (bijv. `coap://localhost:5683`).
    -   *Server*: Luisterinterface (bijv. `0.0.0.0` voor alle interfaces).
-   **Poort**: Standaard UDP-poort 5683 (onbeveiligd) of 5684 (beveiligd).

### Beveiliging

TraceMQ ondersteunt verschillende geavanceerde beveiligingsmodi voor CoAP:

#### 1. DTLS (Datagram Transport Layer Security)
Beveiliging van de transportlaag (TLS-equivalent voor UDP).
-   **Certificaten (X.509)**:
    -   **Client Certificaat**
    -   **Privésleutel**
    -   **Root CA**
-   **PSK (Pre-Shared Key)**: Authenticatie met gedeelde sleutel.
    -   **Identity**: Client-identificatie.
    -   **Key**: Geheime sleutel.

#### 2. OSCORE (Object Security for Constrained RESTful Environments)
Beveiliging van de applicatielaag (end-to-end encryptie).
-   **Master Secret**: Gedeeld mastergeheim.
-   **Sender ID**: Verzender-ID.
-   **Recipient ID**: Ontvanger-ID.
-   **ID Context**: (Optioneel) Beveiligingscontext.

### Functies
-   Ondersteuning voor GET, POST, PUT, DELETE methoden.
-   Observatie van bronnen (Observe optie).
-   Block-wise transfer voor grote payloads.
