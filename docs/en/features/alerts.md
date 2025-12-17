# Alert System

Monitor your traffic in real-time with the alert engine.

## Rule Configuration

An alert rule consists of:
-   **Name**: To identify the alert.
-   **Condition**: A logical expression that determines when the alert is triggered.
-   **Severity**: Info, Warning, or Error.

## Condition Syntax
The engine supports a simple syntax based on message properties.

-   Simple comparison: `payload.temp > 50`
-   Topic matching: `topic == "sensor/error"`
-   Logical operators: `payload.temp > 50 && payload.humidity < 20`
-   Regex: `topic =~ "^factory/.*"` (Support depends on current implementation).

## Notifications
When an alert is triggered:
1.  A Toast notification appears at the top of the screen.
2.  The alert is recorded in the history (accessible via the Bell icon 🔔).
3.  The history persists until manually cleared.
