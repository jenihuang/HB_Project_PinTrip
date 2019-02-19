function initMap() {

    let myLatLng = {lat: 37.77493, lng: -122.41942};

    let map = new google.maps.Map(document.getElementById('map'), {
        center: myLatLng,
        scrollwheel: false,
        zoom: 9,
        zoomControl: true,
        panControl: false,
        streetViewControl: false,
    });

    let infoWindow = new google.maps.InfoWindow({
        width: 150
    });

    // Retrieving the information with AJAX
    $.get('/map.json', function (photos) {

      let photo, marker, html;

      for (let key in photos) {
            photo = photos[key];

            // Define the marker
                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(photo.lat, photo.lon),
                    map: map,
                    title: 'photo ID: ' + photo.img_id,
                    icon: '../static/imgs/heart.jpg'
                });

            // Define the content of the infoWindow
            html = (
              '<div class="window-content">' +
                    `<img src="${photo.url}" alt="photo" style="width:150px;" class="thumbnail">` +
              '</div>');

            // Inside the loop we call bindInfoWindow passing it the marker,
            // map, infoWindow and contentString
            bindInfoWindow(marker, map, infoWindow, html);
      }

    });

    // This function is outside the for loop.
    // When a marker is clicked it closes any currently open infowindows
    // Sets the content for the new marker with the content passed through
    // then it open the infoWindow with the new content on the marker that's clicked
    function bindInfoWindow(marker, map, infoWindow, html) {
        google.maps.event.addListener(marker, 'click', function () {
            infoWindow.close();
            infoWindow.setContent(html);
            infoWindow.open(map, marker);
        });
    }
}

// google.maps.event.addDomListener(window, 'load', initMap);

