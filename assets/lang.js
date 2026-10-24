(function () {
  'use strict';

  // French pages live at the root, their English twins under en/ with the same file name.
  // A visitor who picked a language with the FR / EN switch keeps it; otherwise the first
  // language of the browser decides (French → French pages, anything else → English).
  // Crawlers are left where they are, so that both versions get indexed (see the hreflang links).
  var KEY = 'lang';
  var page = document.documentElement.lang === 'en' ? 'en' : 'fr';

  document.addEventListener('click', function (event) {
    var link = event.target.closest && event.target.closest('[data-lang]');
    if (!link) return;
    try { localStorage.setItem(KEY, link.getAttribute('data-lang')); } catch (e) {}
  });

  var wanted = null;
  try { wanted = localStorage.getItem(KEY); } catch (e) {}
  if (wanted !== 'fr' && wanted !== 'en') {
    if (/bot|crawl|spider|slurp|preview|lighthouse/i.test(navigator.userAgent)) return;
    var first = (navigator.languages && navigator.languages[0]) || navigator.language || '';
    wanted = /^fr\b/i.test(first) ? 'fr' : 'en';
  }
  if (wanted === page) return;

  var path = location.pathname;
  var file = path.slice(path.lastIndexOf('/') + 1);
  location.replace((page === 'en' ? '../' : 'en/') + file + location.search + location.hash);
})();
