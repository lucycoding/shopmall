<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <link rel="shortcut icon" href="img/favicon.html">
  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>
      <c:if test="${type == 0}">所有商品</c:if>
      <c:if test="${type == 1}">热卖商品</c:if>
      <c:if test="${type == 2}">最新商品</c:if>
      <c:if test="${type == 3}">特价商品</c:if>
      <c:if test="${type == 4}">推荐商品</c:if>
      <c:if test="${type == 9}">
		      <c:forEach var="cls" items="${clsList}">
		      	<c:if test="${sid == cls.superTypeId }">分类—${cls.typeName}</c:if>
		      </c:forEach>
</c:if>
 </title>

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
	      	<span class="current">
		      <c:if test="${type == 0}">所有商品</c:if>
		      <c:if test="${type == 1}">人气热卖</c:if>
		      <c:if test="${type == 2}">新品上市</c:if>
		      <c:if test="${type == 3}">特价促销</c:if>
		      <c:if test="${type == 4}">掌柜推荐</c:if>
		      <c:if test="${type == 9}">
		      <c:forEach var="cls" items="${clsList}">
		      	<c:if test="${sid == cls.superTypeId }">分类—${cls.typeName}</c:if>
		      </c:forEach></c:if>
		      </span>
       </div><!-- .breadcrumbs -->
    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->
  
  <div class="clear"></div>
  
  <section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_3">
	      <aside id="categories_nav">
		    <h3>商品分类</h3>
		     
		     <nav class="left_menu">
			    <ul>
			    <c:forEach var="cls" items="${clsList}">
	                <li <c:if test="${sid == cls.superTypeId}">style="background-color: #D5E4F1"</c:if>><a href="page?type=9&sid=${cls.superTypeId}">${cls.typeName}</a></li>
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
	      <h1 class="page_title">
		      <c:if test="${type == 0}">所有商品</c:if>
		      <c:if test="${type == 1}">人气热卖</c:if>
		      <c:if test="${type == 2}">新品上市</c:if>
		      <c:if test="${type == 3}">特价促销</c:if>
		      <c:if test="${type == 4}">掌柜推荐</c:if>
		      <c:if test="${type == 9}">
		      <c:forEach var="cls" items="${clsList}">
		      	<c:if test="${sid == cls.superTypeId }">分类—${cls.typeName}</c:if>
		      </c:forEach></c:if>
		      </h1>
	      
	      <div class="options">
		     <div class="grid-list">
			   <a class="grid" href="page?type=${type}&sid=${sid}"><span>img</span></a>
			   <a class="list curent" href="page?type=${type}&sid=${sid}&showType=list"><span>img</span></a>
		     </div><!-- .grid-list -->
		     
		     <div class="show">
			    每页
			    <select onchange="javascript:location.href=this.value;">
				   <option <c:if test="${pageSize == 6}">selected="selected"</c:if> value="page?type=${type}&showType=${showType }&sid=${sid}&orderPrice=${orderPrice }&showNum=6">6</option>
				   <option <c:if test="${pageSize == 7}">selected="selected"</c:if> value="page?type=${type}&showType=${showType }&sid=${sid}&orderPrice=${orderPrice }&showNum=7">7</option>
				   <option <c:if test="${pageSize == 8}">selected="selected"</c:if> value="page?type=${type}&showType=${showType }&sid=${sid}&orderPrice=${orderPrice }&showNum=8">8</option>
				   <option <c:if test="${pageSize == 9}">selected="selected"</c:if> value="page?type=${type}&showType=${showType }&sid=${sid}&orderPrice=${orderPrice }&showNum=9">9</option>
				   <option <c:if test="${pageSize == 10}">selected="selected"</c:if> value="page?type=${type}&showType=${showType }&sid=${sid}&orderPrice=${orderPrice }&showNum=10">10</option>
			     </select>
			    
			    个
		     </div><!-- .show -->
		     
		     <div class="sort">
			    
			    <a class="sort_up" href="page?type=${type}&showType=${showType }&sid=${sid}&showNum=${pageSize}&orderPrice=asc"><span style="font-size: 12px">价格由低到高</span>&#8593;</a>　
			    <a class="sort_up" href="page?type=${type}&showType=${showType }&sid=${sid}&showNum=${pageSize}&orderPrice=desc""><span style="font-size: 12px">价格由高到低</span>&#8595;</a>
		     </div><!-- .sort -->
	      </div><!-- .options -->

	      <div class="pagination" style="border-top: none;">
	           <pg:pager items="${page.totalNum}" url="page?type=${type}" maxPageItems="${pageSize}" maxIndexPages="5">
		     <ul>
		    	<pg:first>
		    		<li><a href="${pageUrl}&showType=${showType }&showNum=${pageSize }&orderPrice=${orderPrice }&sid=${sid}">首页</a></li>
		    	</pg:first>
		    	<pg:pages>
		    		<li><a href="${pageUrl}&showType=${showType }&showNum=${pageSize }&orderPrice=${orderPrice }&sid=${sid}">${pageNumber}</a></li>
		    	</pg:pages>
		    	<pg:last>
		    		<li><a href="${pageUrl}&showType=${showType }&showNum=${pageSize }&orderPrice=${orderPrice }&sid=${sid}">末页</a></li>
		    	</pg:last>
		     </ul>
    	</pg:pager> 
	      </div><!-- .pagination -->
	      
	      <div class="listing_product">
        <c:choose>
    		<c:when test="${empty page.pageList}">
    			<h1><font color="red">暂没有商品</font></h1>
    		</c:when>
    		<c:otherwise>
              <c:forEach var="Goods" items="${page.pageList}">
		     <div class="product_li">
				<div class="grid_3">
		     <c:if test="${type == 2}"><img class="sale" src="img/new.png" alt="New"/></c:if>
		     <c:if test="${type == 4||type == 1}"><img class="sale" src="img/top.png" alt="New"/></c:if>
		     <c:if test="${type == 3}"><img class="sale" src="img/sale.png" alt="New"/></c:if>
					<div class="prev">
						<a href="showGoodsByIdServlet?GoodsId=${Goods.goodsId}"><img src="<%=serverPath %>${Goods.picture}" alt="" title="" /></a>
					</div><!-- .prev -->
				</div><!-- .grid_3 -->
				
				<div class="grid_4">
					<div class="entry_content">
						<a href="showGoodsByIdServlet?GoodsId=${Goods.goodsId}"><h3 class="title">${Goods.goodsName }</h3></a>
						<p>${Goods.introduce }</p>
						<a class="more" href="showGoodsByIdServlet?GoodsId=${Goods.goodsId}">了解更多</a>
					</div><!-- .entry_content -->
				</div><!-- .grid_4 -->
				
				<div class="grid_2">
					<div class="cart">
						<div class="price">
							<div class="price_new">￥${Goods.nowPrice}</div>
							<div class="price_old">￥${Goods.price}</div>
						</div>
						<a href="buyGoodsServlet?GoodsId=${Goods.goodsId}&orderType=addCart" class="bay">加入购物车</a>
					</div><!-- .cart -->
				</div><!-- .grid_2 -->
				
				<div class="clear"></div>
			</div><!-- .article -->
		     
		     
		     </c:forEach>
			</c:otherwise>
		</c:choose> 
		

	    
	      <div class="clear"></div>
	      </div><!-- .listing_product -->
	      
	      <div class="clear"></div>
	      
	      <div class="pagination">
	           <pg:pager items="${page.totalNum}" url="page?type=${type}" maxPageItems="${pageSize}" maxIndexPages="5">
		     <ul>
		    	<pg:first>
		    		<li><a href="${pageUrl}&showType=${showType }&showNum=${pageSize }&orderPrice=${orderPrice }&sid=${sid}">首页</a></li>
		    	</pg:first>
		    	<pg:pages>
		    		<li><a href="${pageUrl}&showType=${showType }&showNum=${pageSize }&orderPrice=${orderPrice }&sid=${sid}">${pageNumber}</a></li>
		    	</pg:pages>
		    	<pg:last>
		    		<li><a href="${pageUrl}&showType=${showType }&showNum=${pageSize }&orderPrice=${orderPrice }&sid=${sid}">末页</a></li>
		    	</pg:last>
		     </ul>
    	</pg:pager> 
	      </div><!-- .pagination -->
       </div><!-- #content -->
       
      <div class="clear"></div>
      
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
<%@include file="footer.jsp" %>
 
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>