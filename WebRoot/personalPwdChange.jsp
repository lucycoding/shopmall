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

  <title>更改密码</title>

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
  
    <div class="container_12 contact_form">      
		<form action="newPassword" method="post">
		<div class="grid_12 adress" style="margin-left: 30%">
				<br/>
				<span style="font-size: 18px;font-weight: bold;">用&nbsp;户&nbsp;名：</span>
				　${user.name}<br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">原&nbsp;密&nbsp;码：</span>
				　<input type="password" name="password" class="contact" /> <br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">新&nbsp;密&nbsp;码：</span>
				　<input input type="password" name="newPassword1" class="contact" /><br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">确认密码：</span>
				&nbsp;<input input type="password" name="newPassword2" class="contact" /> <br/><br/><br/>
       			<div class="submit">					
					<input type="submit" style="width: 80px;float:left;margin-left: 10%"  value="修改" /><input style="width: 80px;height: 35px;float:left;margin-left: 8px" type="reset" value="重置" />
				</div><!-- .submit --> 
        </div><!-- .adress -->
        </form>
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