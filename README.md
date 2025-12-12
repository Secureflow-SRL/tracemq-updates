# TraceMQ Updates Registry

Welcome to the official **TraceMQ** updates registry.

This repository serves as the source of truth for the TraceMQ application auto-update mechanism. It hosts digitally signed release manifests, ensuring the integrity and authenticity of every update distributed to our users.

> ⚠️ **Warning: Testing Phase (Beta)**
>
> **TraceMQ** is currently in active development and testing phase (Beta). While we strive to ensure software stability and security:
> *   Bugs or unexpected behaviors may occur.
> *   Use of this software is at your own risk.
> *   **SecureFlow SRL** disclaims all liability for any data loss, service interruption, or any other direct or indirect damage resulting from the use of TraceMQ.

## 🔒 Security and Integrity

Every update referenced here follows a strict process:

1.  **Cryptographic Signing**: All manifests (`latest-*.json`) are signed with an offline private key (Ed25519).
2.  **Verification**: The TraceMQ client application systematically verifies this signature using the embedded public key before accepting any update.
3.  **Transparency**: The version history is immutable and auditable via this repository's Git history.

## Distribution Channels

We offer several update channels to meet different needs:

| Channel | Description | Stability | Manifest File |
| :--- | :--- | :--- | :--- |
| **Stable** | Robust versions tested for production. | ⭐⭐⭐⭐⭐ | [`latest-stable.json`](./latest-stable.json) |
| **Beta** | New features in preview, tested. | ⭐⭐⭐ | [`latest-beta.json`](./latest-beta.json) |
| **Alpha** | Active development ("Bleeding Edge"). For testing only. | ⭐ | [`latest-alpha.json`](./latest-alpha.json) |

## 🛠️ Repository Structure

This repository is maintained automatically by our CI/CD pipeline.

*   `latest-[channel].json`: Contains metadata for the latest release (version, date, SHA-256 hash of binaries, download links).
*   `latest-[channel].json.sig`: The detached signature of the corresponding manifest.
*   `flake.nix`: Configuration for Nix environments (optional).

---


---
© 2025 **SecureFlow SRL**. All rights reserved.
