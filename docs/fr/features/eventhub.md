# Azure Event Hubs / Kafka

Intégration native avec Azure Event Hubs et compatibilité avec l'écosystème Kafka via le support AMQP.

## Configuration

### Connexion
-   **Connection String** : Chaîne de connexion complète fournie par Azure (incluant Endpoint, SharedAccessKeyName, SharedAccessKey).
-   **Entités** :
    -   **Event Hub Name** : Nom de l'instance Event Hub (Topic).
    -   **Consumer Group** : Groupe de consommateurs (défaut `$Default`).
    -   **Namespace** : Espace de noms (souvent extrait de la connection string).

### Authentification
-   **SAS (Shared Access Signature)** : Utilisation de clés d'accès (RootManageSharedAccessKey ou clés spécifiques).
-   **Azure AD (Active Directory)** : *Support planifié/partiel*.

### Protocole
-   **AMQP** : Protocole standard performant (port 5671).
-   **AMQP over WebSockets** : Pour traverser les pare-feux stricts (port 443).

### Lecture de Messages
-   **Start Position** :
    -   *Earliest* : Lire depuis le début de la rétention.
    -   *Latest* : Lire uniquement les nouveaux messages.
-   **Partition Key** : Cibler une partition spécifique (optionnel).
-   **Batch Size** : Taille des lots de messages.
-   **Max Wait Time** : Temps d'attente max pour un batch.

## Cas d'usage
-   Ingestion massive de données télémétriques.
-   Streaming temps réel depuis le cloud Azure.
-   Debug des pipelines IoT Hub (via endpoint compatible Event Hub).
