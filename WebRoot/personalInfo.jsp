<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String name=(String)session.getAttribute("name"); 
	if(name == null || "".equals(name)){
		out.print("<script>alert('会话已过期，请登录!');parent.window.location.href='login.jsp';</script>");
	}
%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>用户信息</title>

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

</head>
<body style="background: none">
  
    <div class="container_12">      

		<div class="grid_12 adress">
			<div class="grid_5" style="float:left;">
				<br/>
				<span style="font-size: 20px;font-weight: bold;">用户名：</span>
				${user.name}<br/><br/>
				<hr>
				
				<br/>
				<span style="font-size: 20px;font-weight: bold;">邮　箱：</span>
				${user.email}<br/><br/>
				<hr>
				
				<br/>
				<span style="font-size: 20px;font-weight: bold;">真　名：</span>
				${user.trueName}<br/><br/>
				<hr>
				
				<br/>
				<span style="font-size: 20px;font-weight: bold;">性　别：</span>
				${user.sex}<br/><br/>
				<hr>
				
				<br/>
				<span style="font-size: 20px;font-weight: bold;">生　日：</span>
				${user.birthday}<br/><br/>
				<hr>
			</div>	
			<div class="grid_5" style="float:left;">
				<br/>
				<span style="font-size: 20px;font-weight: bold;">地　　址：</span>
				${user.address}<br/><br/>
				<hr>
				
				<br/>
				<span style="font-size: 20px;font-weight: bold;">邮　　编：</span>
				${user.postcode}<br/><br/>
				<hr>
				
				<br/>
				<span style="font-size: 20px;font-weight: bold;">固　　话：</span>
				${user.phone}<br/><br/>
				<hr>
				
				<br/>
				<span style="font-size: 20px;font-weight: bold;">手　　机：</span>
				${user.mphone}<br/><br/>
				<hr>
				
				<br/>
				<span style="font-size: 20px;font-weight: bold;">密保问题：</span>
				${user.question}<br/><br/>
				<hr>
			</div>
        </div><!-- .adress -->
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  
  <div class="clear"></div>
 ${message }

<%
request.setAttribute("message","");
 %>
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>