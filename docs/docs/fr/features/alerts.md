# Système d'Alertes

Surveillez votre trafic en temps réel grâce au moteur d'alertes.

## Configuration des Règles

Une règle d'alerte se compose de :
-   **Nom** : Pour identifier l'alerte.
-   **Condition** : Une expression logique qui détermine quand l'alerte se déclenche.
-   **Sévérité** : Info, Warning, ou Error.

## Syntaxe des Conditions
Le moteur supporte une syntaxe simple basée sur les propriétés du message.

-   Comparaison simple : `payload.temp > 50`
-   Topic matching : `topic == "sensor/error"`
-   Opérateurs logiques : `payload.temp > 50 && payload.humidity < 20`
-   Regex : `topic =~ "^factory/.*"` (Support dépendant de l'implémentation actuelle).

## Notifications
Lorsqu'une alerte est déclenchée :
1.  Une notification Toast apparaît en haut de l'écran.
2.  L'alerte est enregistrée dans l'historique (accessible via l'icône Cloche 🔔).
3.  L'historique persiste jusqu'à effacement manuel.
