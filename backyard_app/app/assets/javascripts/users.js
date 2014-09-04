$(document).ready(function() {

  // approve renters!
  $(".approval-form").on('click', "input", function(e) {
    e.preventDefault();
    $(this).hide();

    var agreementURL = $(this).parent().attr('action');
    var status = this.name;


    function saveAgreement() {
      console.log("clicked!!")
      var data = { agreement: { approved: status }};
      console.log(data)
      $.ajax({
        type: 'PATCH',
        url: agreementURL,
        data: data,
        success: function(data) {
          console.log("Success!", data);
        },
        error: function(data) {
          console.log("ERROR");
        }
      }); //closing ajax
    } //closing saveAgreement
    saveAgreement();
  }); //closing on submit


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