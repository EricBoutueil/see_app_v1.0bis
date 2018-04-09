// function definitions

var totalVolumeMax = 0;

function initMap() {

  var map;

  // look for the correct element 'map' in the DOM, so need DOM charged
  var mapElement = document.getElementById('map');

  if (mapElement) {
    // STEP 1: init map
    map = new google.maps.Map(mapElement, {
          zoom: 6,
          center: {lat: 43.3, lng: 5.4}
        });

    // STEP 2: load GeoJson
    var jsonparsed = JSON.parse(mapElement.dataset.geojson);
    map.data.addGeoJson(jsonparsed);

    // check max totvol
    map.data.forEach(function(feature) {
        if (feature.getProperty('totvol') > totalVolumeMax) {
          totalVolumeMax = feature.getProperty('totvol');
        };
    });
    // console.log(totalVolumeMax)

    // STEP 3: set style
    map.data.setStyle(function(feature) {
      var totalVolume = feature.getProperty('totvol');
      return {
        icon: getCircle(totalVolume)
      };
    });

  };
  // else { console.log("there is no mapElement")};
}

// note: markers ares symbols (circles)
function getCircle(totalVolume) {
  return {
    path: google.maps.SymbolPath.CIRCLE,
    fillColor: 'blue',
    fillOpacity: .8,
    scale: (totalVolume * 20 / totalVolumeMax),
    strokeColor: 'blue',
    strokeWeight: 1
  };
}

// google.maps.event.addDomListener(window, "load", initMap);

// execution

initMap();

// var mapElement = document.getElementById('map');
// eventListener dataset

export { initMap, getCircle };
