$( document ).ready(function() {
// LOGIN PAGE
// creates a pulse effect when either input fields are clicked
//  $('input#email').on('click',function(){
//     $('input#email').addClass('animated pulse');
//     if ($('input#email').hasClass('animated pulse')){
//       $('input#password').removeClass('animated pulse');
//     }
//   })
//
// $('input#password').on('click',function(){
//   $('input#password').addClass('animated pulse');
//   if ($('input#password').hasClass('animated pulse')){
//     $('input#email').removeClass('animated pulse');
//   }
// })

  // if form is filled out correctly, the
  $('.actions').on('click',function(){
    $('.actions').addClass('animated pulse');
  });

});
