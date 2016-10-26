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
//= require jquery_ujs
//= require jquery-ui
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function(){
		reset();

		$(".btn_login").click(function(){
			reset();
			$("#login").css('display','block');
		});

		$(".btn_signup").click(function(){
			reset();
			$("#signup").css('display','block');
		});


		function reset() {
			$("#signup").css('display','none');
			$("#login").css('display','none');
		}

		//Ajax Login
		$("form#flogin").on("submit", function(event) {
			event.preventDefault();
			console.log($(this).serialize());
			console.log($(this).attr("method"));
			console.log($(this).attr("action"));
			

			$.ajax({
			  type: $(this).attr("method"),
			  url: $(this).attr("action"),
			  data: $(this).serialize(),  
			  dataType: "json",

			  success: function(values) {
			  	if(values["errors"]) {
			  		$("#errors-login").html(values["errors"])
			  	}
			  	else
			  	{
			  		//$("#error").html("")
			  		window.location.replace("/read");
			  	}
			  },
			});
		});

		//Carousel
		$('.flexslider').flexslider({
	    animation: "slide"
	  });

	 


});






