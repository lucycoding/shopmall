

$(function() {
	  $('#list_product').carouFredSel({
		prev: '#prev_c1',
		next: '#next_c1',
		circular: false,
		auto: false
	  });
      $('#list_product2').carouFredSel({
		prev: '#prev_c2',
		next: '#next_c2',
		circular: false,
		auto: false
	  });
	  $('#list_product3').carouFredSel({
		prev: '#prev_c3',
		next: '#next_c3',
		circular: false,
		auto: false
	  });
	  $('#list_product4').carouFredSel({
		prev: '#prev_c4',
		next: '#next_c4',
		circular: false,
		auto: false
	  });
	  $(window).resize();
});

$(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });
})