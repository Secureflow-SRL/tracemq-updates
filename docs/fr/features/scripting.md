# Scripting & Automatisation

TraceMQ intègre un moteur JavaScript (ES5+) pour automatiser des tâches complexes.

## Environnement
-   Moteur : Goja (Implémentation ECMAScript en Go).
-   Exécution : Côté Backend (les scripts tournent même si l'interface est réduite, mais dépendent du cycle de vie de l'app).

## API `traceMQ`
L'objet global `traceMQ` expose des méthodes pour interagir avec le système.

### Méthodes Disponibles

| Méthode | Description | Exemple |
| :--- | :--- | :--- |
| `traceMQ.log(level, msg)` | Log un message dans la console de debug. | `traceMQ.log("info", "Script started")` |
| `traceMQ.publish(connId, topic, payload)` | Publie un message MQTT. | `traceMQ.publish("conn-1", "mytopic", "Hello")` |
| `traceMQ.sleep(ms)` | Pause l'exécution (Bloquant). | `traceMQ.sleep(1000)` |
| `traceMQ.notify(title, msg, type)` | Affiche une notification toast dans l'UI. | `traceMQ.notify("Alert", "High Temp", "error")` |
| `traceMQ.httpRequest(method, url, body, headers)` | Effectue une requête HTTP externe. | `var res = traceMQ.httpRequest("GET", "http://api.com", "", {})` |

### Trigger : `onMessage(msg)`
Définissez cette fonction pour réagir à chaque message reçu.

```javascript
function onMessage(msg) {
    // msg contient : id, topic, payload (string), connection_id, protocol
    var data = JSON.parse(msg.payload);
    
    if (data.temp > 50) {
        traceMQ.log("warn", "Surchauffe détectée !");
        traceMQ.publish(msg.connection_id, "alarms/fire", '{"level": "CRITICAL"}');
        traceMQ.notify("Alerte", "Température critique: " + data.temp, "error");
    }
}
```

## Cas d'Usage
1.  **Réponse Automatique (Ack)** : Renvoyer un Ack dès réception d'une commande.
2.  **Transformation et Forwarding** : Recevoir sur MQTT -> Poster sur une API HTTP.
3.  **Surveillance** : Détecter des patterns anormaux et alerter.
