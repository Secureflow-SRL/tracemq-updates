# Modes de Visualisation

TraceMQ offre trois modes principaux pour visualiser et analyser vos données en temps réel.

## 1. Liste & Hiérarchie (Vue Messages)

C'est la vue par défaut pour inspecter le flux brut de messages. Elle propose deux sous-modes :

### Mode Liste (List)
Affiche les messages de manière chronologique (du plus récent au plus ancien ou inversement).

*   **Usage** : Idéal pour voir le débit, l'ordre d'arrivée, et les logs d'événements.
*   **Virtual Scrolling** : Capable d'afficher des millions de messages sans ralentir l'interface.
*   **Fonctionnalités** :
    *   **Auto-Scroll** : Suit le flux en temps réel.
    *   **Pause** : Fige le défilement pour inspection.
    *   **Filtres** : Recherche par Topic, Payload, ou ID.

### Mode Hiérarchie (Arborescence / Tree)
Organise les messages sous forme d'arbre en se basant sur la structure des topics (ex: `usine/salle1/temp`).

*   **Usage** : Parfait pour comprendre la structure de vos topics et voir le *dernier état connu* de chaque nœud.
*   **Diff Viewer** :
    *   Sélectionnez un nœud pour voir son dernier message.
    *   Activez le mode **"Diff"** pour voir les changements exacts par rapport au message précédent (ajout, suppression, modification de champs JSON).
    *   Les changements sont surlignés en vert (ajout) et rouge (suppression).

---

## 2. Tableau de Bord (Dashboard)

Le Tableau de Bord permet de créer des interfaces de surveillance personnalisées à partir des données reçues.

*   **Fonctionnement** : Vous ajoutez des "Widgets" liés à des chemins JSON spécifiques dans vos messages (ex: `payload.temperature`).
*   **Types de Widgets** :
    *   **Last Value** : Affiche la dernière valeur reçue (ex: "24.5 °C").
    *   **Status** : Indicateur visuel (Vert/Rouge) basé sur une condition (ex: `status == "OK"`).
    *   **Graphique (Time Series)** : Courbe d'évolution en temps réel.
    *   **Jauge** : Indicateur de niveau (Min/Max).
*   **Organisation** : Grille redimensionnable et déplaçable par Drag & Drop.

---

## 3. Carte Topologique (Map)

Une visualisation graphique et interactive de votre réseau de topics.

*   **Noeuds & Liens** : Chaque segment de topic devient un nœud. Les relations parent-enfant sont dessinées dynamiquement.
*   **Smart Extraction** :
    *   Cliquez sur un nœud contenant du JSON.
    *   TraceMQ peut extraire automatiquement les variables et créer des nœuds virtuels pour les visualiser dans le graphe.
    *   Supporte les structures complexes (tableaux d'objets, métriques Sparkplug B).
*   **Heatmap** : Visualisez la fréquence d'activité. Les nœuds qui reçoivent beaucoup de messages s'illuminent ("Chaud") pour identifier les goulots d'étranglement ou les bavards.
*   **Suggestions** : L'outil peut analyser le graphe pour vous suggérer des filtres ou des abonnements optimisés.
