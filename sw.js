/**
 * Welcome to your Workbox-powered service worker!
 *
 * You'll need to register this file in your web app and you should
 * disable HTTP caching for this file too.
 * See https://goo.gl/nhQhGp
 *
 * The rest of the code is auto-generated. Please don't update this file
 * directly; instead, make changes to your Workbox build configuration
 * and re-run your build process.
 * See https://goo.gl/2aRDsh
 */

importScripts("workbox-v4.3.1/workbox-sw.js");
workbox.setConfig({modulePathPrefix: "workbox-v4.3.1"});

workbox.core.skipWaiting();

workbox.core.clientsClaim();

/**
 * The workboxSW.precacheAndRoute() method efficiently caches and responds to
 * requests for URLs in the manifest.
 * See https://goo.gl/S9QRab
 */
self.__precacheManifest = [
  {
    "url": "index.html",
    "revision": "ee42d577b7d35f0a8aca82d36853359a"
  },
  {
    "url": "manifest.webmanifest",
    "revision": "c1e36f278d34c2cf14e8f43e2790f1a0"
  },
  {
    "url": "src.bc82357e.js",
    "revision": "504ff2569d75fcfa9cfe08b205eb1ecd"
  },
  {
    "url": "style.3bd892fa.css",
    "revision": "92ae38b7825985b7af126fa75dfd26e9"
  },
  {
    "url": "/",
    "revision": "b334906a04aa8415e5ae47a9d67751a5"
  }
].concat(self.__precacheManifest || []);
workbox.precaching.precacheAndRoute(self.__precacheManifest, {});

workbox.routing.registerRoute(/\/.+\.[0-9a-f]+\.[a-z]+$/i, new workbox.strategies.CacheFirst(), 'GET');
