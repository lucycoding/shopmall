<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>

<%@include file="checkLogin.jsp"%>


<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>用户注册</title>

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

  <script src="custom/personalCenter.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
				<h1 class="page_title" style="border-bottom: 0">&nbsp;&nbsp;个人中心</h1>
				<div class="grid_12">
				<nav class="private" style="float: inherit;">
		          <ul style="list-style-type:none;padding-left:0;">
		            <li id="page1"><a href="personalInfo.jsp" target="personal_Iframe">用户信息</a></li>
				<li class="separator">|</li>
		            <li id="page2"><a href="personalInfoChange.jsp" target="personal_Iframe">修改资料</a></li>
		        <li class="separator">|</li>
		            <li id="page3"><a href="personalPwdChange.jsp" target="personal_Iframe">更改密码</a></li>
		        <li class="separator">|</li>
		            <li id="page4"><a href="selectOrder" target="personal_Iframe">全部订单</a></li>
		          </ul>
		        </nav>
		        </div>
		</div><!-- .grid_12 -->
		
       </div><!-- #content -->
       
		<div class="grid_12" style="border: 1px solid #59B7C2;border-radius: 2px;">
		
			<iframe id="personal_Iframe" name="personal_Iframe" scrolling="yes" width="100%" height="800px" frameborder="0" src="personalInfo.jsp"></iframe>
		
         </div><!-- .grid_6 -->
      <div class="clear"></div>
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
<%@include file="footer.jsp" %>

</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>