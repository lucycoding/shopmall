$(document).ready(function() {
		$('.jqzoom').jqzoom({
			zoomType: 'standard',
			lens:true,
			preloadimg: true,
			alwaysOn:false
		});
	});

$(document).ready(function() {
		$("select").selectBox();
	});

$(document).ready(function() {
		$('#wrapper_tab a').click(function() {
			if ($(this).attr('class') != $('#wrapper_tab').attr('class') ) {
				$('#wrapper_tab').attr('class',$(this).attr('class'));
			}
			return false;
		});
	});

$(function() {
	  $('#list_product').carouFredSel({
		prev: '#prev_c1',
		next: '#next_c1',
		auto: false
	  });
	  $(window).resize();
	});

$(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });
       })



function checkLogin(goodsId) {
	var userName='<%=request.getSession().getAttribute("name") %>';
	if(userName=='null'||userName==""){
		alert("ÇëÏÈµÇÂ¼£¡");
		return;
	}
	window.location.href='buyGoodsServlet?GoodsId='+goodsId;
	
}