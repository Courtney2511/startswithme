$(document).ready(function(){
  var navIcon = $('.navicon'),
      ul = $('nav ul');
  navIcon.on('click', function(){
    ul.toggleClass('show');
  });
});
