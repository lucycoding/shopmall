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

  <title>用户订单信息--详情</title>

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
		<table class="cart_product">
	      <tr>
		     <th>订单号</th>
		     <th class="bg">商品名</th>
		     <th>数量</th>
		     <th class="bg">总价</th>
	      </tr>
	      <c:forEach var="sonOr" items="${list}">
		 	<tr>
				<td>${sonOr.orderId}</td>
					<td>${sonOr.goodsName}</td>
					<td>${sonOr.goodsNum}</td>
					<td>${sonOr.price}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3"></td>
			<td><font color="red">合计：</font>${totalPrice}</td>
		</tr>
	     </table>
	     <a href="selectOrder">返回</a>
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