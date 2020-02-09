// if (navigator.serviceWorker) {
//   navigator.serviceWorker.register('/service-worker.js', { scope: './' })
//     .then(function(reg) {
//       console.log('[Companion]', 'Service worker registered!');
//       console.log(reg);
//     });
// }

 // google instructions

 if ('serviceWorker' in navigator) {
   window.addEventListener('load', function() {
     navigator.serviceWorker.register('./service-worker.js').then(function(registration) {
       // Registration was successful
       console.log('ServiceWorker registration successful with scope: ', registration.scope);
     }, function(err) {
       // registration failed :(
       console.log('ServiceWorker registration failed: ', err);
     });
   });
 }

import "bootstrap";
import '../navbar';
import listsAnimations from '../lists';
import searchListener from '../search';
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';
import geoLocation from '../geolocation';

initMapbox();
searchListener();
listsAnimations();
geoLocation();

