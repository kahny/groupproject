$(document).ready(function() {

  $("#rental-review").hide();

  $("#review-button").click(function() {
    $("#rental-review").toggle();
  });

  $("#rental-review").on('submit', function(e) {
    e.preventDefault();

    var rating = $("#rating-val").val();
    var description = $("#description-val").val();
    var formURL = $(this).attr('action');


    function testAjax() {
      console.log(rating);
      console.log(description);
      console.log(formURL);
        $.ajax({
        type: 'POST',
        url: formURL,
        data: {review: {rating: rating, description: description}},
        success: function(data) {
          console.log("Success with data!", data);
        },
        error: function(data) {
          console.log("ERROR ");
        }
      }); //closing AJAX
    }

    testAjax();

  }); //closing onsubmit


  // ajax: append review body to page.

}); //closing all