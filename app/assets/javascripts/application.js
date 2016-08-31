// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
    $( '#vc-container' ).cassette();
});

$(document).ready(function(){

   $('.triangle-show').click(function(){
       $(this).hide()
       $(this).next('.triangle-hide').show()
       $(this).parent().next('.replies').hide(200)
   });

    $('.triangle-hide').click(function(){
        $(this).hide()
        $(this).prev('.triangle-show').show()
        $(this).parent().next('.replies').show(200)
        $(this).parent().next('.replies').css({'overflow':'visible'})
    });
    $(window).scroll(function (event) {
        var scroll = $(window).scrollTop();
        console.log(scroll)
        if(scroll>600){
            $('.scroll_up').fadeIn(300)
        }
        if(scroll<600){
            $('.scroll_up').fadeOut(300)
        }
    });
    $('.scroll_up').click(function(){
        $("html, body").animate({ scrollTop: 0 }, "slow");
    });
});