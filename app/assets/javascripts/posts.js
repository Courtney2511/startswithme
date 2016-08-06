
$( document ).ready(function() {
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        if (scroll >= 300) {
            $(".new-post-banner").addClass('smaller');
        } else {
            $(".new-post-banner").removeClass('smaller');
        }
    });
});
