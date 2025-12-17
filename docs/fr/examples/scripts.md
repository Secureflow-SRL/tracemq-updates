# Exemples de Scripts

Voici une collection de scripts prêts à l'emploi.

## 1. Echo Service (Ping-Pong)
Renvoie le même payload sur un topic de réponse.

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
Transfère tous les messages reçus vers une API REST `https://my-api.com/ingest` au format JSON.

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

## 3. Détecteur de Doublons
Log une erreur et notifie si le même message est reçu deux fois de suite.

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

## 4. Traitement JSON Avancé
Lit un message JSON, modifie un champ et le republie.

```javascript
function onMessage(msg) {
    if (msg.topic !== "sensors/data") return;

    try {
        // Parsing du payload JSON
        var data = JSON.parse(msg.payload);

        // Modification des données
        if (data.temperature > 25) {
            data.alert = true;
            data.message = "Temperature élevée détectée";
        }
        
        // Ajout d'un timestamp de traitement
        data.processed_at = new Date().toISOString();

        // Ré-encodage et publication sur un autre topic
        var newPayload = JSON.stringify(data);
        traceMQ.publish(msg.connection_id, "sensors/data/processed", newPayload);

    } catch (e) {
        traceMQ.log("error", "JSON Error: " + e.message);
    }
}
```

## 5. Lecture XML (Simple)
Exemple de lecture d'une valeur dans un payload XML simple via Regex.

```javascript
function onMessage(msg) {
    // Supposons un payload: <sensor><id>123</id><value>45.6</value></sensor>
    var xml = msg.payload;

    // Extraction simple via Regex (Pour du XML complexe, préférez une transformation en amont)
    var matchValue = xml.match(/<value>(.*?)<\/value>/);
    var matchId = xml.match(/<id>(.*?)<\/id>/);

    if (matchValue && matchId) {
        var id = matchId[1];
        var value = parseFloat(matchValue[1]);

        traceMQ.log("info", "XML Sensor " + id + ": " + value);

        if (value > 40) {
            traceMQ.notify("Alerte XML", "Valeur élevée: " + value, "error");
        }
    }
}
```

## 6. Décodage Protobuf
Décodage d'un message binaire Protobuf en JSON pour analyse, puis ré-encodage.
*Nécessite la définition `.proto`.*

```javascript
// Définition de votre schéma Protobuf (Syntaxe proto3)
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
        // 1. Décoder le binaire Protobuf en JSON string
        // Le nom du message doit correspondre à celui dans protoConfig
        var fullConfig = "SensorData\n" + protoConfig;
        var jsonStr = traceMQ.protobufDecode(msg.payload, fullConfig);
        
        var data = JSON.parse(jsonStr);
        traceMQ.log("info", "Decoded Protobuf: " + JSON.stringify(data));

        // 2. Modifier les données
        data.value = data.value * 2; 

        // 3. Ré-encoder en binaire Protobuf
        var newPayloadBytes = traceMQ.protobufEncode(JSON.stringify(data), fullConfig);
        
        // Publier le binaire modifié
        // Note: publish attend une string, en JS les tableaux d'octets passés à publish sont gérés.
        traceMQ.publish(msg.connection_id, "proto/processed", newPayloadBytes);

    } catch (e) {
        traceMQ.log("error", "Protobuf Error: " + e.message);
    }
}
```
