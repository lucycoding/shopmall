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

  <title>填写订单信息</title>

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

  <script src="custom/submitOrder.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">填写订单信息</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_12">
        	<form class="registed" name="submitOrder_form" method="post" action="addOrderServlet">   

				<div>			
					<div class="email">
						<strong>用户名:　</strong>
						<input type="text" value="${user.name }" disabled="disabled"/>
					</div><!-- .email -->
								
					<div class="email">
						<strong>收货人:　</strong>
						<input type="text" id="recvName" name="recvName" class="contact_input" onblur="checkRN()" value="${user.trueName}"/>
						<span id="remindRN">　　　　　　　</span>
						<strong style="margin-left: 5px">邮编:　　</strong>
						<input type="text" id="postcode" name="postcode" class="contact_input" onblur="isPostalCode()" value="${user.postcode}"/>
						<span id="remindPostCode"></span>
					</div><!-- .password -->
					
					<div class="email">
						<strong>收货地址:</strong>
						<input type="text" id="address" name="address" class="contact_input" onblur="checkAddr()" value="${user.address}"/>
						<span id="remindAddr">　　　　　　　</span>
						<strong style="margin-left: 5px">手机:　　</strong>
						<input type="text" id="mphone" name="mphone" class="contact_input" onblur="checkMPhone()" value="${user.mphone}" />
						<span id="checkMphone"></span>
					</div><!-- .email -->
				</div>
		       <table class="cart_product">
			      <tr>
				     <th class="img">商品编码</th>
				     <th class="bg name" style="text-align: center;">商品名称</th>
				     <th class="price">单价</th>
				     <th class="bg qty">数量</th>
				     <th class="subtotal">总价</th>
			      </tr>
			      <%
					Collection ci = (Collection)request.getSession().getAttribute("ci");
						Iterator<CartItem> it= ci.iterator();
						while(it.hasNext()){
							CartItem cartItem = it.next();
							%>
								<tr style="font-weight: bold">
									<td><%=cartItem.getGoods().getISBN()%></td>
									<td><%=cartItem.getGoods().getGoodsName() %></td>
									<td>￥<%=cartItem.getGoods().getNowPrice()%></td>
									<td><%=cartItem.getCount()%></td>
									<td>￥<%=cartItem.getItemPrice() %></td>
								</tr>
							<%
						}
					Cart c = (Cart)session.getAttribute("cart");
					if(c != null && c.getItemCount() !=0){
				 %> 
				 <tr style="font-weight: bold">
				 <td colspan="3"></td>
                <td><span style="color: red">合计金额:</span></td>
    	 	   			  <td>￥<%=c.getTotalPrice()%></td>             
                </tr>
    	 	   		<%
    	 	  	   }else{
					%> 
				<tr style="font-weight: bold">
				<td colspan="7">
				<font color="red">购物车无商品，无法下单！请返回继续购物！</font>
			     </td>
			     </tr>
				<%} %>
                <tr>
			     <td colspan="7">
			     </td>
		      </tr> 
		      <tr>
		      <td><a href="cart.jsp" ><b>←返回购物车</b></a></td>
			     <td colspan="6" class="cart_but">
			     <% if(c != null && c.getItemCount() !=0){
    	 	   			%>
				    <button class="update" type="button" onclick="checkAll()" ><b>下订单</b></button>
    	 	   			<%
    	 	  	   }
					%> 
			     </td>
		      </tr>  
				 </table>
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