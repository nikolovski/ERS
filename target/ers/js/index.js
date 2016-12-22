$('.login-input').on('focus', function() {
  $('.login').addClass('focused');
});

$('.login').on('submit', function(e) {
  $('.login').removeClass('focused').addClass('loading');
});
