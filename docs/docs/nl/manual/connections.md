# Verbindingen Beheren

TraceMQ ondersteunt een breed scala aan berichtenprotocollen. Elke verbinding wordt opgeslagen in een herbruikbaar "Profiel".

## Een Profiel Maken

1.  Open de aanmaakmodal ("+" Knop).
2.  **Naam**: Geef een identificerende naam (bijv. "Prod Cluster").
3.  **Protocol**: Selecteer het protocol dat bij uw infrastructuur past.

---

## Ondersteunde Profielen

### 1. MQTT (Message Queuing Telemetry Transport)
De standaard voor IoT. TraceMQ ondersteunt MQTT v3.1, v3.1.1 en v5.0.

*   **Kenmerken**:
    *   **Versies**: Volledige ondersteuning voor MQTT 5.0 (User Properties, Reason Codes, Session Expiry).
    *   **Keep Alive**: Configureerbaar verbindingsbehoud.
    *   **Clean Session**:
        *   *Clean*: Nieuwe sessie bij elke verbinding.
        *   *Persistent*: Hervat gemiste berichten bij herverbinding.
    *   **Last Will & Testament (LWT)**: "Afscheidsbericht" dat automatisch door de broker wordt verzonden als de client abrupt de verbinding verbreekt.

### 2. NATS & NATS JetStream
Voor high-performance systemen en microservices-architecturen.

*   **Configuratie**:
    *   **URL**: Formaat `nats://localhost:4222`. Ondersteunt clustering (komma-gescheiden).
    *   **Subject Prefix**: Globaal prefix toegepast op alle publicaties/abonnementen.
    *   **Authenticatie**:
        *   *Token*: Eenvoudig token.
        *   *User/Pass*: Klassieke inloggegevens.
        *   *NKey*: Cryptografische authenticatie (Ed25519).
        *   *JWT*: Ondersteuning voor `.creds` bestanden voor beveiligde NATS (Synadia/NGS).
*   **Functies**:
    *   **Pub/Sub**: Ultrasnelle berichtenuitwisseling.
    *   **Wildcards**: Ondersteunt `*` (enkel token) en `>` (multi-token).
    *   **Queue Groups**: Maakt load-balancing mogelijk tussen meerdere consumenten.

### 3. Azure Event Hubs / Kafka
Native integratie met het Azure ecosysteem en Kafka via AMQP.

*   **Configuratie**:
    *   **Connection String**: De volledige string geleverd door Azure (Endpoint + SharedAccessKey).
    *   **Entity Path**: Naam van de Event Hub (Topic).
    *   **Consumer Group**: Standaard `$Default`.
*   **Bijzonderheden**:
    *   **Leespositie**:
        *   *Earliest*: Lees alle beschikbare geschiedenis (Retentie).
        *   *Latest*: Zie alleen nieuwe berichten.
    *   **AMQP over WebSocket**: Optie om strikte firewalls te omzeilen (poort 443).
    *   **Partitions**: Ondersteuning voor lezen per specifieke partitie of globaal (via Partition Key).

### 4. CoAP (Constrained Application Protocol)
Voor zeer beperkte IoT-apparaten (UDP).

*   **Modi**:
    *   **Client**: Stuurt verzoeken (GET, PUT, POST, DELETE) naar een CoAP-server.
    *   **Server**: TraceMQ fungeert als server en luistert naar inkomende berichten op poort 5683.

### 5. WebSocket
Voor het testen van raw socket eindpunten of aangepaste servers die geen standaardprotocol over TCP/WS gebruiken.

---

## Beveiliging & Authenticatie

TraceMQ beheert geavanceerde beveiligingsmechanismen voor alle protocollen:

*   **TLS/SSL (mTLS)**:
    *   Laad uw certificaten: **CA**, **Client Certificaat**, en **Privésleutel**.
    *   `Insecure Skip Verify` optie voor dev-omgevingen met self-signed certificaten.
*   **User/Password**: Standaard voor de meeste brokers.

## Gemeenschappelijke Functies

*   **Server Modus**: TraceMQ kan luisteren in plaats van de verbinding te initiëren (nuttig voor CoAP of lokale tests).
*   **Exporteren/Delen**: Klik met de rechtermuisknop op een profiel om het te exporteren (privésleutels worden om veiligheidsredenen uitgesloten) en te delen met uw team.
