// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("trix")
require("@rails/actiontext")
require("@rails/ujs").start()
//require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery");
require("bootstrap");
require("packs/easing")
require("packs/grayscale")
require('select2')

import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

import 'css/application'
import 'css/pages'
import 'css/footer'
import 'slick-carousel'
import 'css/actiontext.scss'

import select2 from 'select2';
import 'select2/dist/css/select2.css';

$(document).ready(function() {
    $('select').select2();
    let selectedTab = window.location.hash;
    $('.nav-link[href="' + selectedTab + '"]' ).trigger('click');

    $('.customer-logos').slick({
        slidesToShow: 6,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 1500,
        arrows: false,
        dots: false,
        pauseOnHover: false,
        responsive: [{
            breakpoint: 768,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 520,
            settings: {
                slidesToShow: 3
            }
        }]
    });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//
//

$(document).on('turbolinks:load', function() {
});
