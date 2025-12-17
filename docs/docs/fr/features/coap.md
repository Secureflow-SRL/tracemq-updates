# Connexion CoAP

Le client CoAP (Constrained Application Protocol) de TraceMQ permet l'interaction avec des dispositifs contraints IoT.

## Modes de Fonctionnement

-   **Client** : Envoie des requêtes vers un serveur CoAP.
-   **Serveur** : Écoute et répond aux requêtes entrantes.

## Configuration

### Paramètres Généraux
-   **Host / Bind Address** :
    -   *Client* : Adresse du serveur cible (ex: `coap://localhost:5683`).
    -   *Serveur* : Interface d'écoute (ex: `0.0.0.0` pour toutes les interfaces).
-   **Port** : Port UDP standard 5683 (non sécurisé) ou 5684 (sécurisé).

### Sécurité

TraceMQ supporte plusieurs modes de sécurité avancés pour CoAP :

#### 1. DTLS (Datagram Transport Layer Security)
Sécurisation de la couche transport (équivalent TLS pour UDP).
-   **Certificats (X.509)** :
    -   **Certificat Client**
    -   **Clé Privée**
    -   **CA Root**
-   **PSK (Pre-Shared Key)** : Authentification par clé partagée.
    -   **Identity** : Identifiant du client.
    -   **Key** : Clé secrète.

#### 2. OSCORE (Object Security for Constrained RESTful Environments)
Sécurisation de la couche application (chiffrement de bout en bout).
-   **Master Secret** : Secret maître partagé.
-   **Sender ID** : ID de l'émetteur.
-   **Recipient ID** : ID du destinataire.
-   **ID Context** : (Optionnel) Contexte de sécurité.

### Fonctionnalités
-   Support des méthodes GET, POST, PUT, DELETE.
-   Observation des ressources (Observe option).
-   Block-wise transfer pour les gros payloads.
