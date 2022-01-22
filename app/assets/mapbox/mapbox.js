mapboxgl.accessToken =
    'pk.eyJ1IjoiaGFuZHlidW5ueSIsImEiOiJja3lwOHdxZmIwN3NwMm9veTkycHFwcXd3In0.v_s_1-4y8gSAXEZkons7Fw';
const map = new mapboxgl.Map({
    container: 'map', // Specify the container ID
    style: 'mapbox://styles/mapbox/streets-v11', // Specify which map style to use
    center: [-122.42136449, 37.80176523], // Specify the starting position
    zoom: 14.5, // Specify the starting zoom
});
