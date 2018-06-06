$(document).ready(function(){
  var $slider = $('.post-slider');
  $slider.slick({
    arrows: false,
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    centerMode: true,
    variableWidth: true,
    autoplay: true,
    initialSlide: 2,
  });
});
