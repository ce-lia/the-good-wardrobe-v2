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
