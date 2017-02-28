// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .
//= require Chart.bundle
//= require chartkick
$(window).on('turbolinks:load', function(){
	$(".preloader-wrapper").fadeOut("slow");
	$('#top').delay(1000).fadeIn("slow");
	setTimeout(function(){
		$('ul.tabs').tabs('select_tab', 'tab_id');
		$('.toc-wrapper').pushpin({top: $('.toc-wrapper').offset().top,
								   bottom: $('.toc-wrapper').offset().bottom});
		$('.scrollspy').scrollSpy();
		$('.button-collapse').sideNav();	
	},1001);
 });


//note to self: find another way to load because i can't load pushpin and scrollspy without actually loading the window first