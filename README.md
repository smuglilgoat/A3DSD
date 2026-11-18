# A3DSD

Travaux pratiques d'analyse de séquences et de données 3D : détection de mouvement, filtrage particulaire, ondelettes et analyse de maillages.

## Contenu

### `Partie_C_Migniot`

- `TP1` — détection de mouvement sur des séquences d'images : soustraction de fond moyen, différence entre images, flot optique et MHI (`visu*.m`), avec rapport PDF.
- `TP2` — suivi par filtrage particulaire : initialisation, propagation, pondération, rééchantillonnage et estimation (`filtrage.m`).

### `Partie_C_Roudet`

- `TP1_Ondelettes` — filtrage gaussien et convolution sur des signaux 1D.
- `TP2_Ondelettes` — transformée en ondelettes de Haar, analyse/synthèse et seuillage.
- `TP3_Ondelettes` — schéma de lifting, appliqué aux courbes `virus`, `hippocampe` et `herisson`.

### `Partie_R_Raffin`

- `TP_Analyse_3D` — analyse de maillages (angles dièdres, valence) avec PyMesh.
- `TP_Histo` — histogrammes de maillages sous Jupyter.
- `TP_Photogrametrie` — reconstruction de scène avec les binaires MVE (`makescene`, `sfmrecon`, `dmrecon`, `fssrecon`, `meshclean`).

## Démarrage

Les TPs `Migniot` et `Roudet` sont des scripts Octave/MATLAB. Ouvrir le dossier du TP et lancer le script d'entrée (`tp1.m`, `filtrage.m`, `tp.m`) dans Octave ou MATLAB.

```bash
cd Partie_C_Roudet/TP1_Ondelettes
octave --persistent tp.m
```

Les TPs `Raffin` utilisent Python :

```bash
python3 -m pip install pymesh matplotlib jupyter
jupyter notebook Partie_R_Raffin/TP_Histo/histo.ipynb
```

La photogrammétrie suppose les exécutables MVE dans `TP_Photogrametrie/bin` et les photos dans `images/` (dossier ignoré par Git). Le script `reconstruct.bash` enchaîne les étapes et écrit la scène dans `scene/`.

## Notes

- Certains scripts Octave utilisent le package `image` pour la lecture et l'affichage des séquences.
- Les rapports et notebooks sont fournis avec les scripts ; les images de photogrammétrie ne sont pas versionnées (voir `.gitignore`).
