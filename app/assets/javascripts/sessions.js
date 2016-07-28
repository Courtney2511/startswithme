
$( document ).ready(function() {
// LOGIN PAGE
  $('.signin').on('click', function(event){
    event.preventDefault();
    // modal will display on click
    $('.modal-signin')
      .css("display","block");
  });
    // modal will close when 'x' is clicked
  $('.close').on('click', function(){
    $('.modal-signin')
      .css("display","none");
  });
  // prevent default if user doesn't input anything into fields
  $('.actions').on('click', function(){
    // if there's no value in <input>, then prevent default on login
    if($("#email").val() == "" || $("#password").val() == ""){
      event.preventDefault();
      $('.session-input').addClass("error");
    }
    $('.session-input').on('click',function(){
      $(this).removeClass('error');
    });
  });

  // SIGN UP
    // $('.signup').on('click', function(event){
    //   event.preventDefault();
    //   // modal will display on click
    //   $('.modal-signup')
    //     .css("display","block");
    // });
    //   // modal will close when 'x' is clicked
    // $('.close').on('click', function(){
    //   $('.modal-signup')
    //     .css("display","none");
    // });
    //prevent default if user doesn't input anything into fields
    // $('.actions').on('click', function(){
    //   // if there's no value in <input>, then prevent default on login
    //   if($("#user_email").val() == "" || $("#user_password").val() == "") || $("#user_password_confirmation").val() == "") || $("#user_name").val() == ""){
    //     event.preventDefault();
    //     $('.session-input').addClass("error");
    //   }
    //   $('.session-input').on('click',function(){
    //     $(this).removeClass('error');
    //   });
    // });
  });
