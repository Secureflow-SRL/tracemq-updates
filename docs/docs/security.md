# TraceMQ Security Documentation

## Architecture
TraceMQ uses a Vault architecture to protect sensitive connection passwords.
- **Master Key**: A 32-byte AES-256 key used to encrypt the configuration database.
- **Storage**: The Master Key is stored in `tracemq.key` in the configuration directory.

## Protection Methods

### 1. Software Protection (DPAPI)
On Windows, the `tracemq.key` file is encrypted using Windows DPAPI. This binds the key to the user's OS account.
- **Security**: High against offline attacks (stealing the file).
- **Portability**: The key file CANNOT be copied to another machine/user directly. You must "Rotate" the key or re-setup on the new machine.

### 2. YubiKey Protection
The Master Key is encrypted using a YubiKey (PIV Smart Card).
- **Security**: The Master Key can only be decrypted if the specific YubiKey is inserted and unlocked with the PIN.
- **Integrity**: The key file is signed by the YubiKey to prevent tampering.

## Backup & Recovery

### Software Key
1. **Backup**: 
   - You cannot simply copy `tracemq.key` to another machine due to DPAPI.
   - To backup configuration: Export your settings/connections from the UI (if available) or copy `tracemq_default.db` (encrypted content).
2. **Restore**:
   - If you lose `tracemq.key`, you lose access to all encrypted passwords in `tracemq.db`. You will need to re-enter them.

### YubiKey
1. **Critical Warning**: The private key is generated ON the YubiKey and is **non-exportable**.
2. **Loss**: If you lose your YubiKey or it breaks, you **CANNOT** decrypt `tracemq.key`. Your vault data is permanently lost.
3. **Recommendation**:
   - Ensure you have a manual record of your critical passwords elsewhere.
   - TraceMQ does not currently support multiple YubiKeys for the same vault (Key Escrow).

## Troubleshooting
- **"Integrity Check Failed"**: The `tracemq.key` file has been modified or corrupted. Restore from backup or delete it (resets vault).
- **"Serial Mismatch"**: You are using a different YubiKey than the one used to setup the vault. Insert the correct YubiKey (Serial Number is checked).
