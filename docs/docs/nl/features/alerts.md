# Waarschuwingssysteem

Bewaak uw verkeer in real-time met de waarschuwingsengine.

## Regelconfiguratie

Een waarschuwingsregel bestaat uit:
-   **Naam**: Om de waarschuwing te identificeren.
-   **Conditie**: Een logische expressie die bepaalt wanneer de waarschuwing wordt geactiveerd.
-   **Ernst**: Info, Waarschuwing of Fout.

## Syntaxis van Condities
De engine ondersteunt een eenvoudige syntaxis op basis van berichteigenschappen.

-   Eenvoudige vergelijking: `payload.temp > 50`
-   Topic matching: `topic == "sensor/error"`
-   Logische operatoren: `payload.temp > 50 && payload.humidity < 20`
-   Regex: `topic =~ "^factory/.*"` (Ondersteuning afhankelijk van huidige implementatie).

## Meldingen
Wanneer een waarschuwing wordt geactiveerd:
1.  Verschijnt er een Toast-melding boven aan het scherm.
2.  Wordt de waarschuwing geregistreerd in de geschiedenis (toegankelijk via het Bel-pictogram 🔔).
3.  Blijft de geschiedenis behouden totdat deze handmatig wordt gewist.
