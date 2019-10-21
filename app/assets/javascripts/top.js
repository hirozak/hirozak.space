$(document).on('turbolinks:load', function(){
  var $slider = $('.post-slider');
  $slider.slick({
    arrows: false,
    dots: true,
    infinite: true,
    speed: 700,
    slidesToShow: 1,
    centerMode: true,
    variableWidth: true,
    autoplay: true,
    initialSlide: 2,
  });
});
