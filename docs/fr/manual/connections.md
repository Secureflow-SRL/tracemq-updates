# Gestion des Connexions

TraceMQ supporte une large gamme de protocoles de messagerie. Chaque connexion est sauvegardée dans un "Profil" réutilisable.

## Créer un Profil

1.  Ouvrez le modal de création (Bouton "+").
2.  **Nom** : Donnez un nom identifiant (ex: "Prod Cluster").
3.  **Protocole** : Sélectionnez le protocole adapté à votre infrastructure.

---

## Profils Supportés

### 1. MQTT (Message Queuing Telemetry Transport)
Le standard de l'IoT. TraceMQ supporte MQTT v3.1, v3.1.1 et v5.0.

*   **Particularités** :
    *   **Versions** : Support complet de MQTT 5.0 (User Properties, Reason Codes, Session Expiry).
    *   **Keep Alive** : Maintien de la connexion actif paramétrable.
    *   **Clean Session** :
        *   *Clean* : Nouvelle session à chaque connexion.
        *   *Persistent* : Reprise des messages manqués à la reconnexion.
    *   **Last Will & Testament (LWT)** : Message "d'adieu" envoyé automatiquement par le broker si le client se déconnecte brutalement.

### 2. NATS & NATS JetStream
Pour les systèmes haute performance et les architectures micro-services.

*   **Configuration** :
    *   **URL** : Format `nats://localhost:4222`. Supporte le clustering (séparé par des virgules).
    *   **Subject Prefix** : Préfixe global appliqué à toutes les publications/souscriptions.
    *   **Authentification** :
        *   *Token* : Jeton simple.
        *   *User/Pass* : Identifiants classiques.
        *   *NKey* : Authentification cryptographique (Ed25519).
        *   *JWT* : Support des fichiers `.creds` pour NATS sécurisé (Synadia/NGS).
*   **Fonctionnalités** :
    *   **Pub/Sub** : Échange de messages ultra-rapide.
    *   **Wildcards** : Supporte `*` (token unique) et `>` (multi-tokens).
    *   **Queue Groups** : Permet le load-balancing entre plusieurs consommateurs.

### 3. Azure Event Hubs / Kafka
Intégration native avec l'écosystème Azure et Kafka via AMQP.

*   **Configuration** :
    *   **Connection String** : La chaîne complète fournie par Azure (Endpoint + SharedAccessKey).
    *   **Entity Path** : Nom de l'Event Hub (Topic).
    *   **Consumer Group** : Par défaut `$Default`.
*   **Particularités** :
    *   **Position de lecture** :
        *   *Earliest* : Relire tout l'historique disponible (Rétention).
        *   *Latest* : Voir uniquement les nouveaux messages.
    *   **AMQP over WebSocket** : Option pour contourner les pare-feux stricts (port 443).
    *   **Partitions** : Support de la lecture par partition spécifique ou globale (via Partition Key).

### 4. CoAP (Constrained Application Protocol)
Pour les appareils IoT très contraints (UDP).

*   **Modes** :
    *   **Client** : Envoie des requêtes (GET, PUT, POST, DELETE) vers un serveur CoAP.
    *   **Serveur** : TraceMQ agit comme un serveur et écoute les messages entrants sur le port 5683.

### 5. WebSocket
Pour tester des endpoints raw socket ou des serveurs personnalisés qui n'utilisent pas de protocole standard au-dessus de TCP/WS.

---

## Sécurité & Authentification

TraceMQ gère les mécanismes de sécurité avancés pour tous les protocoles :

*   **TLS/SSL (mTLS)** :
    *   Chargez vos certificats : **CA**, **Certificat Client**, et **Clé Privée**.
    *   Option `Insecure Skip Verify` pour les environnements de dev avec certificats auto-signés.
*   **User/Password** : Standard pour la plupart des brokers.

## Fonctionnalités Communes

*   **Mode Serveur** : TraceMQ peut écouter au lieu d'initier la connexion (utile pour CoAP ou les tests locaux).
*   **Export/Partage** : Clic droit sur un profil pour l'exporter (les clés privées sont exclues par sécurité) et le partager avec votre équipe.
