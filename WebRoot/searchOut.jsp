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

  <title>搜索结果</title>

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
	$(document).ready(function() {
		$("select").selectBox();
	});
  </script>
   <script>
       $(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })
  </script>
    
</head>
<body>
<%@include file="header.jsp" %>
  
  <div class="clear"></div>
  
  <div class="container_12">
    <div class="grid_12">
       <div class="breadcrumbs">
	      <a href="index">首页</a><span>&#8250;</span>
	      	<span class="current">搜索结果
		      </span>
       </div><!-- .breadcrumbs -->
    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->
  
  <div class="clear"></div>
  
  <section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_3">
	      <aside id="categories_nav">
		    <h3>商品类库</h3>
		     
		     <nav class="left_menu">
			    <ul>
			    <c:forEach var="cls" items="${clsList}">
	                <li><a href="page?type=9&sid=${cls.superTypeId}">${cls.typeName}</a></li>
	              </c:forEach>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside><!-- #categories_nav -->
	      
	      <aside id="specials" class="specials">
		     <h3>特价促销</h3>
		     
		     <ul>
	        <c:forEach var="flag" items="${saleList}" varStatus="status2">
			    <li>
				   <div class="prev">
					  <a href="showGoodsByIdServlet?GoodsId=${flag.goodsId}"><img src="<%=serverPath %>${flag.picture}" alt="" title="" /></a>
				   </div>
				   
				   <div class="cont">
					  <a href="showGoodsByIdServlet?GoodsId=${flag.goodsId}">${flag.goodsName}</a>
					  <div class="prise"><span class="old">￥${flag.price}</span>￥${flag.nowPrice}</div>
				   </div>   
			    </li>
			    </c:forEach>
		     </ul>
	      </aside><!-- #specials -->
       </div><!-- .sidebar -->
      
       <div id="content" class="grid_9">
	      <h1 class="page_title">搜索结果
		      </h1>
	      
	      
	      <div class="grid_product">
        <c:choose>
    		<c:when test="${empty page.pageList}">
    			<h1><font color="red">${NoRelativeGoodsException}</font></h1>
    		</c:when>
    		<c:otherwise>
              <c:forEach var="Goods" items="${page.pageList}">
		     <div class="grid_3 product">
		     	
			    <div class="prev">
				   <a href="showGoodsByIdServlet?GoodsId=${Goods.goodsId}"><img src="<%=serverPath %>${Goods.picture}" alt="" title="" /></a>
			    </div><!-- .prev -->
			    <h3 class="title">${Goods.goodsName }</h3>
			    <div class="cart">
				   <div class="price">
					  <div class="vert">
						 <div class="price_new">￥${Goods.nowPrice }</div>
						 <div class="price_old">￥${Goods.price }</div>
					  </div>
				   </div>
				  <a href="buyGoodsServlet?GoodsId=${Goods.goodsId}&orderType=addCart" class="bay" style="float:right;"></a>
			    </div><!-- .cart -->
		     </div><!-- .grid_3 -->
		     </c:forEach>
			</c:otherwise>
		</c:choose> 
	    
	      <div class="clear"></div>
	      </div><!-- .grid_product -->
	      
	      <div class="clear"></div>
	      

       </div><!-- #content -->
       
      <div class="clear"></div>
      
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
<%@include file="footer.jsp" %>
 
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>