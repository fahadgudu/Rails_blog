// Enable pusher logging - don't include this in production
$( document ).ready(function() {
  $(".media").show("normal");    
    Pusher.log = function(message) {
      if (window.console && window.console.log) {
        window.console.log(message);
      }
    };

    var pusher = new Pusher('a16839422f89659d4616', {
      encrypted: true
    });
    var url = window.location.pathname.split('/');
    var channel = pusher.subscribe(url[1] + url[2]);
    channel.bind('comments/create', function(html) {
      $("#new_comment")[0].reset();
      $(String(html)).prependTo("#comments").fadeIn('slow')
    });
  });