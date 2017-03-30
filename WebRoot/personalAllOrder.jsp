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

  <title>用户订单信息</title>

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
		     <th class="bg">收货人</th>
		     <th>手机</th>
		     <th class="bg">收货地址</th>
		     <th>邮编</th>
		     <th class="bg">发货状态</th>
		     <th>更多</th>
	      </tr>
	      <c:forEach var="order" items="${list}">
		 	<tr>
				<td>${order.orderId}</td>
		      	<td>${order.recvName}</td>
		        <td>${order.user.email}</td>
		        <td>${order.user.address}</td>
		        <td>${order.user.postcode}</td> 
		        <td><c:if test='${order.flagName == "已发货" }'>${order.flagName}&nbsp;<a style="background-color: #F7F7F7" href="javascript:;" onclick="if(confirm('是否确认收货？此操作无法回退！')){location.href='confirmOrder?orderId=${order.orderId }'}">确认收货</a></c:if>
		        	<c:if test='${order.flagName !="已发货" }'>${order.flagName}</c:if>
		        </td>
		        <td><a href="son?id=${order.orderId}">查看</a></td>
			</tr>
		</c:forEach>
	     </table>
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