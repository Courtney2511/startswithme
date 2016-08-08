// This script will ensure that when user scrolls past 500px of screen, the banner will resize to become smaller
// $( document ).ready(function() {
//     $(window).scroll(function() {
//         var scroll = $(window).scrollTop();
//         if (scroll >= 500) {
//             $(".new-post-banner").addClass('smaller');
//         } else {
//             $(".new-post-banner").removeClass('smaller');
//         }
//     });
//
// });

// Creating Scroll Animations with Waypoints and Animate.css
//  $(document).ready(function(){
//
// 	$('.element-to-animate').waypoint(function() {
// 		$('.element-to-animate').addClass( 'animated fadeInLeft' );
// 	},
// 	{
// 		offset: '100%'
// 	});
//
// });


$(document).ready(function() {

    /* Every time the window is scrolled ... */
    $(window).scroll( function(){

        /* Check the location of each desired element */
        $('.hideme').each( function(i){

            var bottom_of_object = $(this).position().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();

            /* If the object is completely visible in the window, fade it it */
            if( bottom_of_window > bottom_of_object ){

                $(this).animate({'opacity':'1'},1500);

            }

        });

    });

});
