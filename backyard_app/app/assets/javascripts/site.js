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
      },
      error: function(data) {
      	alert("Error");
      }
    });
 });
});