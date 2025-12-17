# Berichtvisualisatie

De kern van TraceMQ is de real-time berichtenlijst.

## Berichtenlijst
-   **Auto-Scroll**: De lijst scrolt standaard. Pauzeer om een bericht te inspecteren.
-   **Filteren**: Gebruik de zoekbalk bovenaan.
    -   Eenvoudige tekst: `error`
    -   Topic: `topic:sensor/temp`
    -   Payload (JSON): `payload.value > 20` (indien ondersteund door geavanceerd filter).

## Berichtdetails
Klik op een bericht om de rechter zijbalk te openen.
-   **Formaat**: TraceMQ detecteert automatisch JSON, XML, Hex, of Platte Tekst.
-   **Protobuf Decodering**: Als u `.proto` schema's heeft geconfigureerd, worden binaire berichten automatisch gedecodeerd.
-   **Metadata**: Toont QoS, Retain flag, exact tijdstempel en Bericht-ID.

## Diff Viewer
Selecteer twee berichten (Ctrl+Klik) om de exacte verschillen tussen hun payloads te zien. Handig voor het debuggen van subtiele statuswijzigingen.
