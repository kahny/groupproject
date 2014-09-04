// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/



$(function(){
 $("#search-bar").on('submit', function(e){
	  e.preventDefault();
	  var value = $(".searchval").val();

	 	$(".leaflet-marker-pane img").remove();
	 	listingCall(value);
  });

  var listingCall = function(value){
	  $.ajax({
	 			// datatype: "html",
	      url: "/search/new",
	      data: { search: value},
	      success: function(data){
	      	var myLayer = L.mapbox.featureLayer().addTo(map);

	      	$(".searchval").val("");



	      	var lat = data.features[data.features.length-1][0];
	      	var long = data.features[data.features.length-1][1];

	      	$("#listings").html("");
	      	// debugger;
	      	var compiledTemplate = HandlebarsTemplates["search/index"]({result: data.features});
	      	// console.log(compiledTemplate);
	      	// console.log(data.title);
	      	console.log(data.features);
	      	if (data.features.length < 2) {
						$("#listings").html("<h1>No listings found</h1>");
	      	} else {
	      		$("#listings").html(compiledTemplate);
	      	}

	      	map.setView([lat,long],12);

	        myLayer.setGeoJSON(data);
	        myLayer.on('click', function(e) {
	          e.layer.unbindPopup();

	        });


	      },
	      error: function(data) {
	      	console.log("Error");

	      }
	    });
		};

		if (typeof result !== 'undefined') {
			listingCall(result);
		}
});