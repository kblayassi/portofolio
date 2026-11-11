# CLAUDE.md — kevinblayassi.dev

Site vitrine (portfolio) d'un développeur iOS indépendant, Kevin Blayassi.
Présente ses applications iOS/iPadOS et héberge les politiques de confidentialité
exigées par l'App Store. Site **statique pur** (HTML/CSS/JS vanilla), conçu pour
être déployé sur **GitHub Pages** sur le domaine `kevinblayassi.dev`.

> Pas de build, pas de framework, pas de dépendances npm. On ouvre les fichiers
> `.html` directement dans le navigateur pour prévisualiser.

---

## Stack & contraintes

- **HTML statique** multi-pages, **bilingue** : pages françaises à la racine (`lang="fr"`),
  leurs jumelles anglaises dans `en/` avec le même nom de fichier (`lang="en"`).
- **CSS unique** : `assets/style.css` (variables CSS, dark mode auto via
  `prefers-color-scheme`, responsive `@media max-width: 600px`).
- **JS** : `assets/tilt.js` — effet de tilt 3D au survol (suit la souris),
  désactivé si `prefers-reduced-motion` ; `assets/lang.js` — choix de la langue (voir plus bas).
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
├── teachbook.html          ← page détail TeachBook (app publiée)
├── teachbook-privacy.html  ← politique de confidentialité TeachBook
├── teachbook-terms.html    ← conditions d'utilisation (CGU) TeachBook
├── mathik.html             ← page détail Mathik (app publiée)
├── mathik-privacy.html     ← politique de confidentialité Mathik
├── caseclosed.html         ← page détail Case Closed (app publiée)
├── caseclosed-privacy.html ← politique de confidentialité Case Closed
├── en/                   ← les 10 mêmes pages en anglais (chemins en ../assets/)
├── CNAME                   ← "kevinblayassi.dev" (domaine GitHub Pages — NE PAS supprimer)
├── .nojekyll               ← désactive Jekyll sur GitHub Pages (NE PAS supprimer)
├── GUIDE-DEPLOIEMENT.md    ← guide pas-à-pas de déploiement (GitHub Pages + DNS)
└── assets/
    ├── style.css           ← tout le style du site
    ├── tilt.js             ← effet de tilt 3D au survol
    ├── lang.js             ← redirection FR / EN et mémorisation du choix
    ├── memoji.png          ← memoji affiché dans la nav
    ├── icon-pokocheck.png  ← icône de l'app PokoCheck
    ├── icon-teacher.png    ← icône de l'app TeachBook
    ├── icon-mathik.png     ← icône de l'app Mathik
    ├── icon-caseclosed.png ← icône de l'app Case Closed
    ├── IMAGES-A-AJOUTER.txt ← mémo des images à fournir
    └── screenshots/
        ├── pokocheck/      ← screen1.png … screen10.png + README.txt
        ├── teachbook/      ← screen1.jpg … screen10.jpg (iPad) + en/ (captures anglaises) + README.txt
        ├── mathik/         ← screen1.jpg … screen5.jpg (iPhone) + README.txt
        └── caseclosed/     ← screen1.jpg … screen10.jpg (iPhone, affiches FR) + en/ + README.txt
```

---

## Travaux déjà réalisés

- **Page d'accueil (`index.html`)** : hero, grille de cartes d'apps (PokoCheck,
  TeachBook, Mathik, + une carte « Prochaine app 2026 »), nav, footer. Cartes cliquables
  avec effet tilt (`data-tilt`).
- **Page détail PokoCheck (`pokocheck.html`)** : app **publiée** sur l'App Store
  (id `6760971481`). Hero avec icône, bouton de téléchargement App Store, stats
  (4,4 ★ · 27 avis · v2.0 · 4+ · 84,9 Mo), carrousel des 10 captures, sections
  « À propos » et « Fonctionnalités ». App compagnon (non officielle) pour *Pokopia*.
- **Page détail TeachBook (`teachbook.html`)** : app **publiée** sur l'App Store
  (id `6785545899`, « TeachBook : carnet du prof »). Stats (5,0 ★ · 3 avis · v1.0 ·
  4+ · 56,9 Mo), carrousel des 10 captures iPad, bouton de téléchargement.
  Carnet de notes / agenda / plans de classe pour enseignants (iPadOS + companion
  iPhone, Apple Pencil, iCloud), gratuit à l'essai puis abonnement.
- **Page détail Mathik (`mathik.html`)** : app **publiée** sur l'App Store
  (id `6805966325`, « Mathik : automatismes maths »). Hero avec icône, bouton de
  téléchargement, carrousel des 5 captures iPhone (App Store V1), sections
  « À propos » et « Fonctionnalités ». Automatismes de maths du lycée façon jeu
  (répétition espacée, calcul mental, programmes officiels FR), mascotte π.
- **Page détail Case Closed (`caseclosed.html`)** : app **publiée** (id `6826655216`, octobre
  2026). Jeu de déduction (placer les suspects sur le plan, démasquer le coupable), 25 affaires
  offertes, 655 en tout, packs en achat unique, Game Center, 9 langues. Stats du hero : affaires
  offertes · affaires · langues (l'API `itunes.apple.com/lookup` ne renvoyait encore rien à la
  publication) ; carrousel des 10 affiches App Store françaises. Couleurs `caseclosed`
  (`#FFD84A → #F5A524`). Politique `caseclosed-privacy.html` : données locales, Game Center,
  aucun suivi.
- **Politiques de confidentialité** PokoCheck, TeachBook, Mathik et Case Closed : pages légales
  complètes (stockage local, iCloud, achats Apple, pas de collecte).
- **Design system** complet dans `style.css` : variables de thème, dark mode,
  blobs décoratifs flous, cartes, badges, carrousel de captures (`portrait` /
  `tablet` / `landscape`), sections détail, pages légales, footer, responsive.
- **`tilt.js`** : interaction 3D sur les cartes et icônes.
- **`GUIDE-DEPLOIEMENT.md`** : marche à suivre complète (création du repo,
  upload, activation GitHub Pages, achat domaine `.dev`, config DNS, HTTPS).

### État du déploiement
- Dépôt git en place, remote `origin` = `github.com/kblayassi/portofolio`,
  branche `main`. Un push sur `main` republie le site via GitHub Pages.
- `CNAME` + `.nojekyll` sont en place.
- Contacts utilisés : `contact@kevinblayassi.dev` (général / TeachBook / Mathik),
  `pokocheckapp@icloud.com` (support PokoCheck).

---

## Conventions importantes

- **Deux langues** : toute modification d'une page française se reporte dans sa jumelle
  `en/<même nom>.html` (et inversement). Chaque page porte dans le `<head>` trois liens
  `hreflang` absolus (`fr`, `en`, `x-default` = anglais) puis `<script src="…/lang.js">`, et dans
  la nav une pastille `.nav-lang` (`EN` sur les pages françaises, `FR` sur les anglaises,
  `data-lang` mémorise le choix). `lang.js` : choix mémorisé (`localStorage` « lang ») sinon
  première langue du navigateur (français → FR, tout le reste → EN) ; les robots ne sont pas
  redirigés. Pas de géolocalisation par IP : GitHub Pages ne sert que des fichiers statiques.
- **Pages anglaises** : liens App Store sans pays (`apps.apple.com/app/…`, chaque visiteur
  arrive sur sa boutique). Captures anglaises pour Case Closed et TeachBook
  (`screenshots/<app>/en/`) ; Mathik (français uniquement) et PokoCheck (pas d'affiches anglaises
  sur le Mac) gardent les captures françaises.

- **Fallbacks d'images** : chaque `<img>` a un `onerror` qui remplace l'image
  manquante par un emoji ou un placeholder. Le site reste donc fonctionnel et
  présentable même sans toutes les images. Garder ce pattern en ajoutant des images.
- **Orientation des captures** : la classe sur `<div class="shots-scroll …">`
  contrôle l'affichage — `portrait` (iPhone, 222×480), `tablet` (iPad en portrait,
  ratio 3:4, 360×480) ou `landscape` (iPad horizontal, 560px de large).
  Voir les `README.txt` dans `assets/screenshots/`.
- **Couleurs d'app** : PokoCheck = dégradé vert (`poko`, `#9BE15D → #2E9E54`),
  TeachBook = dégradé bleu/violet (`teacher`), Mathik = dégradé orange
  (`mathik`, `#FFB25A → #F76B15`), Case Closed = dégradé jaune (`caseclosed`,
  `#FFD84A → #F5A524`). Réutiliser ces classes pour rester cohérent.
- **Icônes d'app** : PNG 1024×1024 **avec les coins arrondis cuits dans l'image**
  (alpha transparent). Le CSS n'arrondit rien — `.detail-icon img` est en
  `object-fit: contain`, sans `border-radius`. Les bundles `.icon` d'Icon Composer
  rendent un carré plein : il faut donc appliquer le masque « squircle » soi-même.
  Le plus simple est de réutiliser le canal alpha de `icon-pokocheck.png`, qui porte
  déjà la bonne forme (voir `assets/screenshots/mathik/README.txt`).
- **Cache-busting** : le `<link>` vers `style.css` porte un `?v=N`. GitHub Pages
  sert le CSS avec `max-age=600` : sans ce paramètre, un visiteur déjà venu garde
  jusqu'à 10 min l'ancien style avec le nouveau HTML. **Incrémenter `N` dans
  toutes les pages à chaque modification de `style.css`.**
- **Aperçus de lien (Open Graph)** : chaque page porte, juste après `<meta name="description">`,
  un bloc `og:*` complet + `twitter:card` (`summary_large_image`) et `twitter:title|description|image|image:alt` (copies des `og:*` : X les lit plus fiablement). L'image (`og:image`, URL
  absolue) est `assets/og/<app>-<fr|en>.jpg` (1200×630), `home-*` pour l'accueil ; les pages
  légales réutilisent l'image de leur app. Les images sont générées par
  `swift tools/make-og.swift` (icône + nom + slogan) : relancer après un changement d'icône ou
  de slogan, et y ajouter toute nouvelle app.
- **Liens App Store** : ouverts dans un nouvel onglet ; sur la carte d'accueil,
  le bouton App Store stoppe la propagation pour ne pas suivre le lien de la carte.

---

## Points d'attention / TODO connus

- **`favicon.png` manquant** : référencé par `<link rel="icon">` dans toutes les
  pages mais absent de `assets/`. À ajouter (le navigateur affiche une favicon
  par défaut en attendant).
- **Icône TeachBook** : `assets/icon-teacher.png` (cahier « 20 » + Pencil) ne
  correspond plus à l'icône App Store actuelle (« A+ » violet). À remplacer.
- **Stats Mathik** : la ligne du hero affiche Plateforme · Niveau · Langue, faute
  de chiffres fiables — l'API `itunes.apple.com/lookup` ne renvoie encore rien pour
  l'id `6805966325`. À aligner sur PokoCheck / TeachBook (note · avis · version ·
  âge · taille) dès que Kevin les fournit.
- **Lien App Store Mathik** : pointé sur `apps.apple.com/app/id6805966325` (sans
  locale, Apple redirige vers la boutique du visiteur), alors que les autres pages
  utilisent la forme `/fr/app/<slug>/id…`. À harmoniser si l'app est bien
  distribuée en France.
- **Captures iPad Mathik** : des captures iPad 13" (V1) existent dans la source
  mais ne sont pas sur le site (un carrousel ne gère qu'une orientation).

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
