# Script Examples

Here is a collection of ready-to-use scripts.

## 1. Echo Service (Ping-Pong)
Returns the same payload on a reply topic.

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
Forwards all received messages to a REST API `https://my-api.com/ingest` in JSON format.

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

## 3. Duplicate Detector
Logs an error and notifies if the same message is received twice in a row.

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

## 4. Advanced JSON Processing
Reads a JSON message, modifies a field, and republishes it.

```javascript
function onMessage(msg) {
    if (msg.topic !== "sensors/data") return;

    try {
        // Parsing JSON payload
        var data = JSON.parse(msg.payload);

        // Modifying data
        if (data.temperature > 25) {
            data.alert = true;
            data.message = "High temperature detected";
        }
        
        // Adding processing timestamp
        data.processed_at = new Date().toISOString();

        // Re-encoding and publishing to another topic
        var newPayload = JSON.stringify(data);
        traceMQ.publish(msg.connection_id, "sensors/data/processed", newPayload);

    } catch (e) {
        traceMQ.log("error", "JSON Error: " + e.message);
    }
}
```

## 5. XML Reading (Simple)
Example of reading a value in a simple XML payload via Regex.

```javascript
function onMessage(msg) {
    // Assume payload: <sensor><id>123</id><value>45.6</value></sensor>
    var xml = msg.payload;

    // Simple extraction via Regex (For complex XML, prefer upstream transformation)
    var matchValue = xml.match(/<value>(.*?)<\/value>/);
    var matchId = xml.match(/<id>(.*?)<\/id>/);

    if (matchValue && matchId) {
        var id = matchId[1];
        var value = parseFloat(matchValue[1]);

        traceMQ.log("info", "XML Sensor " + id + ": " + value);

        if (value > 40) {
            traceMQ.notify("XML Alert", "High value: " + value, "error");
        }
    }
}
```

## 6. Protobuf Decoding
Decoding a generic binary Protobuf message to JSON for analysis, then re-encoding.
*Requires `.proto` definition.*

```javascript
// Define your Protobuf schema (proto3 syntax)
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
        // 1. Decode binary Protobuf to JSON string
        // The message name must match the one in protoConfig
        var fullConfig = "SensorData\n" + protoConfig;
        var jsonStr = traceMQ.protobufDecode(msg.payload, fullConfig);
        
        var data = JSON.parse(jsonStr);
        traceMQ.log("info", "Decoded Protobuf: " + JSON.stringify(data));

        // 2. Modify data
        data.value = data.value * 2; 

        // 3. Re-encode to binary Protobuf
        var newPayloadBytes = traceMQ.protobufEncode(JSON.stringify(data), fullConfig);
        
        // Publish modified binary
        // Note: publish expects a string; byte arrays passed to publish are handled in JS.
        traceMQ.publish(msg.connection_id, "proto/processed", newPayloadBytes);

    } catch (e) {
        traceMQ.log("error", "Protobuf Error: " + e.message);
    }
}
```
