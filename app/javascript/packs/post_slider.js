import 'slick-carousel';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';
import $ from 'jquery';

$(function(){
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
