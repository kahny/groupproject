$(document).ready(function() {

  // approve renters!
  // $("#approval-button").on('click', function(e) {
  //   e.preventDefault();

  //   var url = $(this).attr('action');
  //   var approve = $(this).attr('data-value');

  //   $.post(url, { button: approve })
  //     .done(function(data) {
  //       console.log("THIS IS THE DATA ", data);
  //     });
  // });


  //display reviews to current user
  $("#userreview-display-CU").hide();

  $("#review-show-link").click(function() {
    $("#userreview-display-CU").toggle();
  });


  // hiding review form
  $("#user-review").hide();

  $("#userreview-button").click(function() {
    $("#user-review").toggle();
  });


  // review on submit function
  $("#user-review").on('submit', function(e) {
    e.preventDefault();

    var rating = $("#rating-val").val();
    var description = $("#description-val").val();
    var user = $("#user-val").val();
    var formURL = $(this).attr('action');

    // appending review to page
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