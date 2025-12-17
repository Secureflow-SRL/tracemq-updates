# MQTT Client

TraceMQ integreert een robuuste en complete MQTT-client, die de nieuwste protocolspecificaties ondersteunt.

## Ondersteunde Versies

-   **MQTT 3.1**
-   **MQTT 3.1.1**: Wijdverbreide standaard.
-   **MQTT 5.0**: Nieuwste hoofdversie met geavanceerde functies (User Properties, Reason Codes, enz.).

## Verbindingsconfiguratie

### Algemeen
-   **Broker URL**: Serveradres (bijv. `tcp://localhost:1883` of `ws://localhost:8083`).
-   **Client ID**: Unieke client-ID.
-   **Clean Session**:
    -   *Ingeschakeld*: Nieuwe sessie bij elke verbinding.
    -   *Uitgeschakeld*: Bestaande sessie hervatten (wachtrijberichten afgeleverd).
-   **Keep Alive**: Interval (in seconden) om de verbinding actief te houden.
-   **Connect Timeout**: Maximale wachttijd voor verbinding.

### Transport
-   **TCP**: Standaard socketverbinding.
-   **WebSocket**:
    -   **Pad**: WebSocket eindpuntpad (bijv. `/mqtt`).
    -   **Headers**: Aangepaste HTTP-headers om op te nemen tijdens handshake.

### Authenticatie
-   **Type**: Geen, Gebruikersnaam/Wachtwoord.
-   **Username**: Gebruikersnaam.
-   **Password**: Wachtwoord.

### Beveiliging (TLS/SSL)
-   **TLS Modus**: Encryptie inschakelen.
-   **Certificaten & Sleutels**:
    -   **CA Certificaat**: Certificaat van de certificeringsinstantie.
    -   **Client Certificaat**: Clientcertificaat (wederzijdse authenticatie).
    -   **Client Sleutel**: Privésleutel van de client.
-   **Insecure Skip Verify**: Validering van servercertificaat negeren (nuttig voor ontwikkeling/zelfondertekende certificaten).

## Geavanceerde Functies (MQTT 5.0)

Voor MQTT 5.0 zijn extra opties beschikbaar:
-   **Auto Reconnect**: Automatisch opnieuw verbinden bij verlies.
-   **Session Expiry Interval**: Duur van sessiebehoud door de broker (in seconden).
-   **Receive Maximum**: Maximum aantal toegestane niet-bevestigde berichten.
-   **Maximum Packet Size**: Maximale ondersteunde pakketgrootte.
-   **Topic Alias Maximum**: Maximum aantal topicaliassen.
-   **Request/Response Info**: Vraag responserinformatie aan de broker.
-   **User Properties**: Aangepaste metadata (sleutel-waarde) verzonden tijdens verbinding.

## Last Will & Testament (LWT)

Configuratie van het bericht dat door de broker wordt verzonden als de client onverwacht de verbinding verbreekt.
-   **Topic**: LWT-berichtonderwerp.
-   **Payload**: Berichtinhoud.
-   **QoS**: Servicekwaliteit (0, 1, 2).
-   **Retain**: Bericht behouden.
-   **Delay (MQTT 5)**: Vertraging voor verzending LWT.
-   **Message Expiry (MQTT 5)**: Verlooptijd LWT-bericht.
-   **User Properties (MQTT 5)**: LWT-metadata.

## Prestaties
De client is geoptimaliseerd voor hoge doorvoer (> 10k msg/s) met slim weergavebeheer (Virtual Scrolling) om vastlopen van de interface te voorkomen.
