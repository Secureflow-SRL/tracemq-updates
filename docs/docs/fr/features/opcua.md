# Connexion OPC UA

TraceMQ agit comme un client ou serveur OPC UA complet, compatible avec les standards industriels d'automatisation.

## Rôles Supportés

-   **Client** : Connexion à des automates (PLC), serveurs SCADA ou autres serveurs OPC UA.
-   **Serveur** : Simule un serveur OPC UA pour exposer des données à d'autres clients.

## Configuration de la Connexion

### Endpoint
-   **Endpoint URL** : Adresse du serveur (ex: `opc.tcp://localhost:4840`).
-   **Bind Address** (Serveur uniquement) : Interface d'écoute.
-   **Port** : Port TCP (défaut 4840).

### Sécurité (Security Policy & Mode)
Configuration fine du niveau de chiffrement et signature :

-   **Security Policy** :
    -   *None*
    -   *Basic256*
    -   *Basic256Sha256*
    -   *Aes128_Sha256_RsaOaep*
    -   *Aes256_Sha256_RssPss*
-   **Security Mode** :
    -   *None* : Pas de sécurité.
    -   *Sign* : Signature des messages uniquement.
    -   *SignAndEncrypt* : Signature et chiffrement complet.

### Authentification Utilisateur
Méthode d'identification auprès du serveur :
-   **Anonymous** : Connexion sans identifiants.
-   **UserName** : Nom d'utilisateur et mot de passe.
-   **Certificate** : Authentification par certificat X.509.

### Certificats d'Application
-   **Certificat Local** : Certificat de l'instance TraceMQ.
-   **Clé Privée** : Clé associée.
-   **Auto Accept Certs** : Accepter automatiquement les certificats inconnus (utile en dev).

## Fonctionnalités
-   **Navigation (Browsing)** : Exploration de l'arborescence des nœuds du serveur.
-   **Lecture/Écriture** : Interaction avec les variables.
-   **Monitoring (Subscriptions)** : Abonnement aux changements de valeurs (Monitored Items) avec intervalle d'échantillonnage configurable.
-   **Méthodes** : Appel de méthodes RPC exposées par le serveur.
