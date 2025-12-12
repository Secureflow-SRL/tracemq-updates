# TraceMQ Updates Registry

Bienvenue sur le registre officiel des mises à jour de **TraceMQ**.

Ce dépôt sert de source de vérité pour le mécanisme de mise à jour automatique de l'application TraceMQ. Il héberge les manifestes de versions signés numériquement, garantissant l'intégrité et l'authenticité de chaque mise à jour distribuée à nos utilisateurs.

> ⚠️ **Avertissement : Phase de Test (Beta)**
>
> L'application **TraceMQ** est actuellement en phase de développement actif et de test (Bêta). Bien que nous fassions tout notre possible pour garantir la stabilité et la sécurité du logiciel :
> *   Des bugs ou des comportements inattendus peuvent survenir.
> *   L'utilisation de ce logiciel se fait à vos propres risques.
> *   **SecureFlow SRL** décline toute responsabilité en cas de perte de données, d'interruption de service ou de tout autre dommage direct ou indirect résultant de l'utilisation de TraceMQ.

## 🔒 Sécurité et Intégrité

Chez **SecureFlow**, la sécurité n'est pas une option.
Chaque mise à jour référencée ici suit un processus strict :

1.  **Signature Cryptographique** : Tous les manifestes (`latest-*.json`) sont signés avec une clé privée offline (Ed25519).
2.  **Vérification** : L'application cliente TraceMQ vérifie systématiquement cette signature avec la clé publique embarquée avant d'accepter une mise à jour.
3.  **Transparence** : L'historique des versions est immuable et auditable via l'historique Git de ce dépôt.

## Canaux de Distribution

Nous proposons plusieurs canaux de mise à jour pour répondre à différents besoins :

| Canal | Description | Stabilité | Fichier Manifeste |
| :--- | :--- | :--- | :--- |
| **Stable** | Versions robustes et testées pour la production. | ⭐⭐⭐⭐⭐ | [`latest-stable.json`](./latest-stable.json) |
| **Beta** | Nouvelles fonctionnalités en avant-première, testées. | ⭐⭐⭐ | [`latest-beta.json`](./latest-beta.json) |
| **Alpha** | Développement actif ("Bleeding Edge"). Pour tests uniquement. | ⭐ | [`latest-alpha.json`](./latest-alpha.json) |

## 🛠️ Structure du Dépôt

Ce dépôt est maintenu automatiquement par notre pipeline de CI/CD.

*   `latest-[channel].json` : Contient les métadonnées de la dernière version (version, date, hash SHA-256 des binaires, liens de téléchargement).
*   `latest-[channel].json.sig` : La signature détachée du manifeste correspondant.
*   `flake.nix` : Configuration pour les environnements Nix (optionnel).

---

> **Note :** Ce dépôt ne contient pas le code source de l'application. Pour le code source, voir [Secureflow-SRL/TraceMQ](https://github.com/Secureflow-SRL/TraceMQ).

---
© 2025 **SecureFlow SRL**. All rights reserved.
