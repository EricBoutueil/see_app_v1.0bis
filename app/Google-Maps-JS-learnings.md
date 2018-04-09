## abc-summary -> parrallel
<div id="map"></div> #harbours index

# STEP 0
function initMap() { # apparently not needed with gmap ?
#STEP 1
map = new google.maps.Map(document.getElementById('map'), {... #map.js
#STEP 2
map.data.loadGeoJson( #map.js
  'data.json'); #harbours controller form data set in harbours index
# STEP 3
map.data.setStyle(function(feature) { #map.js
# STEP 4
map.data.addListener('click', function(event) { #map.js



## V1 Le Wagon - WORKING

# harbours controller
    @markers = @harbours.map do |harbour|
      {
        lat: harbour.latitude,
        lng: harbour.longitude#,
        # infoWindow: { content: render_to_string(partial: "/harbours/map_box", locals: { harbour: harbour }) }
      }
    end

# habours index
    <div
      id="map"
      style="width: 100%;
      height: 600px;"
      data-markers="<%= @markers.to_json %>"
    ></div>

# map.js
import GMaps from 'gmaps/gmaps.js';
const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}
