# Visualization Modes

TraceMQ offers three main modes to visualize and analyze your data in real-time.

## 1. List & Hierarchy (Messages View)

This is the default view for inspecting the raw stream of messages. It offers two sub-modes:

### List Mode
Displays messages chronologically (newest to oldest or vice versa).

*   **Usage**: Ideal for seeing throughput, arrival order, and event logs.
*   **Virtual Scrolling**: Capable of displaying millions of messages without slowing down the interface.
*   **Features**:
    *   **Auto-Scroll**: Follows the stream in real-time.
    *   **Pause**: Freezes scrolling for inspection.
    *   **Filters**: Search by Topic, Payload, or ID.

### Hierarchy Mode (Tree)
Organizes messages as a tree based on topic structure (e.g., `factory/room1/temp`).

*   **Usage**: Perfect for understanding your topic structure and seeing the *last known state* of each node.
*   **Diff Viewer**:
    *   Select a node to see its last message.
    *   Enable **"Diff"** mode to see exact changes compared to the previous message (addition, removal, modification of JSON fields).
    *   Changes are highlighted in green (addition) and red (removal).

---

## 2. Dashboard

The Dashboard allows creating customized monitoring interfaces from received data.

*   **How it works**: You add "Widgets" linked to specific JSON paths in your messages (e.g., `payload.temperature`).
*   **Widget Types**:
    *   **Last Value**: Displays the last value received (e.g., "24.5 °C").
    *   **Status**: Visual indicator (Green/Red) based on a condition (e.g., `status == "OK"`).
    *   **Chart (Time Series)**: Real-time evolution curve.
    *   **Gauge**: Level indicator (Min/Max).
*   **Organization**: Resizable and movable grid via Drag & Drop.

---

## 3. Topology Map

A graphical and interactive visualization of your topic network.

*   **Nodes & Links**: Each topic segment becomes a node. Parent-child relationships are drawn dynamically.
*   **Smart Extraction**:
    *   Click on a node containing JSON.
    *   TraceMQ can automatically extract variables and create virtual nodes to visualize them in the graph.
    *   Supports complex structures (arrays of objects, Sparkplug B metrics).
*   **Heatmap**: Visualize activity frequency. Nodes receiving many messages light up ("Hot") to identify bottlenecks or chatty publishers.
*   **Suggestions**: The tool can analyze the graph to suggest filters or optimized subscriptions.
