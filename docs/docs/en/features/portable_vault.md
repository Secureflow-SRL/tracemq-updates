# Portable Vault

## Overview
The **Portable Vault** is TraceMQ's OS‑independent secure storage for all sensitive credentials (passwords, tokens, TLS keys, etc.). It uses **AES‑256‑GCM** encryption with a master key that you control.

## How it works
1. **Enable Vault** – The UI asks you to choose a location for a master‑key file (e.g. `tracemq.key`). The application generates a random 32‑byte key and writes it to that file.
2. **Key storage** – The path to the key file is saved in the application settings (`settings.security.vault_key_path`). The key itself is **never stored in the configuration files**; only the path is persisted.
3. **Encryption / Decryption** – All sensitive fields are encrypted/decrypted on‑the‑fly using the loaded master key. When the app starts it reads the key file and keeps the key only in memory.
4. **Copy the key** – In the **Security** tab you can click **Copy Key** to copy the raw key content to the clipboard. This lets you paste the secret into an external password manager (KeePass, Bitwarden, 1Password, etc.) if you prefer a dedicated vault.
5. **Rotate / Disable** – You can rotate the key (generates a new key and re‑encrypts everything) or disable the vault (falls back to the legacy weak obfuscation).

## Why use the Portable Vault?
- **OS‑independent** – Works on Windows, macOS and Linux without relying on OS‑specific keyrings.
- **User‑controlled** – You decide where the key file lives and can back it up or store it in any external vault.
- **Strong cryptography** – AES‑256‑GCM provides confidentiality and integrity.
- **Portable** – Move the key file together with the configuration to another machine and all credentials remain usable.

## Getting started
1. Open **Settings → Security**.
2. Click **Enable Vault** and select a location for the key file.
3. The vault is now active; all new credentials will be encrypted with the master key.
4. Use **Copy Key** to export the secret to your favourite password manager.
5. When needed, you can **Rotate Key** or **Disable Vault** from the same screen.

---
*For more details see the technical design in `technical_docs/security_portable_vault_plan.md`.*
