# OPC UA Verbinding

TraceMQ fungeert als een volledige OPC UA client of server, compatibel met industriële automatiseringsstandaarden.

## Ondersteunde Rollen

-   **Client**: Verbind met PLC's, SCADA-servers of andere OPC UA-servers.
-   **Server**: Simuleert een OPC UA-server om gegevens aan andere clients bloot te stellen.

## Verbindingsconfiguratie

### Eindpunt
-   **Endpoint URL**: Serveradres (bijv. `opc.tcp://localhost:4840`).
-   **Bind Address** (Alleen Server): Luisterinterface.
-   **Poort**: TCP-poort (standaard 4840).

### Beveiliging (Security Policy & Mode)
Fijnmazige configuratie van encryptie- en ondertekeningsniveaus:

-   **Security Policy**:
    -   *None*
    -   *Basic256*
    -   *Basic256Sha256*
    -   *Aes128_Sha256_RsaOaep*
    -   *Aes256_Sha256_RssPss*
-   **Security Mode**:
    -   *None*: Geen beveiliging.
    -   *Sign*: Alleen berichtondertekening.
    -   *SignAndEncrypt*: Volledige ondertekening en encryptie.

### Gebruikersauthenticatie
Identificatiemethode bij de server:
-   **Anonymous**: Verbinding zonder inloggegevens.
-   **UserName**: Gebruikersnaam en wachtwoord.
-   **Certificate**: Authenticatie via X.509 certificaat.

### Applicatiecertificaten
-   **Lokaal Certificaat**: Certificaat van de TraceMQ-instantie.
-   **Privésleutel**: Bijbehorende sleutel.
-   **Auto Accept Certs**: Onbekende certificaten automatisch accepteren (nuttig in dev).

## Functies
-   **Browsing**: Verken de knooppuntenboom van de server.
-   **Lezen/Schrijven**: Interageer met variabelen.
-   **Monitoring (Subscriptions)**: Abonneer op waardewijzigingen (Monitored Items) met configureerbaar bemonsteringsinterval.
-   **Methoden**: Roep RPC-methoden aan die door de server worden blootgesteld.
