<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@page import="com.mall.po.User" %>
<%@page import="com.mall.vo.Cart" %>
<%@page import="com.mall.vo.CartItem" %>
<%
String serverPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>404</title>
  
  <link rel="shortcut icon" href="favicon.ico">
  <link href="<%=serverPath %>css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="<%=serverPath %>css/grid.css" media="screen" rel="stylesheet" type="text/css">
 
  <script src="<%=serverPath %>js/jquery-1.7.2.min.js" ></script>
  <script src="<%=serverPath %>js/html5.js" ></script>
</head>
<body>


<!-- /Added by HTTrack --></head>
  <div class="container_12">
    <div id="top">
      <div class="grid_2">
        <div class="phone_top">
          联系我们 025-12345678
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
        	欢迎光临　 <a href="<%=serverPath %>login.jsp">登录</a> / <a href="<%=serverPath %>register.jsp">注册</a>
        <%} %>
        </div><!-- .welcome -->
      </div><!-- .grid_3 -->
    </div><!-- #top -->


    <header id="branding">
    <% if(user!=null){ %>
      <div class="grid_3">
      <%}else{ %>
      <div class="grid_8">
      <%} %>
        <hgroup>
          <h1 id="site_logo" ><a href="<%=serverPath %>index" title=""><img src="<%=serverPath %>img/logo.png" alt=""/></a></h1>
          <h2 id="site_description">　　足不出户　疯狂购物</h2>
        </hgroup>
      </div><!-- .grid_3 -->

      <div class="grid_4">
    <form class="search" action="pageSearchServlet" method="post" id="searchForm">
          <input type="text" name="keywords" id="keywords" placeholder="请输入关键字搜索" style="float: left;"/>
          <input type="image" src="<%=serverPath %>img/bg_search.png" name="submit" style="margin:10px 0 0 5px"/>
          &nbsp;|&nbsp;<span><a href="<%=serverPath %>showSuperTypeServlet">高级搜索</a></span>
	</form>
      </div><!-- .grid_3 -->

    <% if(user!=null){ %>
      <div class="grid_5">
        <ul id="cart_nav">
          <li>
            <a class="cart_li" href="<%=serverPath %>cart.jsp" id="collectBox" style="width: 80px">购物车 <span><%
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
                <a href="<%=serverPath %>showGoodsByIdServlet?GoodsId=<%=cartItem.getGoods().getGoodsId()%>" class="prev_cart"><div class="cart_vert"><img src="<%=serverPath+cartItem.getGoods().getPicture()%>" alt="" title="" /></div></a>
                <div class="cont_cart">
                  <h4><%=cartItem.getGoods().getGoodsName() %></h4>
                  <div class="price"><%=cartItem.getCount()%> x ￥<%=cartItem.getGoods().getNowPrice()%></div>
                </div>
                <a title="close" class="close" href="<%=serverPath %>deleteItemServlet?GoodsId=<%=cartItem.getGoods().getGoodsId() %>"></a>
                <div class="clear"></div>
              </li>
              <%}%>
              
		      <li class="no_border">
			<a href="<%=serverPath %>cart.jsp" class="view_cart">查看购物车</a>
			<a href="<%=serverPath %>submitOrder.jsp" class="checkout">提交订单</a>
		      </li>
              <%} %>
            </ul>
          </li>
        </ul>

        <nav class="private">
          <ul>
            <li class="curent"><a href="<%=serverPath %>personalCenter.jsp">个人中心</a></li>
		<li class="separator">|</li>
            <li><a href="<%=serverPath %>pageNoteServlet">用户留言</a></li>
        <li class="separator">|</li>
            <li><a href="<%=serverPath %>userLoginOut">退出登录</a></li>
          </ul>
        </nav><!-- .private -->
      </div><!-- .grid_6 -->
     <%} %>
    </header><!-- #branding -->
  </div><!-- .container_12 -->
  


  <div id="block_nav_primary">
    <div class="container_12">
      <div class="grid_12">
        <nav class="primary">
          <ul>
            <li <c:if test="${empty(type) }">class="curent"</c:if>><a href="<%=serverPath %>index">首页</a></li>
            <li <c:if test="${type == 0 }">class="curent"</c:if> ><a href="<%=serverPath %>page?type=0">所有商品</a></li>
            <li>
              <a href="#">商品分类</a>
              <ul class="sub">
	              <c:forEach var="cls" items="${clsList}">
	                <li><a href="<%=serverPath %>page?type=9&sid=${cls.superTypeId}">${cls.typeName}</a></li>
	              </c:forEach>
              </ul>
            </li>
            <li <c:if test="${type == 2 }">class="curent"</c:if>><a href="<%=serverPath %>page?type=2">新品上市</a></li>
            <li <c:if test="${type == 4 }">class="curent"</c:if>><a href="<%=serverPath %>page?type=4">掌柜推荐</a></li>
            <li <c:if test="${type == 1 }">class="curent"</c:if>><a href="<%=serverPath %>page?type=1">人气热卖</a></li>
            <li <c:if test="${type == 3 }">class="curent"</c:if>><a href="<%=serverPath %>page?type=3">特价促销</a></li>
	    
          </ul>
        </nav><!-- .primary -->
      </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
  </div><!-- .block_nav_primary -->
  
  <div class="clear"></div>
  
  <section id="main" class="entire_width page-404">
    <div class="container_12">      
       <div id="content">
		
		<div class="left_404">
			<h1 class="text_404">404</h1>
			<h6>页面未找到......</h6>
         </div><!-- .adress -->
       </div><!-- #content -->
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
  <footer>
    <div class="f_navigation">
      <div class="container_12">

        <div class="grid_3">
          <h3>服务保障</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="###">正品保障</a></li>
              <li><a href="###">7天无理由退货</a></li>
              <li><a href="###">退货返运费</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>配送服务</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="###">配送进度查询</a></li>
              <li><a href="###">配送范围及运费</a></li>
              <li><a href="###">自提服务</a></li>
              <li><a href="###">准时达</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>支付方式</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="###">网银支付</a></li>
              <li><a href="###">支付宝、银联支付</a></li>
              <li><a href="###">信用卡支付</a></li>
              <li><a href="###">货到付款</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->
        
        <div class="grid_3">
          <h3>联系我们</h3>
          <ul class="f_contact">
            <li>南京市</li>
            <li>025-12345678</li>
            <li>12345678@example.com</li>
          </ul><!-- .f_contact -->
        </div><!-- .grid_3 -->

        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_navigation -->

    <div class="f_info">
      <div class="container_12">
        <div class="grid_6">
          <p class="copyright" style="font-size: 12px">© 2015 网上商城团队 版权所有 　　　 <a target="_blank" href="<%=serverPath %>Admin/login/adminLogin.jsp">后台管理</a></p>
        </div><!-- .grid_6 -->

        <div class="grid_6">
          <div class="bdsharebuttonbox" style="float:right;margin-top: 15px"><a href="#" class="bds_more" data-cmd="more"></a><a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a><a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a><a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a><a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a><a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"一站式购物体验，尽在网上商城！","bdMini":"1","bdMiniList":["mshare","qzone","tsina","weixin","renren","tqq","ty","fbook","twi"],"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
        </div><!-- .grid_6 -->

        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_info -->
  </footer>


 
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>