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

$(document).ready(function() {
  equalHeights($('.content'), $('aside'));
});