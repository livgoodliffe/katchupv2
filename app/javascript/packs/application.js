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
