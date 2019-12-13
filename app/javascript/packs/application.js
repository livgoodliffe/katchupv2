import "bootstrap";
import '../navbar';
import listsAnimations from '../lists';
import searchListener from '../search';
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';

initMapbox();
searchListener();
listsAnimations();


