(function () {
  'use strict';

  var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (reduceMotion) return;

  function makeTilt(el, maxDeg, lift) {
    var targetX = 0, targetY = 0;
    var curX = 0, curY = 0;
    var hovering = false;
    var raf = null;

    function animate() {
      curX += (targetX - curX) * 0.15;
      curY += (targetY - curY) * 0.15;

      if (Math.abs(targetX - curX) < 0.01 && Math.abs(targetY - curY) < 0.01 && !hovering) {
        el.style.transform = 'rotateY(0deg) rotateX(0deg) translateY(0px) scale(1)';
        raf = null;
        return;
      }

      var scale = hovering ? 1.02 : 1;
      var ty = hovering ? lift : 0;
      el.style.transform =
        'perspective(900px) rotateY(' + curX.toFixed(3) + 'deg) rotateX(' + curY.toFixed(3) + 'deg) translateY(' + ty + 'px) scale(' + scale + ')';
      raf = requestAnimationFrame(animate);
    }

    function start() {
      if (!raf) raf = requestAnimationFrame(animate);
    }

    el.addEventListener('mouseenter', function () {
      hovering = true;
      start();
    });

    el.addEventListener('mousemove', function (e) {
      var r = el.getBoundingClientRect();
      var x = (e.clientX - r.left) / r.width - 0.5;
      var y = (e.clientY - r.top) / r.height - 0.5;
      targetX = x * maxDeg;
      targetY = -y * maxDeg;
      start();
    });

    el.addEventListener('mouseleave', function () {
      hovering = false;
      targetX = 0;
      targetY = 0;
      start();
    });
  }

  document.querySelectorAll('[data-tilt]').forEach(function (el) {
    makeTilt(el, 7, -6);
  });
  document.querySelectorAll('[data-tilt-icon]').forEach(function (el) {
    makeTilt(el, 13, 0);
  });
})();
