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
    
    <title>管理员详情</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<%@ include file="../inc/cssall.jsp" %>
   <script type="text/javascript">
	
	function getAdminType() {
			var url = "getAdminType";		
			sendRequest(url);
		}
		var req;
		function sendRequest(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			req.onreadystatechange = showAdminType;
			req.open("get",url,true);
			req.send(null);
		}
		function showAdminType() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var TypeXml = req.responseXML;
					var adminTypes =TypeXml.getElementsByTagName("adminType");
					var adminTypeId = document.getElementsByName("adminTypeId")[0];				
					if(adminTypes.length > 0) {
						for(var i=0;i<adminTypes.length;i++) {
							var TypeId = adminTypes[i].getElementsByTagName("adminTypeId").item(0).firstChild.data;
							var adminTypeName = adminTypes[i].getElementsByTagName("adminTypeName").item(0).firstChild.data;
							var op = document.createElement("option");
							op.setAttribute("value",TypeId);
							var txt = document.createTextNode(adminTypeName);
							op.appendChild(txt);			
							adminTypeId.appendChild(op);
							adminTypeId.style.width = "auto";
						}
						var nowType = document.getElementById("typeId").value;
                        for(var i=0;i<adminTypeId.options.length;i++ ){
                             if(adminTypeId.options[i].value==nowType){
                                  adminTypeId.options.selectedIndex = i;
                                    reuturn;
                             }
                         }
					} else {
						typeDiv.innerHTML = "还未设置管理级别";
					}
				}
			}
		}


		function check(o) {
			var name = document.getElementById("adminName");
			var type = document.getElementById("adminTypeId");
			var lname = document.getElementById("loginName");
			var lpass = document.getElementById("loginPwd");
			if(name.value == "") {
				bootbox.alert("姓名不能为空");
				return (false);
			} 
			else if(type.value == ""){
				bootbox.alert("请先选择管理级别");
				return (false);
			}
			else if(lname.value == ""){
				bootbox.alert("登录名不能为空");
				return (false);
			}
			else if(lpass.value == ""){
				bootbox.alert("登录密码不能为空");
				return (false);
			}
			else {
				return (true);
			}
		}
  </script>
  </head>
  
  <body  onload="getAdminType()">
				<div>
					<ul class="breadcrumb">
						<li><a>ADMIN管理</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i>&nbsp;<a href="getAdminPagerServlet">所有管理员</a>    ——— 管理员 <font style="text-decoration: underline;color: red">${admin.adminName }</font>的详细信息</h2>
												
					</div>
					<br/>
					<form method="post" action="updateAdminServlet" onsubmit="return check(this);"> 
					<fieldset style="margin-left: 30%">
						<div class="control-group">
							管理员ID:　
								<input type="hidden" name="adminId" value="${admin.id}"/>
							  <input style="height: 25px" class="input-large focused" type="text" id="adminId" disabled="disabled" value="${admin.id}"/>
						</div>
						
						<div class="control-group">
							管理员姓名:
							  <input style="height: 25px" class="input-large focused" type="text" id="adminName" name="adminName" value="${admin.adminName}"/>
						</div>
						
						<div class="control-group">
							管理级别:　
							  <select name="adminTypeId"  id="adminTypeId">
								</select>
						</div>
						<input type="hidden" id="typeId" value="${admin.adminType}"/>
						<div class="control-group">
							登录名:　　
							  <input style="height: 25px" class="input-large focused" type="text" id="loginName" name="loginName" value="${admin.loginName}"/>
						</div>
						
						<div class="control-group">
							登录密码:　
							  <input style="height: 25px" class="input-large focused" type="text" id="loginPwd" name="loginPwd" value=""/>
						</div>
						
						<div class="form-actions" style="background-color: white;border: 0;margin-left: 20%">
							<input class="btn btn-primary" type="submit" name="update" value="修改"/>　
							<a href="getAdminPagerServlet" class="btn">返回</a><br/>
						</div> <!-- /form-actions -->
						<font color="red" size="4">${updateMessage }</font>
					</fieldset>
    	</form>
						<br/><br/>
					
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
