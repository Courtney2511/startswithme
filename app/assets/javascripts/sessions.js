
$( document ).ready(function() {
// LOGIN PAGE
  $('#signin').on('click', function(event){
    event.preventDefault();
    console.log("hello");
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
  // $('.actions').on('click', function(){
  //   // if there's no value in <input>, then prevent default on login
  //   if($("#email").val() == "" || $("#password").val() == ""){
  //     event.preventDefault();
  //     $('.session-input').addClass("error");
  //   }
  //   $('.session-input').on('click',function(){
  //     $(this).removeClass('error');
  //   });
  // });

  //signup modal
  $('#signup').on('click', function(event){
    event.preventDefault();
    $('.modal-signin').css("display", "none");
    // modal will display on click
    $('.modal-signup').css("display","block");
  });

    // modal will close when 'x' is clicked
  $('.close').on('click', function(){
    $('.modal-signup').css("display","none");
  });

  $('#new_user').on('submit', function(event){
    event.preventDefault();
    var data=$(this).serialize();


    console.log($(this).serialize());
    $.ajax({
      url: "/users",
      method:"POST",
      data:data,
      dataType:"json"
    }).done(function(data) {
      if (data.redirect){
        window.location.href = data.redirect;
      }
    }).fail(function(data) {
      var inputs = $('.session-input');
      var errors = JSON.parse(data.responseText).errors;
      for (var i = 0; i < errors.length; i++ ){
        $('<p>' + errors[i] + '</p>').appendTo($('.error_messages'));
      }
      for (var i = 0; i<inputs.length; i++){
        if ($(inputs[i]).val()==""){
          $(inputs[i]).addClass("error");
        } else{
          $(inputs[i]).removeClass('error');
        }
      }
      $('.session-input').on('click',function(){
         $(this).removeClass('error');
       });
       $('.actions-signup').removeAttr('disabled');
    });
  });

});
