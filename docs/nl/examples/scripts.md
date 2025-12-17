# Scriptvoorbeelden

Hier is een verzameling kant-en-klare scripts.

## 1. Echo Service (Ping-Pong)
Stuurt dezelfde payload terug op een antwoordtopic.

```javascript
function onMessage(msg) {
    if (msg.topic.endsWith("/request")) {
        var replyTopic = msg.topic.replace("/request", "/reply");
        traceMQ.publish(msg.connection_id, replyTopic, msg.payload);
        traceMQ.log("info", "Replied to " + msg.topic);
    }
}
```

## 2. HTTP Webhook Forwarder
Stuurt alle ontvangen berichten door naar een REST API `https://my-api.com/ingest` in JSON-formaat.

```javascript
function onMessage(msg) {
    try {
        var body = JSON.stringify({
            topic: msg.topic,
            data: JSON.parse(msg.payload), // Assume JSON
            ts: new Date().toISOString()
        });
        
        traceMQ.httpRequest(
            "POST", 
            "https://my-api.com/ingest", 
            body, 
            {"Content-Type": "application/json"}
        );
    } catch (e) {
        traceMQ.log("error", "Failed to forward: " + e);
    }
}
```

## 3. Dubbele Detectie
Logt een fout en meldt als hetzelfde bericht twee keer na elkaar wordt ontvangen.

```javascript
var lastPayload = "";

function onMessage(msg) {
    if (msg.payload === lastPayload) {
        traceMQ.log("warn", "Duplicate message detected on " + msg.topic);
        traceMQ.notify("Duplicate", "Received exact same payload twice", "warning");
    }
    lastPayload = msg.payload;
}
```

## 4. Geavanceerde JSON Verwerking
Leest een JSON-bericht, wijzigt een veld en publiceert het opnieuw.

```javascript
function onMessage(msg) {
    if (msg.topic !== "sensors/data") return;

    try {
        // JSON payload parsen
        var data = JSON.parse(msg.payload);

        // Gegevens wijzigen
        if (data.temperature > 25) {
            data.alert = true;
            data.message = "Hoge temperatuur gedetecteerd";
        }
        
        // Verwerkingstijdstempel toevoegen
        data.processed_at = new Date().toISOString();

        // Opnieuw coderen en publiceren naar een ander topic
        var newPayload = JSON.stringify(data);
        traceMQ.publish(msg.connection_id, "sensors/data/processed", newPayload);

    } catch (e) {
        traceMQ.log("error", "JSON Error: " + e.message);
    }
}
```

## 5. XML Lezen (Eenvoudig)
Voorbeeld van het lezen van een waarde in een eenvoudige XML-payload via Regex.

```javascript
function onMessage(msg) {
    // Stel payload veronderstellen: <sensor><id>123</id><value>45.6</value></sensor>
    var xml = msg.payload;

    // Eenvoudige extractie via Regex (Gebruik upstream transformatie voor complexe XML)
    var matchValue = xml.match(/<value>(.*?)<\/value>/);
    var matchId = xml.match(/<id>(.*?)<\/id>/);

    if (matchValue && matchId) {
        var id = matchId[1];
        var value = parseFloat(matchValue[1]);

        traceMQ.log("info", "XML Sensor " + id + ": " + value);

        if (value > 40) {
            traceMQ.notify("XML Alert", "Hoge waarde: " + value, "error");
        }
    }
}
```

## 6. Protobuf Decodering
Decodering van een binair Protobuf-bericht naar JSON voor analyse, gevolgd door her-codering.
*Vereist `.proto` definitie.*

```javascript
// Definieer uw Protobuf schema (proto3 syntax)
var protoConfig = `
syntax = "proto3";
message SensorData {
    string sensor_id = 1;
    float value = 2;
    int64 timestamp = 3;
}
`;

function onMessage(msg) {
    try {
        // 1. Decodeer binair Protobuf naar JSON-string
        // De berichtnaam moet overeenkomen met die in protoConfig
        var fullConfig = "SensorData\n" + protoConfig;
        var jsonStr = traceMQ.protobufDecode(msg.payload, fullConfig);
        
        var data = JSON.parse(jsonStr);
        traceMQ.log("info", "Decoded Protobuf: " + JSON.stringify(data));

        // 2. Wijzig gegevens
        data.value = data.value * 2; 

        // 3. Her-codeer naar binair Protobuf
        var newPayloadBytes = traceMQ.protobufEncode(JSON.stringify(data), fullConfig);
        
        // Publiceer gewijzigde binary
        // Opmerking: publish verwacht een string; byte arrays doorgegeven aan publish worden afgehandeld in JS.
        traceMQ.publish(msg.connection_id, "proto/processed", newPayloadBytes);

    } catch (e) {
        traceMQ.log("error", "Protobuf Error: " + e.message);
    }
}
```
