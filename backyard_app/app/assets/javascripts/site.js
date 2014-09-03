// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){

 $("#search-bar").on('submit', function(e){
 	var value = $(".searchval").val();

 	$(".leaflet-marker-pane img").remove();
 	e.preventDefault();
 	$.ajax({
 			// datatype: "html",
      url: "/search",
      data: { search: value},
      success: function(data){
      	var myLayer = L.mapbox.featureLayer().addTo(map);

      	$(".searchval").val("");

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

        });


      },
      error: function(data) {
      	alert("Error");
				$("listings").html("<h1>No listings found</h1>");

      }
    });
 });
});

