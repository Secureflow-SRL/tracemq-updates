# Azure Event Hubs / Kafka

Native integratie met Azure Event Hubs en compatibiliteit met het Kafka-ecosysteem via AMQP-ondersteuning.

## Configuratie

### Verbinding
-   **Connection String**: Volledige verbindingsreeks geleverd door Azure (inclusief Endpoint, SharedAccessKeyName, SharedAccessKey).
-   **Entiteiten**:
    -   **Event Hub Naam**: Naam van de Event Hub instantie (Topic).
    -   **Consumer Group**: Consumentengroep (standaard `$Default`).
    -   **Namespace**: Naamruimte (vaak geëxtraheerd uit de connection string).

### Authenticatie
-   **SAS (Shared Access Signature)**: Gebruik van toegangssleutels (RootManageSharedAccessKey of specifieke sleutels).
-   **Azure AD (Active Directory)**: *Geplande/Gedeeltelijke ondersteuning*.

### Protocol
-   **AMQP**: High-performance standaardprotocol (poort 5671).
-   **AMQP over WebSockets**: Om strikte firewalls te passeren (poort 443).

### Berichten Lezen
-   **Startpositie**:
    -   *Earliest*: Lees vanaf het begin van de retentie.
    -   *Latest*: Lees alleen nieuwe berichten.
-   **Partition Key**: Richt op een specifieke partitie (optioneel).
-   **Batch Size**: Grootte van batchberichten.
-   **Max Wait Time**: Maximale wachttijd voor een batch.

## Gebruiksscenario's
-   Massale inname van telemetriegegevens.
-   Real-time streaming vanuit de Azure-cloud.
-   Debuggen van IoT Hub pipelines (via Event Hub compatibel eindpunt).
