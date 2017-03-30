<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="tools.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户详情</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<%@ include file="../inc/cssall.jsp" %>
	<link href="../cssall/datetimepicker.css" rel="stylesheet">
	<style type="text/css">
	input[type="checkbox"] { -webkit-appearance: checkbox;}
	</style>
  </head>
  
  <body>
				<div>
					<ul class="breadcrumb">
						<li><a>用户管理</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i>&nbsp;用户设置    ——— 用户<font style="text-decoration: underline;color: red">${user.name }</font>的详细信息</h2>
												
					</div>
					<br/>
					<div style="display: inline-block;padding-left: 5%;">
		    			<p><span><b>用户id：</b>${user.id}</span></p>
		    			<p><span><b>用户名：</b>${user.name}</span></p>
		    			<p><span><b>密码：</b>******</span></p>
		    			<p><span><b>邮箱：</b>${user.email}</span></p>
		    			<p><span><b>真名：</b>${user.trueName}</span></p>
		    			<p><span><b>性别：</b>${user.sex}</span></p>
		    			<p><span><b>生日：</b>${user.birthday}</span></p>
		    			</div>
		    			<div style="display: inline-block;padding-left: 20%;">
		    			<p><span><b>地址：</b>${user.address}</span></p>
		    			<p><span><b>邮编：</b>${user.postcode}</span></p>
		    			<p><span><b>固话：</b>${user.phone}</span></p>
		    			<p><span><b>手机：</b>${user.mphone}</span></p>
		    			<p><span><b>安全问题：</b>${user.question}</span></p>
		    			<p><span><b>答案：</b>${user.answer}</span></p>
		    			<p><span><a class="btn btn-primary" href="getUserPagerServlet"><i class="icon-repeat icon-white"></i>返回</a></span></p>
		    		</div>
						<br/><br/>
					
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
