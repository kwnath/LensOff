//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require underscore
//= require gmaps/google
//= require jquery.slick
//= require_tree .

window.setTimeout(function() {
    $(".flash").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
}, 2000);


$('.single-item').slick({
  arrows: false,
  dots: true,
  autoplay: true,
  autoplaySpeed: 5000
});

