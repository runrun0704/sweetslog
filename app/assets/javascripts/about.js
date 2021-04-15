$(function(){
    $('.about-fade').hover(function(){
        $(this).find('.about-fadeIn').fadeIn();
    }, (function(){
        $(this).find('.about-fadeIn').fadeOut();
    }))

})