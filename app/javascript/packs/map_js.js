mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuZHlidW5ueSIsImEiOiJja3lwOHdxZmIwN3NwMm9veTkycHFwcXd3In0.v_s_1-4y8gSAXEZkons7Fw';
      
navigator.geolocation.getCurrentPosition(successLocation, errorLocation, {enableHighAccuracy: true})

function successLocation(position){
    console.log(position)
    setupMap([position.coords.longitude, position.coords.latitude])
}

function errorLocation(){
    setupMap([14.556586, 121.023415])
}

function setupMap(center){
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: center,
        zoom: 15
    });

    const nav = new mapboxgl.NavigationControl();
    map.addControl(nav)

    const geocoder = new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl
    })
    map.addControl(geocoder, 'top-left')

    map.on('load', () => {
    map.addSource('single-point', {
        type: 'geojson',
        data: {
        type: 'FeatureCollection',
        features: []
        }
    });

    map.addLayer({
        id: 'point',
        source: 'single-point',
        type: 'circle',
        paint: {
        'circle-radius': 10,
        'circle-color': '#448ee4'
        }
    });

    geocoder.on('result', (event) => {
        console.log(event.result.geometry.coordinates)
        var taskLong = document.getElementById("task_longitude");
        taskLong.value = event.result.geometry.coordinates[0];
        var taskLat = document.getElementById("task_latitude");
        taskLat.value = event.result.geometry.coordinates[1];
        map.getSource('single-point').setData(event.result.geometry);
    });
    });
}