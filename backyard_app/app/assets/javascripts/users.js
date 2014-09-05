$(document).ready(function() {


  $("#user-review").hide();

  $("#userreview-button").click(function() {
    $("#user-review").toggle();
  });

  $("#user-review").on('submit', function(e) {
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
        $("#userreview-display").append(
          data.description);

        $("#userreview-display").append(
          data.rating);

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