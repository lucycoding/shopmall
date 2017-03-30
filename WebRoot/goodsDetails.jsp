<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.mall.po.Goods" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>商品详细介绍</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css/jquery.jqzoom.css" type="text/css">

  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js" ></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>
  <script src="js/jquery.jqzoom-core.js" ></script>

  <script src="custom/goodsDetails.js"></script>
</head>
<body>
<%@include file="header.jsp" %>

  <div class="clear"></div>

  <div class="container_12">
    <div class="grid_12">
       <div class="breadcrumbs">
	      <a href="index">首页</a><span>&#8250;</span><span class="current">商品详情</span>
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
	      <h1 class="page_title">${Goods.goodsName}</h1>

		<div class="product_page">
			<div class="grid_4 img_slid" id="products">
				<div class="preview slides_container">
					<div class="prev_bg">
						<!-- <a href="<%=serverPath %>${Goods.picture }"> -->
							<img src="<%=serverPath %>${Goods.picture }" title="" alt="" width="290px" height="290px"/>
						<!-- </a> -->
					</div>
						<img id="detail${Goods.goodsId}" src="<%=serverPath %>${Goods.picture }"  title="" alt="" style="width: 100px;height: 35px;display:none;"/>
				</div><!-- .prev -->
			</div><!-- .grid_4 -->

			<div class="grid_5">
				<div class="entry_content">
					<p>${Goods.introduce}</p>
					<div class="ava_price">
					<!-- 统计购买数量 -->
					<c:set var="total" value="0"/>
					<c:forEach var="buyrec" items="${records}">
					<c:set var="total" value="${total+buyrec.goodsNum }"/>
					</c:forEach>
						<div class="availability_sku">
							<div class="sku" style="margin-bottom: 5px">
								已售：　<span>${total}</span>&nbsp;件
							</div>
							<div class="sku">
								库存：　<span>${Goods.goodsNum}</span>&nbsp;件
							</div>
						</div><!-- .availability_sku -->
						
						<div class="price">
							<div class="price_new">￥${Goods.nowPrice}</div>
							<div class="price_old">￥${Goods.price}</div>
						</div><!-- .price -->
					</div><!-- .ava_price -->

					<div class="block_cart">

						<div class="cart">
							<a onclick="checkLogin(${Goods.goodsId})" href="javascript:;" class="bay" style="float: left;border-radius: 2px;margin-right: 10px;background: url(../img/bg_cart_nav.png) no-repeat 10px 50% #E6E9ED;color: #59B7C2;font-size: 16px;font-weight: bolder">立刻购买</a>
							<a onclick="MoveBox('#detail${Goods.goodsId}',${Goods.goodsId},'addCart')" href="javascript:;" class="bay" style="float: left">加入购物车</a>
						</div>
						<div class="clear"></div>
					</div><!-- .block_cart -->
					<div class="bdsharebuttonbox" style="float:right;margin-top: 15px"><a href="#" class="bds_more" data-cmd="more"></a><a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a><a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a><a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a><a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a><a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"一站式购物体验，尽在网上商城！","bdMini":"1","bdMiniList":["mshare","qzone","tsina","weixin","renren","tqq","ty","fbook","twi"],"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
				</div><!-- .entry_content -->

			</div><!-- .grid_5 -->

			<div class="clear"></div>

			<div class="grid_9" >
				<div id="wrapper_tab" class="tab1">
					<a href="#" class="tab1 tab_link">详细描述</a>
					<a href="#" class="tab3 tab_link">购买记录</a>

					<div class="clear"></div>

					<div class="tab1 tab_body">
						<h4>${Goods.goodsName}</h4>
						<p>产品介绍：<br>　　<% Goods goods=(Goods)request.getAttribute("Goods");
										out.print(goods.getIntroduce().replace("\n","<br>　　").replace(" ","　")); %></p>
						<br/>
						生产日期：${Goods.produceDate}<br/><br/>
						品牌：　　${Goods.author}<br/><br/>
						产地：　　${Goods.publisher}<br/><br/>
						
					<div class="clear"></div>
					</div><!-- .tab1 .tab_body -->

					<div class="tab3 tab_body">
						<h4>购买记录</h4>
					<div class="clear"></div>
					<table>
							<tr>
								<th class="bg">买家</th>
								<th>购买数量</th>
								<th class="bg">购买时间</th>
							</tr>
							<c:forEach var="buyrec" items="${records}">
                    		<tr>
                    			<td class="bg">${buyrec.name }</td>
                    			<td>${buyrec.goodsNum }</td>
                    			<td class="bg">${buyrec.orderDate }</td>
                    		</tr>
                    		</c:forEach>
						</table>
					</div><!-- .tab3 .tab_body -->
					<div class="clear"></div>
				</div><!-- #wrapper_tab -->
				<div class="clear"></div>
			</div><!-- .grid_9 -->

			<div class="clear"></div>

			<div class="related">
				<div class="c_header">
					<div class="grid_7">
						<h2>掌柜推荐</h2>
					</div><!-- .grid_7 -->

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
							<!-- <img class="sale" src="img/top.png" alt="Sale"/>  -->
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
	                <a href="showGoodsByIdServlet?GoodsId=${flag.goodsId}" class="bay" style="float: right;"></a>
							</div><!-- .cart -->
						</div><!-- .grid_3 -->
					</li>

					</c:forEach>
			        </ul><!-- #list_product -->
				</div><!-- .list_carousel -->
			</div><!-- .carousel -->
		</div><!-- .product_page -->
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
