$(document).ready(function (){

  var searched = false;

  $("#add").hide();
  $("#search").show();
  // $("#search").hide();
  $("#results").hide();

  $("#find")
    .on('click', function() {
      if (!searched) {
        $("#search").fadeIn("fast");
        $("#add").hide();
        $("#results").hide();
      }
      else {
        $("#results").fadeIn("fast");
        $("#add").hide();
        $("#search").hide();
      }
    });

  $("#post")
    .on('click', function() {
      $("#add").fadeIn("fast");
      $("#search").hide();
      $("#results").hide();
    });

  $("#findb")
    .on('click', function() {
      searched = true;
      $("#results").fadeIn("fast");
      $("#search").hide();
      $("#add").hide();
    });

});