$(document).ready(function() {

  // hiding review form
  $("#rental-review").hide();

  //on click, show form
  $("#review-button").click(function() {
    $("#rental-review").toggle();
  });

  //submit review form
  $("#rental-review").on('submit', function(e) {
    e.preventDefault();

    var rating = $("#rating-val").val();
    var description = $("#description-val").val();
    var user = $("#user-val").val();
    var formURL = $(this).attr('action');

    function reviewsToPage() {
      $.ajax({
      type: 'POST',
      url: formURL,
      data: {review: {user: user, rating: rating, description: description}},
      success: function(data) {
        console.log("Success with data!", data);

        // append new review to page
        $("#review-display").append(
          data.description);

        // reset form values
        $("#rating-val").val(1);
        $("#description-val").val("");
      },
      error: function(data) {
        console.log("ERROR");
      }
    }); //closing AJAX
    } //closing function reviewsToPage

    reviewsToPage();
  }); //closing on submit



}); //closing all

