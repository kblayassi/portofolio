Captures Mathik : screen1.jpg … screen5.jpg (format iPhone 6.5", 1284x2778).
Source : Documents/Swift/AutoMATHismes/ressources/
         "AppStore screenshots/Version 1/1-6.5_inch Screenshots"
Redimensionnées pour le web : sips -Z 1400 -s format jpeg -s formatOptions 78

Orientation : captures iPhone en portrait (ratio ~9:19,5).
La page utilise donc la classe "portrait" sur <div class="shots-scroll portrait">
(et non "tablet", calibrée pour l'iPad en portrait, ni "landscape").

Des captures iPad 13" (V1) existent aussi dans la même source, dossier
"2-ipad_13 inch Screenshots", si l'on veut un second carrousel un jour.

Icône : assets/icon-mathik.png (1024px) — rendu de AppIcon-orange.icon
(dégradé beige + mascotte mathik-couleur1-malicieux), puis découpé au
"squircle" Apple. Le masque n'est pas recalculé : on réutilise le canal alpha
de assets/icon-pokocheck.png, qui porte déjà la bonne forme. Les .icon
d'Icon Composer rendent un carré plein ; le CSS n'arrondit pas (.detail-icon img
est en object-fit: contain, sans border-radius), donc les coins arrondis doivent
être cuits dans le PNG comme pour PokoCheck et TeachBook.
