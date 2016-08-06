$( document ).ready(function() {
// LOGIN PAGE


// creates a pulse effect when either input fields are clicked
 $('input#email').on('click',function(){
    $('input#email').addClass('animated pulse');
    if ($('input#email').hasClass('animated pulse')){
      $('input#password').removeClass('animated pulse');
    }
  })

$('input#password').on('click',function(){
  $('input#password').addClass('animated pulse');
  if ($('input#password').hasClass('animated pulse')){
    $('input#email').removeClass('animated pulse');
  }
})

// if form is filled out correctly, the
$('.actions').on('click',function(){
  $('.actions').addClass('animated pulse');
});





  // prevent default if user doesn't input anything into fields
  // $('.actions').on('click', function(){
  // if there's no value in <input>, then prevent default on login
  //   if($("#email").val() == "" || $("#password").val() == ""){
  //     event.preventDefault();
  //   }
  //   $('.session-input').on('click',function(){
  //     $(this).removeClass('animated pulse');
  //   });
  // });


// signup modal
  // var signupVisible = false;
  //
  // $('#signup').on('click', function(event){
  //   event.preventDefault();
  //   signupVisible = true;
  //   $('.modal-signin').css("display", "none");
  //   // modal will display on click
  //   $('.modal-signup').css("display","block");
  // });
  //
  //   // modal will close when 'x' is clicked
  // $('.close').on('click', function(){
  //   $('.modal-signup').css("display","none");
  //   signupVisible = false;
  // });
  //
  // //keyup event
  // $(window).on('keyup', function(){
  //   if (signupVisible == true){
  //     var signupForm = $('#new_user');
  //     var input = signupForm.find(".field>input");
  //     var formValid = true;
  //     for (var i = 0; i < input.length; i++ ){
  //       var current_input = $(input[i]);
  //       if (current_input.val() == ""){
  //         formValid = false;
  //         break;
  //       }
  //     }
  //     if (formValid == true){
  //       $('.actions-signup').prop('disabled', false);
  //     }
  //   }
  // });
  //
  // // checks to make sure if user signs up properly
  // // Success: will redirect user to post#index page
  // // Fail: will display errors messages taken from the user#new page
  //
  // $('#new_user').on('submit', function(event){
  //   event.preventDefault();
  //   var data=$(this).serialize();
  //   $.ajax({
  //     url: "/users",
  //     method:"POST",
  //     data:data,
  //     dataType:"json"
  //   }).done(function(data) { // SUCCESS
  //     if (data.redirect){
  //       window.location.href = data.redirect;
  //     }
  //   }).fail(function(data) { // FAIL
  //     var inputs = $('.session-input');
  //     var errors = JSON.parse(data.responseText).errors;
  //
  //     // error messages will be displayed based on which fields are blank
  //     for (var i = 0; i < errors.length; i++ ){
  //       $('<p>' + errors[i] + '</p>').appendTo($('.error_messages'));
  //     }
  //
  //     // where fields are blank, add class "error", else delete class "error"
  //     for (var i = 0; i<inputs.length; i++){
  //       if ($(inputs[i]).val()==""){
  //         $(inputs[i]).addClass("error");
  //       } else{
  //         $(inputs[i]).removeClass('error');
  //       }
  //     }
  //     // remove the 'error' class on fields that are clicked on
  //     $('.session-input').on('click',function(){
  //        $(this).removeClass('error');
  //      });
  //   });
  // });
});
