<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="tools.jsp"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上商城后台主页</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="Admin/js/admin.js"></script>
	<%@ include file="../inc/cssall.jsp" %>
	<script type="text/javascript">
	function showTime(){
		
		var timeId = document.getElementById("timeId");
		var x  = new Array("星期日", "星期一", "星期二","星期三","星期四", "星期五","星期六");
		var now = new Date();
		var d = now.getDay();
		var year = now.getFullYear();       //年
        var month = now.getMonth() + 1;     //月
        var day = now.getDate();            //日
       
        var hh = now.getHours();            //时
        var mm = now.getMinutes();          //分
        var ss = now.getSeconds();          //分
		var clock = year + "-";
        if(month < 10)
            clock += "0";
        clock += month + "-";
        if(day < 10)
            clock += "0";
        clock += day + "   ";
        if(hh < 10)
            clock += "0";
        clock += hh + ":";
        if (mm < 10) clock += '0'; 
        clock += mm + ":"; 
        if (ss < 10) clock += '0'; 
        clock += ss; 
		timeId.innerHTML = clock+"   " +x[d];
		window.setTimeout(showTime,1000);
	}
	</script>
  </head>
  
  <body onload="showTime()">
  		<div class="navbar" style="background: #5795BA;">
		<div class="navbar-inner" style="background: #5795BA;">
			<div class="container-fluid">

				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone">${admin.adminName}</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="Admin/pages/updatePassword.jsp" target="contentIframe"><i class="icon-lock"></i>修改密码</a></li>
						<li class="divider"></li>
						
						<li><a href="adminLogout"><i class="icon-retweet"></i>切换用户/退出</a></li>
					</ul>
				</div>
				
				<span id="timeId" class="pull-right" style="margin-top: 6px;margin-right: 5px;"></span>
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><h3 style="color:black;font-size: 20px;font-weight:bolder">网上商城管理系统</h3></li>									
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
    <div class="container-fluid">
		<div class="row-fluid">
		
            <div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">用户管理</li>
						
                                <li><a class="ajax-link" href="getUserPagerServlet" target="contentIframe"><i class="icon-user"></i><span class="hidden-tablet">&nbsp;普通用户</span></a></li>
 						<li class="nav-header hidden-tablet">订单管理</li>
 						
								<li><a class="ajax-link" href="getOrderPagerServlet" target="contentIframe"><i class="icon-zoom-in"></i><span class="hidden-tablet">&nbsp;所有订单</span></a></li>
								<li><a class="ajax-link" href="getOrderNotSendPagerServlet" target="contentIframe"><i class="icon-remove-circle"></i><span class="hidden-tablet">&nbsp;未发货订单</span></a></li>
								<li><a class="ajax-link" href="getOrderSendPagerServlet" target="contentIframe"><i class="icon-ok-circle"></i><span class="hidden-tablet">&nbsp;已发货订单</span></a></li>
								<li><a class="ajax-link" href="getOrderFreezePagerServlet" target="contentIframe"><i class="icon-ban-circle"></i><span class="hidden-tablet">&nbsp;已确认收货订单</span></a></li>
								
						<li class="nav-header hidden-tablet">商品管理</li>
                         
						        <li><a class="ajax-link" href="allowAddSuperServlet" target="contentIframe"><i class="icon-list"></i><span class="hidden-tablet">&nbsp;类别管理</span></a></li>
								<li><a class="ajax-link" href="allowAddGoodsServlet" target="contentIframe"><i class="icon-plus-sign"></i><span class="hidden-tablet">&nbsp;添加商品</span></a></li>
								<li><a class="ajax-link" href="getGoodsPagerServlet" target="contentIframe"><i class="icon-search"></i><span class="hidden-tablet">&nbsp;查看商品</span></a></li>
								
                          <li class="nav-header hidden-tablet">公告管理</li>
                          
                         		<li><a class="ajax-link" href="Admin/pages/addInform.jsp" target="contentIframe"><i class="icon-plus-sign"></i><span class="hidden-tablet">&nbsp;添加公告</span></a></li>
								<li><a class="ajax-link" href="getInformPagerServlet" target="contentIframe"><i class="icon-search"></i><span class="hidden-tablet">&nbsp;查看公告</span></a></li>
			             <li class="nav-header hidden-tablet">论坛管理</li>
			             
                                <li><a class="ajax-link" href="getNotePagerServlet" target="contentIframe"><i class="icon-comment"></i><span class="hidden-tablet">&nbsp;查看用户帖子</span></a></li>

						<li class="nav-header hidden-tablet">admin管理</li>		
								<li><a class="ajax-link" href="allowAddAdminServlet" target="contentIframe"><i class="icon-plus-sign"></i><span class="hidden-tablet">&nbsp;添加管理员</span></a></li>
								<li><a class="ajax-link" href="getAdminPagerServlet" target="contentIframe"><i class="icon-align-justify"></i><span class="hidden-tablet">&nbsp;所有管理员</span></a></li>
					</ul>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">浏览器必须支持Javascript</h4>
					<p></p>
				</div>
			</noscript>

			<div id="content" class="span9">
					<iframe name="contentIframe" scrolling="auto" frameborder="0" width="112%" height="150%" src="getUserPagerServlet"></iframe>		
			</div>


		</div>
		<!--/fluid-row-->
	<!-- <?php include ("user-form.php"); ?>-->
		<hr>
        <footer>
			<p class="pull-right">&copy; <a href='' target="_blank"></a>2015 网上商城团队 版权所有</p>
		</footer>	
	</div>
	<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
