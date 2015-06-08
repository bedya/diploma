// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree 

  var handler = function ( event ){
  event = event || window.event;
    var target = event.target || event.srcElement;
    if ( target.nodeType == 1 && target.nodeName.toLowerCase() == "input" && target.type == "checkbox" && target.checked ) {
      var inputs = document.getElementsByTagName("input");
      for ( var i = 0; inputs[i]; i++ ) {
        if ( inputs[i].type == "checkbox" && inputs[i] != target ) {
          inputs[i].checked = false;
        }
      }
    }
  }
  if (document.addEventListener){
    document.addEventListener('click', handler, false);
  } else if (document.attachEvent){
    document.attachEvent('onclick', handler);
  }
