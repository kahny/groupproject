// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){


 $("#search-bar").on('submit', function(e){
 	var value = $(".searchval").val();

 	e.preventDefault();
 	$.ajax({
 			// datatype: "html",
      url: "/search",
      data: { search: value},
      success: function(data){
      	var myLayer = L.mapbox.featureLayer().addTo(map);


      	console.log(data);
      	$("#listings").html("");
      	// debugger;
      	var compiledTemplate = HandlebarsTemplates["site/index"]({result: data.features});
      	console.log(compiledTemplate);
      	console.log(data.title);

      	$("#listings").append(compiledTemplate);


        myLayer.setGeoJSON(data);
        myLayer.on('click', function(e) {
          e.layer.unbindPopup();
          // for making marker a link
          // window.location.href=e.layer.feature.properties.url;
        });

				// map.featureLayer.on('ready', function(e) {
				//     var markers = [];
				//     this.eachLayer(function(marker) { markers.push(marker); });
				//     cycle(markers);
				// });

				// function cycle(markers) {
				//     var i = 0;
				//     function run() {
				//         if (++i > markers.length - 1) i = 0;
				//         map.setView(markers[i].getLatLng(), 12);
				//         markers[i].openPopup();
				//         window.setTimeout(run, 3000);
				//     }
				//     run();
				// }



      },
      error: function(data) {
      	alert("Error");
				$("listings").html("<h1>No listings found</h1>")

      }
    });
 });
});

