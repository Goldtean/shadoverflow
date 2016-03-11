$(document).ready(function() {

  $(".button.green").on('click', upvote)
  // $(".button red").on('click', downvote)
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

var upvote = function(event) {
  event.preventDefault();
  var questionId = $(this).parents().eq(3).attr('id')
  var route = "/questions/" + questionId + "/upvotes";
  $.post(route,{up_or_down: true, votable_id: questionId }, updateCount);

}

var updateCount = function(response){
  var voteCount = JSON.parse(response)
  var selector = '.vote-score-' + questionId
  // $(selector).html(voteCount)
}
// var downvote = function(event) {

// }
