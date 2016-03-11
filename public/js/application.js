$(document).ready(function() {

  $(".button green").on('click', upvote)
  $(".button red").on('click', downvote)
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
  var  = $(this).val()
  var route = $(this).attr('button');
  $.post(route,{up_or_down: true, user_id: session[:id], }, );
  $(this).hide()


  $(this).append(response)
}

var downvote = function(event) {

}
