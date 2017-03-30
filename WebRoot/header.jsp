<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mall.po.User" %>
<%@page import="com.mall.vo.Cart" %>
<%@page import="com.mall.vo.CartItem" %>
<%
String serverPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>

<script type="text/javascript">
function MoveBox(obj,goodsId,orderType) {
	var userName='<%=request.getSession().getAttribute("name") %>';
	if(userName=='null'||userName==""){
		alert("请先登录！");
		return;
	}
	$(obj).show();
	var divTop = $(obj).offset().top;
	var divLeft = $(obj).offset().left;
	$(obj).css({ "position": "absolute", "z-index": "500", "left": divLeft + "px", "top": divTop + "px" });
	$(obj).animate({ "left": ($("#collectBox").offset().left - $("#collectBox").width()) + "px", "top": ($(document).scrollTop() + 30) + "px", "width": "100px", "height": "70px" }, 500, function () {
		$(obj).animate({ "left": $("#collectBox").offset().left + "px", "top": $("#collectBox").offset().top + "px" }, 500).fadeTo(0, 0.1).hide(0);
	});
	setTimeout("window.location.href='buyGoodsServlet?GoodsId="+goodsId+"&orderType="+orderType+"'",950);
	
}
</script>
<head><!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" />

<!-- /Added by HTTrack --></head>
  <div class="container_12">
    <div id="top" style="">
      <div class="grid_2">
        <div class="phone_top">
          电话 025-12345678
        </div><!-- .phone_top -->
      </div><!-- .grid_3 -->
      
      <div class="grid_6">
      	<marquee direction="left" scrollamount="4" style="padding-top: 15px;" truespeed="truespeed" onmouseover="this.stop()" onmouseout="this.start()" >
   	 		<c:choose>
   	 			<c:when test="${empty informList }">
   	 				<font color="red">暂时没有公告</font>
   	 			</c:when>
   	 			<c:otherwise>
   	 				<c:forEach var="inform" items="${informList}">
   	 					[${inform.informTime}]&nbsp;<a href="javascript:;" onclick="alert('${inform.informContent}')">${inform.informTitle}</a>　
   	 				</c:forEach>
   	 			</c:otherwise>
   	 		</c:choose>
   	 	</marquee>
      </div>
		<div class="grid_2">
			<div class="welcome">
			<% out.print("当前在线用户："+application.getAttribute("online"));%>
			</div>
		</div>

      <div class="grid_2">

        <div class="welcome">
        <% User user=(User)request.getSession().getAttribute("user");
        	if(user!=null){
        %>
      	  欢迎光临　 <a href="###"><%=user.getName() %></a>
      	  <%}else{ %>
        	欢迎光临　 <a href="login.jsp">登录</a> / <a href="register.jsp">注册</a>
        <%} %>
        </div><!-- .welcome -->
      </div><!-- .grid_3 -->
    </div><!-- #top -->


    <header id="branding">
     <% if(user!=null){ %>
      <div class="grid_3">
      <%}else{ %>
      <div class="grid_5">
      <%} %>
        <hgroup>
          <h1 id="site_logo" ><a href="index" title=""><img src="img/logo.png" alt="Online Store Theme Logo"/></a></h1>
          <h2 id="site_description">　　足不出户　疯狂购物</h2>
        </hgroup>
      </div><!-- .grid_3 -->

      <div class="grid_4">
    <form class="search" action="pageSearchServlet" method="post" id="searchForm">
          <input type="text" name="keywords" id="keywords" placeholder="请输入关键字搜索" style="float: left;"/>
          <input type="image" src="img/bg_search.png" name="submit" style="margin:10px 0 0 5px"/>
          &nbsp;|&nbsp;<span><a href="showSuperTypeServlet">高级搜索</a></span>
	</form>
      </div><!-- .grid_3 -->


     <% if(user!=null){ %>
      <div class="grid_5">
      <%}else{ %>
      <div class="grid_3">
      <%} %>
     <% if(user!=null){ %>
        <ul id="cart_nav">
          <li>
            <a class="cart_li" href="cart.jsp" id="collectBox" style="width: 80px">购物车 <span><%
					Cart c = (Cart)session.getAttribute("cart");
					if(c != null){ out.print(c.getTotalPrice());}else{out.print("0.0");}
    	 	%>
    	 	</span></a>
            <ul class="cart_cont">
              <li class="no_border"><p>最近添加的商品</p></li>
              <%
              		Collection ci = (Collection)request.getSession().getAttribute("ci");
              		if(ci==null || ci.size()<=0){
						out.print("<font color='red'>购物车中还没有商品，请继续购物！</font>");
					}else {
						Iterator<CartItem> it= ci.iterator();
						while(it.hasNext()){
							CartItem cartItem = it.next();
               %>
              <li>
                <a href="showGoodsByIdServlet?GoodsId=<%=cartItem.getGoods().getGoodsId()%>" class="prev_cart"><div class="cart_vert"><img src="<%=serverPath+cartItem.getGoods().getPicture()%>" alt="" title="" /></div></a>
                <div class="cont_cart">
                  <h4><%=cartItem.getGoods().getGoodsName() %></h4>
                  <div class="price"><%=cartItem.getCount()%> x ￥<%=cartItem.getGoods().getNowPrice()%></div>
                </div>
                <a title="close" class="close" href="deleteItemServlet?GoodsId=<%=cartItem.getGoods().getGoodsId() %>"></a>
                <div class="clear"></div>
              </li>
              <%}%>
              
		      <li class="no_border">
			<a href="cart.jsp" class="view_cart">查看购物车</a>
			<a href="submitOrder.jsp" class="checkout">提交订单</a>
		      </li>
              <%} %>
            </ul>
          </li>
        </ul>

     <%} %>
        <nav class="private">
          <ul>
            <li><a href="pageNoteServlet">商城论坛</a></li>
     <% if(user!=null){ %>
        <li class="separator">|</li>
            <li class="curent"><a href="personalCenter.jsp">个人中心</a></li>
		<li class="separator">|</li>
            <li><a href="userLoginOut">退出登录</a></li>
     <%} %>
          </ul>
        </nav><!-- .private -->
      </div><!-- .grid_6 -->
    </header><!-- #branding -->
  </div><!-- .container_12 -->
  


  <div id="block_nav_primary">
    <div class="container_12">
      <div class="grid_12">
        <nav class="primary">
          <ul>
            <li <c:if test="${empty(type) }">class="curent"</c:if>><a href="index">首页</a></li>
            <li <c:if test="${type == 0 }">class="curent"</c:if> ><a href="page?type=0">所有商品</a></li>
            <li>
              <a href="#">商品分类</a>
              <ul class="sub">
	              <c:forEach var="cls" items="${clsList}">
	                <li><a href="page?type=9&sid=${cls.superTypeId}">${cls.typeName}</a></li>
	              </c:forEach>
              </ul>
            </li>
            <li <c:if test="${type == 2 }">class="curent"</c:if>><a href="page?type=2">新品上市</a></li>
            <li <c:if test="${type == 4 }">class="curent"</c:if>><a href="page?type=4">掌柜推荐</a></li>
            <li <c:if test="${type == 1 }">class="curent"</c:if>><a href="page?type=1">人气热卖</a></li>
            <li <c:if test="${type == 3 }">class="curent"</c:if>><a href="page?type=3">特价促销</a></li>
	    
          </ul>
        </nav><!-- .primary -->
      </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
  </div><!-- .block_nav_primary -->