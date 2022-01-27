mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuZHlidW5ueSIsImEiOiJja3lwOHdxZmIwN3NwMm9veTkycHFwcXd3In0.v_s_1-4y8gSAXEZkons7Fw';
      
navigator.geolocation.getCurrentPosition(successLocation, errorLocation, {enableHighAccuracy: true})

function successLocation(position){
    console.log(position)
    var userLong = document.getElementById("user_longitude");
    userLong.value = position.coords.longitude;
    var userLat = document.getElementById("user_latitude");
    userLat.value = position.coords.latitude;
}

function errorLocation(){
    console.log("Could not find your location")
}