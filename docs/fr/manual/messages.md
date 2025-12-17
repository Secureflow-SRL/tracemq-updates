# Visualisation des Messages

Le cœur de TraceMQ est la liste de messages en temps réel.

## Liste des Messages
-   **Auto-Scroll** : Par défaut, la liste défile. Mettez en pause pour inspecter un message.
-   **Filtrage** : Utilisez la barre de recherche en haut.
    -   Texte simple : `error`
    -   Topic : `topic:sensor/temp`
    -   Payload (JSON) : `payload.value > 20` (si supporté par le filtre avancé).

## Détail du Message
Cliquez sur un message pour ouvrir le panneau latéral droit.
-   **Format** : TraceMQ détecte automatiquement JSON, XML, Hex, ou Texte brut.
-   **Décodage Protobuf** : Si vous avez configuré des schémas `.proto`, les messages binaires seront décodés automatiquement.
-   **Métadonnées** : Affiche le QoS, Retain flag, Timestamp précis, et ID du message.

## Diff Viewer
Sélectionnez deux messages (Ctrl+Clic) pour voir les différences exactes entre leurs payloads. Utile pour déboguer des changements d'état subtils.
