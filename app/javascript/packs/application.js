import "bootstrap";
import '../navbar';
import listsAnimations from '../lists';
import searchListener from '../search';




import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
searchListener();
listsAnimations();


