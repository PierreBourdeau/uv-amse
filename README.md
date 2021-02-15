# TP1 - UV-AMSE

![Flutter logo](https://flutter.dev/images/catalog-widget-placeholder.png)

## Présentation 

Le TP a été réalisé sur Android studio avec le kit de développement Flutter. L'objectif étant de faire une première approche des outils, du langage et de Flutter.

L'application est une simulation de médiathèque présentant des films, BDs et des musiques.
Elle composé de 4 pages sur lesquelles il est possible de circuler via la barre de navigation au bas de l'écran : 
`Films`, `BDs`, `Musiques`, `À propos`.

Chaque éléments des listes est clickable pour consulter plus en détail la présentation. Il est ensuite possible de revenir à l'écran principal.
Les éléments de l'application sont fournis en dur via des listes de `MediaModel`. Chaque élément comporte un titre, une description et une image. Ces dernières sont fournies de 2 façon différentes : via le net ou avec des fichiers .jpg fournis dans les dossiers de l'application. 

Tous les fichiers nécessairent au fonctionnement de l'application sont trouvable dans la branche **master** sur ce git.
Un .apk est également fourni.

Les tests ont étés réalisés sur émulateur : sdk gphone x86.

* L'APK : `build\app\outputs\apk\release`
