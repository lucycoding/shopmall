<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@page import="com.mall.po.User" %>
<%@page import="com.mall.vo.Cart" %>
<%@page import="com.mall.vo.CartItem" %>

<%@include file="checkLogin.jsp"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>我的购物车</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">

  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js" ></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>

  <script>
       $(function() {
	  $('#list_product').carouFredSel({
		prev: '#prev_c1',
		next: '#next_c1',
		circular: false,
		auto: false
	  });
	  $(window).resize();
	});
  </script>
  <script>
       $(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });
       })
  </script>
  <script>
       $(document).ready(function() {
	      $("select").selectBox();
       });
  </script>
</head>
<body>
<%@include file="header.jsp" %>

  <section id="main" class="entire_width">
    <div class="container_12">
       <div class="grid_12">
       <h1 class="page_title">购物车</h1>

       <table class="cart_product">
	      <tr>
		     <th class="img"></th>
		     <th class="bg name">商品名称</th>
		     <th class="price">单价</th>
		     <th class="bg qty">数量</th>
		     <th class="subtotal">总价</th>
		     <th class="bg close">删除</th>
	      </tr>
			<% 
					Collection ci=(Collection)request.getSession().getAttribute("ci");
					if(request.getSession().getAttribute("user") == null){
						request.setAttribute("pleseLoggin","<script>alert('请先登录!')</script>");
		   				request.getRequestDispatcher("login.jsp").forward(request, response);	
					}else{
						if(ci==null||ci.size()<=0){
							out.println("<tr><td colspan='6'><font color='red'>购物车中还没有商品，请继续购物！</font></td></tr>");
						}else{
							Iterator<CartItem> it=ci.iterator();
							while(it.hasNext()){
								CartItem cartItem=it.next();
								%>
			<form action="updateGoodsCount?GoodsId=<%=cartItem.getGoods().getGoodsId()%>" method="post" name="cartForm" id="cartForm<%=cartItem.getGoods().getGoodsId()%>">
		      <tr>
			     <td class="img"><a href="showGoodsByIdServlet?GoodsId=<%=cartItem.getGoods().getGoodsId()%>"><img src="<%=serverPath %><%=cartItem.getGoods().getPicture()%>" alt="Product 6"></a></td>
			     <td class="bg name"><%=cartItem.getGoods().getGoodsName() %></td>
			     <td class="price">￥<%=cartItem.getGoods().getNowPrice()%></td>
			     <td class="bg qty"><input type="text" name="count" value="<%=cartItem.getCount()%>" size="4" /><a title="Edit" href="#" onclick="$('#cartForm<%=cartItem.getGoods().getGoodsId()%>').submit();return false">修改</a></td>
			     <td class="subtotal">￥<%=cartItem.getItemPrice() %></td>
			     <td class="bg close"><a title="close" class="close" href="deleteItemServlet?GoodsId=<%=cartItem.getGoods().getGoodsId() %>&flag=cart"></a></td>
		      </tr>
	      </form>
								
								
								<%
							}
						}
					}
			 %>
	      <tr>
		     <td colspan="7" class="cart_but">
			    <button class="continue" onclick="window.location.href='index';"><span>icon</span>继续购物</button>
			    <button class="update" onclick="window.location.reload();"><span>icon</span>刷新购物车</button>
		     </td>
	      </tr>
       </table>
       </div><!-- .grid_12 -->

       <div id="content_bottom">
			<%
					Cart c = (Cart)session.getAttribute("cart");
					if(c != null && c.getItemCount() != 0){
    	 	%>
        <div class="grid_4" style="float: right;">
          <div class="bottom_block total">
	      <table class="subtotal">
		     <tr>
			    <td>总计</td><td class="price">￥<%=c.getTotalPrice()%></td>
		     </tr>
		     <tr class="grand_total">
			    <td>应付金额</td><td class="price">￥<%=c.getTotalPrice()%></td>
		     </tr>
	      </table>
	    <button class="checkout" onclick="window.location.href='submitOrder.jsp'">提交订单</button>
          </div><!-- .total -->
        </div><!-- .grid_4 -->
<%} %>
        <div class="clear"></div>
      </div><!-- #content_bottom -->
      <div class="clear"></div>

      <div class="clear"></div>

      <div class="carousel" id="following">
        <div class="c_header">
          <div class="grid_10">
            <h5>新品上市</h5>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
            <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
           </div><!-- .grid_2 -->
        </div><!-- .c_header -->

        <div class="list_carousel">

        <ul id="list_product" class="list_product">
	        <c:forEach var="flag" items="${newList}" varStatus="status">
          <li class="">
            <div class="grid_3 product">
              <img class="sale" src="img/new.png" alt="Sale"/>
              <div class="prev">
                <a href="showGoodsByIdServlet?GoodsId=${flag.goodsId}"><img src="<%=serverPath %>${flag.picture}" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title">${flag.goodsName}</h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">￥${flag.nowPrice}</div>
                  <div class="price_old">￥${flag.price}</div>
                </div>
                </div>
	                <a href="buyGoodsServlet?GoodsId=${flag.goodsId}&orderType=addCart" class="bay" style="float: right;"></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>
			</c:forEach>
        </ul><!-- #list_product -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

    </div><!-- .container_12 -->
  </section><!-- #main -->

  <div class="clear"></div>

<%@include file="footer.jsp" %>

</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
