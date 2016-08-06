
$( document ).ready(function() {
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        if (scroll >= 500) {
            $(".new-post-banner").addClass('smaller');
        } else {
            $(".new-post-banner").removeClass('smaller');
        }
    });
});
