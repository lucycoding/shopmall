<%@ page language="java" pageEncoding="GBK"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>网上商城管理系统</title>
    <link rel="shortcut icon" href="favicon.ico">
	
	<%@ include file="../inc/cssall.jsp" %>
	<script type="text/javascript">
	function login(self) {
		var name = document.getElementById("name");
		var password = document.getElementById("password");
		if(name.value != "" && password.value != "") {
			self.href = "adminLoginServlet?name="+name.value+"&"+"password="+password.value;
		}
	}
	function reset() {
		var name = document.getElementById("name");
		var password = document.getElementById("password");
		name.value = "";
		password.value = "";
	}
	</script>
</head>

<body>
		<div class="container-fluid">
		<div class="row-fluid">
		
			<div class="row-fluid">
				<div class="span12 center login-header">
					<h2>网上商城管理系统</h2>
				</div><!--/span-->
			</div><!--/row-->
			<div class="row-fluid">
				<div class="well span5 center login-box">
				<%if(request.getAttribute("message")!=null){%>
					<div class="alert alert-error">
                        ${message}
					</div>
					<%}else{ %>
					<div class="alert alert-success">
					请输入用户名和密码登录
					</div>
					<%} %>
                <br/><br/>
					<form class="form-horizontal" action="adminLoginServlet" method="post" name="form" id="form">
						<fieldset>
							<div class="input-prepend" title="用户名" data-rel="tooltip">
								<span class="add-on"><i class="icon-user"></i></span><input autofocus class="input-large span10" id="name" name="name" type="text" />
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend" title="密码" data-rel="tooltip">
								<span class="add-on"><i class="icon-lock"></i></span><input class="input-large span10" name="password" id="password" type="password" />
							</div>
							<div class="clearfix"></div>
<!-- 
							<div class="input-prepend">
							<label class="remember" for="remember"><input type="checkbox" id="remember" name="rememberMe" value="true"/><spring:message code="admin.login.rememberme"/></label>
							</div>
							<div class="clearfix"></div>
 -->
							<p class="center span5">
							<button type="submit" class="btn btn-primary">登录</button>
							</p>
						</fieldset>
					</form>
				</div><!--/span-->
			</div><!--/row-->
				</div><!--/fluid-row-->
		
	</div><!--/.fluid-container-->

	<script src="Admin/jsall/jquery-1.7.2.min.js"></script>
		<%
			request.setAttribute("message","");
		 %>
</body>
</html>
