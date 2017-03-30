<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>交易成功</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
 
  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js"></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>

  <script>
	$(document).ready(function() {
		$("select").selectBox();
	});
  </script>
  <script>
       $(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })
  </script>
</head>
<body>
<%@include file="header.jsp" %>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">交易成功信息</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_12">
		<pre style="margin-left: 20%;font-size: 15px">
		<font color="red" size="4">交易成功!</font><br/>
		订单号：　　<font color="red">${order.orderId}</font><br/>
		收货人：　　<font color="red">${order.recvName}</font><br/>
		收货地址：　<font color="red">${user.address }</font><br/>
		邮编：　　　<font color="red">${user.postcode }</font><br/>
		邮箱：　　　<font color="red">${user.email}</font><br/>
		固话：　　　<font color="red">${user.phone }</font><br/>
		手机：　　　<font color="red">${user.mphone }</font><br/><br/>
       	 <%
       	 	out.print("　　　6秒后页面将自动跳转到首页！");
       	 	response.setHeader("refresh","6;url='index'");
       	  %>
		</pre>
		</div><!-- .grid_6 -->
       </div><!-- #content -->
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
<%@include file="footer.jsp" %>
 
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>