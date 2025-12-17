# Scripting & Automation

TraceMQ integrates a JavaScript engine (ES5+) to automate complex tasks.

## Environment
-   Engine: Goja (ECMAScript implementation in Go).
-   Execution: Backend side (scripts run even if the interface is minimized, but depend on the app lifecycle).

## `traceMQ` API
The global `traceMQ` object exposes methods to interact with the system.

### Available Methods

| Method | Description | Example |
| :--- | :--- | :--- |
| `traceMQ.log(level, msg)` | Log a message to the debug console. | `traceMQ.log("info", "Script started")` |
| `traceMQ.publish(connId, topic, payload)` | Publish an MQTT message. | `traceMQ.publish("conn-1", "mytopic", "Hello")` |
| `traceMQ.sleep(ms)` | Pause execution (Blocking). | `traceMQ.sleep(1000)` |
| `traceMQ.notify(title, msg, type)` | Show a toast notification in the UI. | `traceMQ.notify("Alert", "High Temp", "error")` |
| `traceMQ.httpRequest(method, url, body, headers)` | Perform an external HTTP request. | `var res = traceMQ.httpRequest("GET", "http://api.com", "", {})` |

### Trigger: `onMessage(msg)`
Define this function to react to each received message.

```javascript
function onMessage(msg) {
    // msg contains: id, topic, payload (string), connection_id, protocol
    var data = JSON.parse(msg.payload);
    
    if (data.temp > 50) {
        traceMQ.log("warn", "Overheating detected!");
        traceMQ.publish(msg.connection_id, "alarms/fire", '{"level": "CRITICAL"}');
        traceMQ.notify("Alert", "Critical Temperature: " + data.temp, "error");
    }
}
```

## Use Cases
1.  **Automatic Response (Ack)**: Send an Ack immediately upon receipt of a command.
2.  **Transformation and Forwarding**: Receive on MQTT -> Post to an HTTP API.
3.  **Monitoring**: Detect abnormal patterns and alert.
