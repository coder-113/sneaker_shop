/*global jQuery */
(function ($) {
	"use strict";

	var $window = $(window);
	$window.on('scroll', function () {
        // Sticky menu 
		var scroll = $window.scrollTop();
		if (scroll < 300) {
			$(".sticky").removeClass("is-sticky");
		} else {
			$(".sticky").addClass("is-sticky");
		}
        
        // Scroll To Top
		if ($(this).scrollTop() > 600) {
			$('.scroll-top').removeClass('not-visible');
		} else {
			$('.scroll-top').addClass('not-visible');
		}
	});

    // Preloader
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloader").delay(200).fadeOut("slow");
    });

	// tooltip active js
	$('[data-toggle="tooltip"]').tooltip();

	//  Category Menu
	/*-- Variables --*/
	var categoryToggleWrap = $('.category-toggle-wrap');
	var categoryToggle = $('.category-toggle');
	var categoryMenu = $('.category-menu');

	var typeToggle = $('.type-toggle');
	var typeMenu = $('.type-menu');

	typeToggle.on('click', function () {
		typeMenu.slideToggle();
	});

	// featured category carousel active js
	$('.featured-carousel-active').slick({
		autoplay: false,
		infinite: true,
		fade: false,
		dots: false,
		arrows: true,
		prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
		nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
		slidesToShow: 4,
		responsive: [
			{
				breakpoint: 1200,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 768,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 480,
				settings: {
					slidesToShow: 1,
					arrows: false,
				}
			},
		]
	});


	// nice select active js
	$('select').niceSelect();

	// pricing filter
	var rangeSlider = $(".price-range"),
		// amount = $("#amount"),
		minamount = $("#minamount"),
		maxamount = $("#maxamount"),
		minPrice = rangeSlider.data('min'),
		maxPrice = rangeSlider.data('max'),
		minValue = rangeSlider.data('min-value') !== '' ? rangeSlider.data('min-value') : minPrice,
		maxValue = rangeSlider.data('max-value') !== '' ? rangeSlider.data('max-value') : maxPrice;

		rangeSlider.slider({
		range: true,
		min: minPrice,
		max: maxPrice,
		values: [minValue, maxValue],
		slide: function (event, ui) {
			minamount.val('$' + ui.values[0]);
			maxamount.val('$' + ui.values[1]);
		}
	});
	minamount.val('$' + rangeSlider.slider("values", 0));
    maxamount.val('$' + rangeSlider.slider("values", 1));

	// scroll to top
	$('body').on('click', '.scroll-top', function (e) {
        e.preventDefault();
		$('html,body').animate({
			scrollTop: 0
		}, 1000);
	});

	//fiter
	$(".filter-btn, .filter-input").on("click", function() {
		var priceMin = $("#minamount").val().replace('$', '');
		var priceMax = $("#maxamount").val().replace('$', '');
		var size = $("input[name='size']:checked").val();
		var color = $("input[name='color']:checked").val();
		
		var baseUrl = window.location.href.split('?')[0];
		var params = [];
		
		if (priceMin && priceMax) {
			params.push('price_min=' + priceMin);
			params.push('price_max=' + priceMax);
		}
		
		if (size) {
			params.push('size=' + size);
		}
		
		if (color) {
			params.push('color=' + color);
		}
		
		var newUrl = baseUrl + (params.length > 0 ? '?' + params.join('&') : '');
		
		window.history.pushState({ path: newUrl }, '', newUrl);
		window.location.reload();
	});

	//
	$('.product-thumbs-track .pt').on('click', function(){
		$('.product-thumbs-track .pt').removeClass('active');
		$(this).addClass('active');
		var imgurl = $(this).data('imgbigurl');
		var bigImg = $('.product-big-img').attr('src');
		if(imgurl != bigImg) {
			$('.product-big-img').attr({src: imgurl});
			$('.zoomImg').attr({src: imgurl});
		}
	});	

	/*-----------------------
       Product Single Slider
    -------------------------*/
    $(".ps-slider").owlCarousel({
        loop: false,
        margin: 10,
        nav: true,
        items: 3,
        dots: false,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
    });

	/*-------------------
		Radio Btn
	--------------------- */
    $(".fw-size-choose .sc-item label, .pd-size-choose .sc-item label").on('click', function () {
        $(".fw-size-choose .sc-item label, .pd-size-choose .sc-item label").removeClass('active');
        $(this).addClass('active');
    });

	window.addEventListener('DOMContentLoaded', (event) => {
        const sizeRadios = document.querySelectorAll('.pd-size-choose input[type="radio"]');
        sizeRadios.forEach((radio, index) => {
            radio.addEventListener('change', () => {
                sizeRadios.forEach((otherRadio) => {
                    const label = document.querySelector(`label[for="${otherRadio.id}"]`);
                    if (otherRadio.checked) {
                        label.classList.add('active');
                    } else {
                        label.classList.remove('active');
                    }
                });
            });

            if (index === 0 && radio.checked) {
                const label = document.querySelector(`label[for="${radio.id}"]`);
                label.classList.add('active');
            }
        });
    });

    window.addEventListener('DOMContentLoaded', (event) => {
        const colorRadios = document.querySelectorAll('.pd-color input[type="radio"]');
        colorRadios.forEach((radio, index) => {
            radio.addEventListener('change', () => {
                colorRadios.forEach((otherRadio) => {
                    const label = document.querySelector(`label[for="${otherRadio.id}"]`);
                    if (otherRadio.checked) {
                        label.classList.add('active');
                    } else {
                        label.classList.remove('active');
                    }
                });
            });

            if (index === 0 && radio.checked) {
                const label = document.querySelector(`label[for="${radio.id}"]`);
                label.classList.add('active');
            }
        });
    });

}(jQuery));