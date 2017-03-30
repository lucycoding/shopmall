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

  <title>高级搜索</title>

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

  <script src="custom/searchDetail.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">高级搜索</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_12">
			<form class="registed" action="detailSearch" method="post" name="detailSearch" style="border-bottom-color: #ffffff">
				<div style="margin-left: 15%">
				
					<div class="email">
						<strong>所属分类:</strong>
						<select id="superType" name="superType">
							<option value="noChoice">--请选择分类--</option>
							<c:forEach var="flag" items="${superList}">
						  	<option value="${flag.superTypeId}">${flag.typeName}</option>
						  	</c:forEach>
	                    </select>
					</div><!-- .email -->
					
					<div class="email">
						<strong>查询方式:</strong>
						<select name="searchMethod" id="searchMethod" onchange="getSM()">
							<option value="noChoice">--请选择查询方式--</option>
							<option value="GoodsName">按商品名查询</option>
							<option value="author">按品牌查询</option>
							<option value="publisher">按产地查询</option>
							<!-- <option value="ISBN">按编码查询</option> -->
						</select>
					</div><!-- .email -->
					<input id="key" type="text" name="content"/>
				</div>
			</form><!-- .registed -->
				<div class="submit" style="border: 1px solid #E0E0E0;border-top-color: #ffffff">		
					<div style="margin-left: 420px;">						
						<button class="account" onclick="checkDetails()" style="width: 80px">搜索</button><br/>
					</div>
				</div><!-- .submit -->
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