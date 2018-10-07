// noscroll.js

document.body.addEventListener('scroll', function(e){ e.preventDefault(); }, { passive: false });
document.body.addEventListener('touchmove', function(e){ e.preventDefault(); }, { passive: false });
