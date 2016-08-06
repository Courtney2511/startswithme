# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



  function init() {
      window.addEventListener('scroll', function(e){
          var distanceY = window.pageYOffset || document.documentElement.scrollTop,
              shrinkOn = 200,
              banner = document.querySelector("#new-post-banner-section");
          if (distanceY > shrinkOn) {
              classie.add(banner,"smaller");
          } else {
              if (classie.has(banner,"smaller")) {
                  classie.remove(banner,"smaller");
              }
          }
      });
  }
  window.onload = init();
