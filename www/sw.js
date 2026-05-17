const CACHE='rife-v4';
const ASSETS=['/frequenz-audio-app/','/frequenz-audio-app/index.html','/frequenz-audio-app/mobile.html','/frequenz-audio-app/logo.svg','/frequenz-audio-app/manifest.json','/frequenz-audio-app/icon-192.png','/frequenz-audio-app/icon-512.png'];
self.addEventListener('install',e=>{e.waitUntil(caches.open(CACHE).then(c=>c.addAll(ASSETS)).then(()=>self.skipWaiting()));});
self.addEventListener('activate',e=>{e.waitUntil(caches.keys().then(ks=>Promise.all(ks.filter(k=>k!==CACHE).map(k=>caches.delete(k)))).then(()=>self.clients.claim()));});
self.addEventListener('fetch',e=>{e.respondWith(caches.match(e.request).then(r=>r||fetch(e.request)));});
