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

  <title>用户登录</title>

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
			<h1 class="page_title">登录 或 注册一个账号</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_6 new_customers">
			<h2>注册账号</h2>
			<p>通过创建网上商城的帐号，您可以享受更快的购物流程，保存送货地址，在您的个人中心查看和跟踪您的订单。</p>
			<div class="clear"></div>
			<button class="account" onclick="window.location='register.jsp'">注册</button>
                </div><!-- .grid_6 -->
		
		<div class="grid_6">
			<form class="registed" name="login" action="login" method="post">
				<h2>用户登录</h2>
							
				<p>如果您已有网上商城账号，请登录！</p>
							
				<div class="email">
					<strong>账号:</strong><sup class="surely">*</sup><br/>
					<input type="text" name="name" />
				</div><!-- .email -->
							
				<div class="password">
					<strong>密码:</strong><sup class="surely">*</sup><br/>
					<input type="password" name="password" />
					<a class="forgot" href="PwdIndex.jsp">忘记密码？</a>
				</div><!-- .password -->
				
				<div class="remember">
					<input class="niceCheck" type="checkbox" name="cookie" />
					<span class="rem">记住密码</span>
				</div><!-- .remember -->
				
				<div class="submit">										
					<input type="submit" value="登录" />
				</div><!-- .submit -->
			</form><!-- .registed -->
                </div><!-- .grid_6 -->
       </div><!-- #content -->
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
<%@include file="footer.jsp" %>
 ${pleseLoggin }
 ${loginMessage}
 <%
request.setAttribute("loginMessage","");
request.setAttribute("pleseLoggin","");
 %>
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>