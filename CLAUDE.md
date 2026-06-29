# CLAUDE.md — kevinblayassi.dev

Site vitrine (portfolio) d'un développeur iOS indépendant, Kevin Blayassi.
Présente ses applications iOS/iPadOS et héberge les politiques de confidentialité
exigées par l'App Store. Site **statique pur** (HTML/CSS/JS vanilla), conçu pour
être déployé sur **GitHub Pages** sur le domaine `kevinblayassi.dev`.

> Pas de build, pas de framework, pas de dépendances npm. On ouvre les fichiers
> `.html` directement dans le navigateur pour prévisualiser.

---

## Stack & contraintes

- **HTML statique** multi-pages, `lang="fr"`.
- **CSS unique** : `assets/style.css` (variables CSS, dark mode auto via
  `prefers-color-scheme`, responsive `@media max-width: 600px`).
- **JS unique** : `assets/tilt.js` — effet de tilt 3D au survol (suit la souris),
  désactivé si `prefers-reduced-motion`.
- **Icônes** : Tabler Icons via CDN (`cdnjs`), classes `ti ti-*`.
- **Police** : pile système Apple (`-apple-system`, `SF Pro Display`…).
- Aucune donnée collectée, aucun tracker, aucun backend.

---

## Structure des fichiers

```
kevinblayassi-site/
├── index.html              ← page d'accueil (hub des apps)
├── pokocheck.html          ← page détail PokoCheck (app publiée)
├── pokocheck-privacy.html  ← politique de confidentialité PokoCheck
├── teachbook.html          ← page détail TeachBook (« bientôt disponible »)
├── teachbook-privacy.html  ← politique de confidentialité TeachBook
├── CNAME                   ← "kevinblayassi.dev" (domaine GitHub Pages — NE PAS supprimer)
├── .nojekyll               ← désactive Jekyll sur GitHub Pages (NE PAS supprimer)
├── GUIDE-DEPLOIEMENT.md    ← guide pas-à-pas de déploiement (GitHub Pages + DNS)
└── assets/
    ├── style.css           ← tout le style du site
    ├── tilt.js             ← effet de tilt 3D au survol
    ├── memoji.png          ← memoji affiché dans la nav
    ├── icon-pokocheck.png  ← icône de l'app PokoCheck
    ├── icon-teacher.png    ← icône de l'app TeachBook
    ├── IMAGES-A-AJOUTER.txt ← mémo des images à fournir
    └── screenshots/
        ├── pokocheck/      ← screen1.png … screen10.png + README.txt
        └── teachbook/      ← (vide pour l'instant) + README.txt
```

---

## Travaux déjà réalisés

- **Page d'accueil (`index.html`)** : hero, grille de cartes d'apps (PokoCheck,
  TeachBook, + une carte « Prochaine app 2026 »), nav, footer. Cartes cliquables
  avec effet tilt (`data-tilt`).
- **Page détail PokoCheck (`pokocheck.html`)** : app **publiée** sur l'App Store
  (id `6760971481`). Hero avec icône, bouton de téléchargement App Store, stats
  (4,4 ★ · 21 avis · 4+ · 84,9 Mo), carrousel des 10 captures, sections « À propos »
  et « Fonctionnalités ». App compagnon (non officielle) pour le jeu *Pokopia*.
- **Page détail TeachBook (`teachbook.html`)** : app **non publiée** (« Bientôt
  disponible »). Agenda/carnet de notes/emploi du temps pour enseignants
  (iPadOS + companion iPhone, Apple Pencil, iCloud). Pas de bouton App Store.
- **Politiques de confidentialité** PokoCheck et TeachBook : pages légales
  complètes (stockage local, iCloud, achats Apple, pas de collecte).
- **Design system** complet dans `style.css` : variables de thème, dark mode,
  blobs décoratifs flous, cartes, badges, carrousel de captures (`portrait` /
  `landscape`), sections détail, pages légales, footer, responsive.
- **`tilt.js`** : interaction 3D sur les cartes et icônes.
- **`GUIDE-DEPLOIEMENT.md`** : marche à suivre complète (création du repo,
  upload, activation GitHub Pages, achat domaine `.dev`, config DNS, HTTPS).

### État du déploiement
- Le repo **n'est pas (encore) un dépôt git** localement (`git status` échoue).
- `CNAME` + `.nojekyll` sont en place → prêt pour GitHub Pages.
- Contacts utilisés : `contact@kevinblayassi.dev` (général / TeachBook),
  `pokocheckapp@icloud.com` (support PokoCheck).

---

## Conventions importantes

- **Fallbacks d'images** : chaque `<img>` a un `onerror` qui remplace l'image
  manquante par un emoji ou un placeholder. Le site reste donc fonctionnel et
  présentable même sans toutes les images. Garder ce pattern en ajoutant des images.
- **Orientation des captures** : la classe sur `<div class="shots-scroll …">`
  contrôle l'affichage — `portrait` (captures iPhone, verticales) ou `landscape`
  (captures iPad, horizontales). Voir les `README.txt` dans `assets/screenshots/`.
- **Couleurs d'app** : PokoCheck = dégradé orange/jaune (`poko`), TeachBook =
  dégradé bleu/violet (`teacher`). Réutiliser ces classes pour rester cohérent.
- **Liens App Store** : ouverts dans un nouvel onglet ; sur la carte d'accueil,
  le bouton App Store stoppe la propagation pour ne pas suivre le lien de la carte.

---

## Points d'attention / TODO connus

- **`favicon.png` manquant** : référencé par `<link rel="icon">` dans toutes les
  pages mais absent de `assets/`. À ajouter (le navigateur affiche une favicon
  par défaut en attendant).
- **Captures TeachBook** : dossier vide, à remplir au lancement de l'app.
- **TeachBook** : remplacer le pill « Bientôt disponible » par un vrai bouton
  App Store une fois l'app publiée.

---

## Comment travailler sur ce projet

- **Prévisualiser** : ouvrir le `.html` voulu dans un navigateur (double-clic ou
  `open index.html`). Aucun serveur requis. Pour un rendu plus fidèle :
  `python3 -m http.server` depuis la racine puis `http://localhost:8000`.
- **Modifier le style** : tout est centralisé dans `assets/style.css`.
- **Ajouter une app** : dupliquer une carte dans `index.html` + créer
  `<nom>.html` (sur le modèle de `pokocheck.html`) + `<nom>-privacy.html`.
- **Déployer** : suivre `GUIDE-DEPLOIEMENT.md` (commit + push → GitHub Pages
  publie en 1-2 min).
