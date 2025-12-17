# Client MQTT

TraceMQ intègre un client MQTT robuste et complet, prenant en charge les dernières spécifications du protocole.

## Versions Supportées

-   **MQTT 3.1**
-   **MQTT 3.1.1** : Standard largement répandu.
-   **MQTT 5.0** : Dernière version majeure ajoutant des fonctionnalités avancées (User Properties, Reason Codes, etc.).

## Configuration de la Connexion

### Général
-   **Broker URL** : Adresse du serveur (ex: `tcp://localhost:1883` ou `ws://localhost:8083`).
-   **Client ID** : Identifiant unique du client.
-   **Clean Session** :
    -   *Activé* : Nouvelle session à chaque connexion.
    -   *Désactivé* : Reprise de la session existante (messages en file d'attente délivrés).
-   **Keep Alive** : Intervalle (en secondes) pour maintenir la connexion active.
-   **Connect Timeout** : Temps maximal d'attente pour la connexion.

### Transport
-   **TCP** : Connexion socket standard.
-   **WebSocket** :
    -   **Path** : Chemin de l'endpoint WebSocket (ex: `/mqtt`).
    -   **Headers** : En-têtes HTTP personnalisés à inclure lors du handshake.

### Authentification
-   **Type** : Aucune, Utilisateur/Mot de passe.
-   **Username** : Nom d'utilisateur.
-   **Password** : Mot de passe.

### Sécurité (TLS/SSL)
-   **Mode TLS** : Activation du chiffrement.
-   **Certificats & Clés** :
    -   **CA Certificate** : Certificat de l'autorité de certification.
    -   **Client Certificate** : Certificat du client (authentification mutuelle).
    -   **Client Key** : Clé privée du client.
-   **Insecure Skip Verify** : Ignorer la validation du certificat serveur (utile pour le développement/certificats auto-signés).

## Fonctionnalités Avancées (MQTT 5.0)

Pour MQTT 5.0, des options supplémentaires sont disponibles :
-   **Auto Reconnect** : Reconnexion automatique en cas de perte.
-   **Session Expiry Interval** : Durée de conservation de la session par le broker (en secondes).
-   **Receive Maximum** : Nombre maximal de messages non-acquittés autorisés.
-   **Maximum Packet Size** : Taille maximale des paquets supportée.
-   **Topic Alias Maximum** : Nombre maximal d'alias de topics.
-   **Request/Response Info** : Demande d'informations de réponse au broker.
-   **User Properties** : Métadonnées personnalisées (clé-valeur) envoyées lors de la connexion.

## Last Will & Testament (LWT)

Configuration du message envoyé par le broker si le client se déconnecte de manière inattendue.
-   **Topic** : Sujet du message LWT.
-   **Payload** : Contenu du message.
-   **QoS** : Qualité de service (0, 1, 2).
-   **Retain** : Retenir le message.
-   **Délai (MQTT 5)** : Délai avant envoi du LWT.
-   **Message Expiry (MQTT 5)** : Expiration du message LWT.
-   **User Properties (MQTT 5)** : Métadonnées LWT.

## Performance
Le client est optimisé pour des débits élevés (> 10k msg/s) avec gestion intelligente de l'affichage (Virtual Scrolling) pour éviter de figer l'interface.
