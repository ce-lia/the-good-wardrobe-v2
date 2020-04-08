import "bootstrap";
import $ from "jquery";

  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(elems, {
      direction: 'right'
    });
  });

  document.addEventListener('DOMContentLoaded', function() {
     var elems = document.querySelectorAll('.materialboxed');
     var instances = M.Materialbox.init(elems, {
      outDuration: '200'
     });
   });

// Filter
  var checkBoxes = document.querySelectorAll(".form-check-input");
  var form = document.querySelector('form');

  for (const check of checkBoxes) {
  check.addEventListener( 'change', function() {
    Rails.fire(form, 'submit');
  });
  }
