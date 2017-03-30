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

  <title>网上商城首页</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">

  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>

	<script src="custom/index.js"></script>
</head>
<body>
<%@include file="header.jsp" %>

  <section id="main" class="home">
    <div class="container_12">

      <div class="clear"></div>
      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>掌柜推荐</h2>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
            <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
           </div><!-- .grid_2 -->
        </div><!-- .c_header -->

        <div class="list_carousel">

        <ul id="list_product" class="list_product">
	        <c:forEach var="flag" items="${specialList}" varStatus="status1">
	          <li class="">
	            <div class="grid_3 product">
	              <!-- <img class="sale" src="img/top.png" alt="Sale"/> -->
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
	               
	                <a href="buyGoodsServlet?GoodsId=${flag.goodsId }&orderType=addCart" class="bay" style="float: right;"></a>
	              </div><!-- .cart -->
	            </div><!-- .grid_3 -->
	          </li>
			</c:forEach>
        </ul><!-- #list_product -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>新品上市</h2>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c2" class="next arows" href="#"><span>Next</span></a>
            <a id="prev_c2" class="prev arows" href="#"><span>Prev</span></a>
          </div><!-- .grid_2 -->
        </div><!-- .c_header -->

        <div class="list_carousel">
        <ul id="list_product2" class="list_product">
	        <c:forEach var="flag" items="${newList}" varStatus="status">
	          <li class="">
	            <div class="grid_3 product">
	              <!-- <img class="sale" src="img/new.png" alt="Sale"/> -->
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
        </ul><!-- #list_product2 -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>人气热卖</h2>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c3" class="next arows" href="#"><span>Next</span></a>
            <a id="prev_c3" class="prev arows" href="#"><span>Prev</span></a>
          </div><!-- .grid_2 -->
        </div><!-- .c_header -->

        <div class="list_carousel">
        <ul id="list_product3" class="list_product">
	        <c:forEach var="flag" items="${hostList}" varStatus="status3">
	          <li class="">
	            <div class="grid_3 product">
	              <!-- <img class="sale" src="img/sale.png" alt="Sale"/> -->
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
        </ul><!-- #list_product2 -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>特价促销</h2>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c4" class="next arows" href="#"><span>Next</span></a>
            <a id="prev_c4" class="prev arows" href="#"><span>Prev</span></a>
          </div><!-- .grid_2 -->
        </div><!-- .c_header -->

        <div class="list_carousel">
        <ul id="list_product4" class="list_product">
	        <c:forEach var="flag" items="${saleList}" varStatus="status2">
	          <li class="">
	            <div class="grid_3 product">
	              <!-- <img class="sale" src="img/sale.png" alt="Sale"/>-->
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
        </ul><!-- #list_product2 -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->


      <div class="clear"></div>

    </div><!-- .container_12 -->
  </section><!-- #main -->

  <div class="clear"></div>

<%@include file="footer.jsp" %>
${LoginOutMessage }

<%
request.setAttribute("LoginOutMessage","");
 %>
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
