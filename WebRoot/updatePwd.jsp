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

  <title>找回密码</title>

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

  <script src="custom/updatePwd.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">找回密码——验证安全问题——重置密码</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_12">
			<form class="registed" action="updataPwd">
				<div style="margin-left: 15%">			
				
				<div class="email">
					<strong>新密码:　</strong>
					<input type="password"  id="password1" name="password" onfocus="clearPwd()" onblur="checkPassword()"/>
					<span id="pwdRemind"><span style="color: red">*</span><span style="color:black">由英文字母和数字(6-16)字符组成</span></span>
				</div><!-- .email -->
				
				<div class="email">
					<strong>确认密码:</strong>
					<input type="password" id="password2" name="password" onblur="checkPwd()"/>
					<span id="checkPwd"></span>
				</div><!-- .email -->
				
				<div class="submit" style="margin-left: 200px">										
					<input type="submit" value="确定" onblur="checkPwd()">
				</div><!-- .submit -->
				</div>
			</form><!-- .registed -->
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