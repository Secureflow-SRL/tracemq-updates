# NATS

Client pour le système de messagerie haute performance NATS (NATS Core et JetStream compatibles).

## Configuration

### Connexion
-   **URL** : Liste des serveurs NATS séparés par des virgules (ex: `nats://localhost:4222`).
-   **Subject Prefix** : Préfixe optionnel appliqué à toutes les publications/souscriptions.

### Authentification
TraceMQ supporte la majorité des mécanismes d'authentification NATS :
1.  **Aucune** : Connexion anonyme.
2.  **Token** : Authentification par jeton unique.
3.  **User/Pass** : Nom d'utilisateur et mot de passe classiques.
4.  **NKey** : Authentification par clés Ed25519 (Seed File requis).
5.  **JWT (JSON Web Token)** : Utilisation de JWT signés (souvent couplé avec NKey).
    -   *Fichier JWT* : Chemin vers le fichier `.creds` ou `.jwt`.

### Fonctionnalités Clés
-   **Pub/Sub** : Publication et abonnement ultra-rapides.
-   **Request-Reply** : Pattern de requête-réponse natif.
-   **Wildcards** : Support des jokers `*` (token matching) et `>` (full depth matching).
-   **Queue Groups** : Répartition de charge entre abonnés (Load Balancing).

## Performance
NATS est conçu pour la performance pure. Le client TraceMQ tire parti de cette légèreté pour afficher les flux de données avec une latence minimale.
