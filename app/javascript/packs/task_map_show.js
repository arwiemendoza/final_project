mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuZHlidW5ueSIsImEiOiJja3lwOHdxZmIwN3NwMm9veTkycHFwcXd3In0.v_s_1-4y8gSAXEZkons7Fw';
      
navigator.geolocation.getCurrentPosition(successLocation, errorLocation, {enableHighAccuracy: true})

const longitude = parseFloat(document.getElementById("task_longitude").textContent)
const latitude = parseFloat(document.getElementById("task_latitude").textContent)
console.log(longitude)
console.log(latitude)
document.getElementById("myText").value
function successLocation(){
    console.log("please fix me")
    setupMap([longitude, latitude])
}

function errorLocation(){
    setupMap([14.556586, 121.023415])
}

const coords = [longitude, latitude]
function setupMap(center){
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: center,
        zoom: 15
    });

    const nav = new mapboxgl.NavigationControl();
    map.addControl(nav)

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
        map.getSource('single-point').setData(coords);
    });
}