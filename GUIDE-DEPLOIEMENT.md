# Guide de déploiement — kevinblayassi.dev

Ton site est prêt. Voici comment le déployer sur GitHub Pages avec ton domaine `kevinblayassi.dev`.

---

## Structure du site

```
kevinblayassi-site/
├── index.html              ← page d'accueil (hub)
├── pokocheck.html          ← page détail PokoCheck
├── teachbook.html    ← page détail TeachBook (coming soon)
├── pokocheck-privacy.html  ← politique de confidentialité
├── CNAME                   ← contient "kevinblayassi.dev" (ne pas supprimer)
├── .nojekyll               ← évite le traitement Jekyll de GitHub (ne pas supprimer)
└── assets/
    ├── style.css           ← tout le style
    ├── tilt.js             ← effet de suivi de souris
    ├── memoji.png          ← À AJOUTER : ton Memoji
    ├── icon-pokocheck.png  ← À AJOUTER : icône PokoCheck
    ├── icon-teacher.png    ← À AJOUTER : icône TeachBook
    ├── favicon.png         ← À AJOUTER : favicon du site
    └── screenshots/        ← À AJOUTER : captures d'écran des apps
```

---

## Avant de déployer : ajoute tes images

Le site fonctionne déjà sans images (il affiche des emojis et placeholders de secours), mais pour un rendu pro, ajoute :

1. **Ton Memoji** → `assets/memoji.png`
   Sur iPhone : Messages → ouvre une conversation → Memoji → choisis une pose → capture d'écran → recadre en carré. Ou exporte un autocollant Memoji.

2. **Les icônes d'apps** → `assets/icon-pokocheck.png` et `assets/icon-teacher.png`
   Format carré, 512x512 px minimum.

3. **Le favicon** → `assets/favicon.png` (carré, 64x64 ou plus)

4. **Les captures PokoCheck** → `assets/screenshots/poko-1.png`, etc.
   Puis dans `pokocheck.html`, remplace chaque bloc :
   ```html
   <div class="shot"><div class="shot-placeholder">Capture 1...</div></div>
   ```
   par :
   ```html
   <div class="shot"><img src="assets/screenshots/poko-1.png" alt="Capture PokoCheck"></div>
   ```

---

## Étape 1 — Créer le dépôt GitHub

1. Va sur https://github.com et connecte-toi (ou crée un compte)
2. Clique sur le **+** en haut à droite → **New repository**
3. Nomme-le **exactement** : `kevinblayassi.github.io` (remplace `kevinblayassi` par ton vrai nom d'utilisateur GitHub)
   - Ce nom spécial active automatiquement GitHub Pages sur ton domaine racine
   - Alternative : tu peux le nommer autrement (ex: `portfolio`), mais l'URL par défaut sera `kevinblayassi.github.io/portfolio`
4. Laisse-le **Public**
5. Ne coche rien d'autre, clique **Create repository**

---

## Étape 2 — Uploader les fichiers

### Option simple (sans terminal) :
1. Sur la page du dépôt vide, clique **uploading an existing file**
2. Glisse-dépose **tout le contenu** du dossier `kevinblayassi-site` (pas le dossier lui-même, son contenu)
3. Important : assure-toi que `index.html` est à la racine, pas dans un sous-dossier
4. En bas, écris un message (ex: "Initial site") et clique **Commit changes**

### Option terminal (si tu préfères) :
```bash
cd /chemin/vers/kevinblayassi-site
git init
git add .
git commit -m "Initial site"
git branch -M main
git remote add origin https://github.com/TON_USERNAME/kevinblayassi.github.io.git
git push -u origin main
```

---

## Étape 3 — Activer GitHub Pages

1. Dans ton dépôt, va dans **Settings** (onglet en haut)
2. Menu de gauche → **Pages**
3. Sous "Build and deployment" → Source : **Deploy from a branch**
4. Branch : **main** / dossier **/ (root)** → **Save**
5. Attends 1-2 minutes. Une URL apparaît : `https://TON_USERNAME.github.io`

À ce stade, ton site est déjà en ligne sur l'URL github.io. Vérifie qu'il s'affiche bien.

---

## Étape 4 — Acheter et connecter le domaine kevinblayassi.dev

### Acheter le domaine
Les domaines `.dev` se trouvent chez la plupart des registrars. Recommandés :
- **Cloudflare** (~12€/an, prix coûtant, le moins cher)
- **Namecheap** (~13€/an)
- **Google Domains → Squarespace** (~14€/an)

Note : les `.dev` exigent HTTPS (HSTS preload), mais GitHub Pages le gère automatiquement, donc aucun souci.

### Connecter le domaine à GitHub Pages

Une fois le domaine acheté, va dans la gestion DNS de ton registrar et ajoute ces enregistrements :

**Pour le domaine racine (kevinblayassi.dev) — 4 enregistrements A :**
```
Type: A    Nom: @    Valeur: 185.199.108.153
Type: A    Nom: @    Valeur: 185.199.109.153
Type: A    Nom: @    Valeur: 185.199.110.153
Type: A    Nom: @    Valeur: 185.199.111.153
```

**Pour le www (www.kevinblayassi.dev) — 1 enregistrement CNAME :**
```
Type: CNAME    Nom: www    Valeur: TON_USERNAME.github.io
```

### Configurer dans GitHub
1. Retourne dans **Settings → Pages**
2. Section "Custom domain" → entre `kevinblayassi.dev` → **Save**
   (Le fichier CNAME est déjà dans tes fichiers, donc ça devrait se remplir tout seul)
3. Attends que la vérification DNS passe (peut prendre de quelques minutes à 24h)
4. Une fois validé, coche **Enforce HTTPS**

---

## Étape 5 — Vérifier

- `https://kevinblayassi.dev` → ta page d'accueil
- `https://kevinblayassi.dev/pokocheck.html` → page PokoCheck
- `https://kevinblayassi.dev/pokocheck-privacy.html` → privacy policy

---

## Mettre à jour le site plus tard

Chaque fois que tu modifies un fichier :
- Option simple : édite directement sur GitHub (clic sur le fichier → crayon → commit)
- Option terminal : `git add . && git commit -m "Update" && git push`

Le site se met à jour automatiquement en 1-2 minutes.

---

## Pense à mettre à jour l'App Store

Une fois le site en ligne, dans App Store Connect, remplace l'URL de ta privacy policy PokoCheck par :
`https://kevinblayassi.dev/pokocheck-privacy.html`

Tu peux alors résilier ton abonnement AppHQ (3$/mois économisés).

---

## Besoin d'aide ?

Si un truc bloque (DNS qui ne propage pas, HTTPS qui ne s'active pas, images qui ne s'affichent pas), reviens me voir avec une capture de l'erreur ou de ta config DNS, et on débogue ensemble.
