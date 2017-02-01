// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .


//= scroll the page
var scroll = function(){

 
 $('nav a').on('click', function(event) {
 
 var target = $( $(this).attr('href') );
 
 if( target.length ) {
 event.preventDefault();
 $('html, body').animate({
 scrollTop: target.offset().top
 }, 600);
 }
 
 });
 
}


//= gallery

$(document).ready(scroll);

$(function(){

	// Initialize the gallery
	$('#thumbs a').touchTouch();

});


//= searching by tags



var search = function(){
 
  $('.tag-search-form').submit(function(e){
    var new_action_url = $(this).attr('action') + "/" + $('#tag', this).val();
    $(this).attr('action', new_action_url);
    $(this).empty();
  });
  
}

//= google maps

var mapa = function myMap() {
var mapProp= {
    center:new google.maps.LatLng(50.0469018,19.8647902),
    zoom:10,
};
var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
}

