// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

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