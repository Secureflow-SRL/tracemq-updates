# Scripting & Automatisering

TraceMQ integreert een JavaScript-engine (ES5+) om complexe taken te automatiseren.

## Omgeving
-   Engine: Goja (ECMAScript-implementatie in Go).
-   Uitvoering: Backend-zijde (scripts draaien zelfs als de interface geminimaliseerd is, maar zijn afhankelijk van de levenscyclus van de app).

## `traceMQ` API
Het globale `traceMQ` object stelt methoden beschikbaar om met het systeem te communiceren.

### Beschikbare Methoden

| Methode | Beschrijving | Voorbeeld |
| :--- | :--- | :--- |
| `traceMQ.log(level, msg)` | Log een bericht in de debug console. | `traceMQ.log("info", "Script gestart")` |
| `traceMQ.publish(connId, topic, payload)` | Publiceer een MQTT-bericht. | `traceMQ.publish("conn-1", "mijntopic", "Hallo")` |
| `traceMQ.sleep(ms)` | Pauzeer uitvoering (Blokkerend). | `traceMQ.sleep(1000)` |
| `traceMQ.notify(title, msg, type)` | Toon een toast-melding in de UI. | `traceMQ.notify("Alert", "Hoge Temp", "error")` |
| `traceMQ.httpRequest(method, url, body, headers)` | Voer een extern HTTP-verzoek uit. | `var res = traceMQ.httpRequest("GET", "http://api.com", "", {})` |

### Trigger: `onMessage(msg)`
Definieer deze functie om te reageren op elk ontvangen bericht.

```javascript
function onMessage(msg) {
    // msg bevat: id, topic, payload (string), connection_id, protocol
    var data = JSON.parse(msg.payload);
    
    if (data.temp > 50) {
        traceMQ.log("warn", "Oververhitting gedetecteerd!");
        traceMQ.publish(msg.connection_id, "alarms/fire", '{"level": "CRITICAL"}');
        traceMQ.notify("Alert", "Kritieke Temperatuur: " + data.temp, "error");
    }
}
```

## Gebruiksscenario's
1.  **Automatisch Antwoord (Ack)**: Stuur direct een Ack bij ontvangst van een commando.
2.  **Transformatie en Doorsturen**: Ontvangen op MQTT -> Posten naar een HTTP API.
3.  **Bewaking**: Detecteer abnormale patronen en waarschuw.
