$('.login-input').on('focus', function() {
  $('.login').addClass('focused');
});

$('.login').on('submit', function(e) {
  $('#login.login').removeClass('focused').addClass('loading');
});