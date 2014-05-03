function equalHeights (element1, element2) {
  var height;

  if (element1.outerHeight() > element2.outerHeight())
  {
    height = element1.outerHeight();
    element2.css('height', height);
  }
  else {
    height = element2.outerHeight();
    element1.css('height', height);
  }
}

$(function() {
  $(".rslides").responsiveSlides({
     timeout: 5000,
     speed: 2000
  });
});

$(document).ready(function() {
  equalHeights($('.content'), $('aside'));
});
$(document).on('page:load', function() {
  equalHeights($('.content'), $('aside'))
});

$(document).ready(function() {
  $('#login').on('click', 'a:first-of-type', function() {
    $('#login').submit();
  })
});

$(document).on('page:load', function() {
  $('#login').on('click', 'a:first-of-type', function() {
    $('#login').submit();
  })
});