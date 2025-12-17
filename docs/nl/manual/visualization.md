# Visualisatiemodi

TraceMQ biedt drie hoofdmodi om uw gegevens in real-time te visualiseren en analyseren.

## 1. Lijst & Hiërarchie (Berichtenweergave)

Dit is de standaardweergave voor het inspecteren van de ruwe stroom van berichten. Het biedt twee submodi:

### Lijstmodus (List)
Toont berichten chronologisch (van nieuwst naar oudst of omgekeerd).

*   **Gebruik**: Ideaal om de doorvoer, aankomstvolgorde en eventlogs te zien.
*   **Virtual Scrolling**: In staat om miljoenen berichten weer te geven zonder de interface te vertragen.
*   **Functies**:
    *   **Auto-Scroll**: Volgt de stroom in real-time.
    *   **Pauze**: Bevriest het scrollen voor inspectie.
    *   **Filters**: Zoeken op Topic, Payload of ID.

### Hiërarchiemodus (Boomstructuur / Tree)
Organiseert berichten als een boomstructuur op basis van de topicstructuur (bijv. `fabriek/ruimte1/temp`).

*   **Gebruik**: Perfect om uw topicstructuur te begrijpen en de *laatst bekende status* van elk knooppunt te zien.
*   **Diff Viewer**:
    *   Selecteer een knooppunt om het laatste bericht te zien.
    *   Schakel de **"Diff"** modus in om de exacte wijzigingen ten opzichte van het vorige bericht te zien (toevoeging, verwijdering, wijziging van JSON-velden).
    *   Wijzigingen worden groen (toevoeging) en rood (verwijdering) gemarkeerd.

---

## 2. Dashboard

Het Dashboard maakt het mogelijk aangepaste bewakingsinterfaces te creëren op basis van ontvangen gegevens.

*   **Werking**: U voegt "Widgets" toe die gekoppeld zijn aan specifieke JSON-paden in uw berichten (bijv. `payload.temperatuur`).
*   **Widgettypes**:
    *   **Last Value**: Toont de laatst ontvangen waarde (bijv. "24.5 °C").
    *   **Status**: Visuele indicator (Groen/Rood) op basis van een voorwaarde (bijv. `status == "OK"`).
    *   **Grafiek (Time Series)**: Real-time evolutiecurve.
    *   **Meter (Gauge)**: Niveau-indicator (Min/Max).
*   **Organisatie**: Formaat aanpasbaar en verplaatsbaar via Drag & Drop.

---

## 3. Topologische Kaart (Map)

Een grafische en interactieve visualisatie van uw topicnetwerk.

*   **Knooppunten & Links**: Elk topicsegment wordt een knooppunt. Ouder-kind relaties worden dynamisch getekend.
*   **Smart Extraction**:
    *   Klik op een knooppunt dat JSON bevat.
    *   TraceMQ kan automatisch variabelen extraheren en virtuele knooppunten maken om ze in de grafiek te visualiseren.
    *   Ondersteunt complexe structuren (arrays van objecten, Sparkplug B meetwaarden).
*   **Heatmap**: Visualiseer activiteitsfrequentie. Knooppunten die veel berichten ontvangen lichten op ("Heet") om knelpunten of praatgrage publishers te identificeren.
*   **Suggesties**: De tool kan de grafiek analyseren om filters of geoptimaliseerde abonnementen voor te stellen.
