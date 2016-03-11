$(document).ready(function() {

  // $(".button green").on('click', upvote);
  // $(".button red").on('click', downvote);
  $("#question-answer-link").on('click', displayForm);
  $("#question-answer-form").on('submit', addQuestion);
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(window).bind("pageshow", function(event) {
    if(event.originalEvent.persisted) {
      window.location.reload()
    }
  });
});

// var upvote = function(event) {
//   event.preventDefault();
//   var  = $(this).val()
//   var route = $(this).attr('button');
//   $.post(route,{up_or_down: true, user_id: session[:id], }, );
//   $(this).hide()


//   $(this).append(response)
// }

// var downvote = function(event) {

// }

var displayForm = function(event) {
  event.preventDefault();
  $("#question-answer-form").show();
  $("#question-answer-link").hide();
}

var addQuestion = function(event) {
  event.preventDefault();
  $("#question-answer-form").hide();
  $("#question-answer-link").show();
  var formData = $(this).serialize();
  var formRoute = $(this).attr('action');
  $.post(formRoute, formData, displayQuestion);
}

var displayQuestion = function(response) {
  $('.question-table').append(response);
}