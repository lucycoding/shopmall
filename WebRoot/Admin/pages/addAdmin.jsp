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
    
    <title>添加管理员</title>
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
					var adminTypeId = document.getElementById("adminTypeId");				
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
					}else {
						typeDiv.innerHTML = "还未设置管理级别";
					}
				}
			}
		}
		var checkAdminName;
		function checkAdminName() {
			var adminName = document.getElementById("adminName");
			var adminNameDiv = document.getElementById("adminNameDiv");
			if(adminName.value == "") {
				adminNameDiv.innerHTML = "真实姓名不能为空";
				checkAdminName = false;
			} else {
				adminNameDiv.innerHTML = "√";
				checkAdminName = true;
			}
		}
		var loginName_IsExist;
        function checkLoginNameIsExist() {
			var loginName = document.getElementById("loginName");
			var url = "checkLoginNameIsExist?loginName="+loginName.value;
			sendLoginName(url);
		}
        function sendLoginName(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = loginNameIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		function loginNameIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var loginNameDiv = document.getElementById("loginNameDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						loginName_IsExist = true;
					} else {
						loginName_IsExist = false;
					}
					loginNameDiv.innerHTML = content;
				}
			}
		}
		function checkLoginName() {
			var loginName = document.getElementById("loginName");
			var loginNameDiv = document.getElementById("loginNameDiv");
			if(loginName.value == "") {
				loginNameDiv.innerHTML = "登录名不能为空";
			} else {
				checkLoginNameIsExist();
			}
		}
		var checkPwd1;
		function checkPwd1() {
			pwd1 = document.getElementById("loginPwd1");
			var pwd1Div = document.getElementById("pwd1Div");
			if(pwd1.value == "") {
				pwd1Div.innerHTML = "密码不能为空";
				checkPwd1 = false;
			} else {
				pwd1Div.innerHTML = "√";
				checkPwd1 = true;
			}
		}
		var checkPwd2;
		function checkPwd2() {
			var pwd2 = document.getElementById("loginPwd2").value;
			var pwd1 = document.getElementById("loginPwd1").value;
			var pwd2Div = document.getElementById("pwd2Div");
			if(pwd2 == "") {
				pwd2Div.innerHTML = "密码不能为空";
				checkPwd2 = false;
			} else {
			    if(pwd2!=pwd1)
			    {
			      pwd2Div.innerHTML = "两次密码不一致";
				  checkPwd2 = false;
			    }else{
			       pwd2Div.innerHTML = "√";
				   checkPwd2 = true;
			    }
				
			}
		}

	//清除错误提示
	function clearAN(){
	    var adminNameDiv = document.getElementById("adminNameDiv");
		adminNameDiv.innerHTML="*";
	}
	function clearP1D(){
	    var pwd1Div = document.getElementById("pwd1Div");
		pwd1Div.innerHTML="*";
	}
	function clearP2D(){
	    var pwd2Div = document.getElementById("pwd2Div");
		pwd2Div.innerHTML="*";
	}
	//必须所有信息填写正确才能成功提交信息
	function checkAll(){
		var adminTypeId = document.getElementById("adminTypeId").value;	
		var adminName = document.getElementById("adminName").value;
		var loginName = document.getElementById("loginName").value;
		var pwd1 = document.getElementById("loginPwd1").value;
		var pwd2 = document.getElementById("loginPwd2").value;
		if(adminTypeId == ""){
			bootbox.alert("请先选择级别！");
			return;
		}
		if(adminName == ""){
			bootbox.alert("姓名不能为空！");
			return;
		}
		if(loginName == ""){
			bootbox.alert("登录名不能为空！");
			return;
		}
		if(pwd1 == ""){
			bootbox.alert("密码不能为空！");
			return;
		}
		if(pwd2 == ""){
			bootbox.alert("请确认密码！");
			return;
		}
		if(pwd1 != pwd2){
			bootbox.alert("两次密码不一致！");
			return;
		}
		bootbox.confirm("确定要添加此管理员吗？", function(flag) {
			if(flag){
				document.addAdmin_form.submit();
			}
		});
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
						<h2><i class="icon-plus-sign"></i>&nbsp;<a href="allowAddAdminServlet">添加管理员</a></h2>
												
					</div>
					<br/>
					<form name="addAdmin_form" method="post" action="addAdminServlet">  
					<fieldset style="margin-left: 30%">
						<div class="control-group">
							管理级别:　
							  <select id="adminTypeId" name="adminTypeId">
									<c:forEach var="adminType" items="${adminTypes }">
										<option value="${adminType.adminTypeId}">${adminType.typeName}</option>
									</c:forEach>
							</select>
							<font color="red"><span id="TypeDiv">*</span></font>
						</div>
						
						<div class="control-group">
							管理员姓名:
							  <input style="height: 25px" class="input-large focused" type="text" id="adminName" name="adminName" onfocus="clearAN()" onblur="checkAdminName()"/>
							  <font color="red"><span id="adminNameDiv">*</span></font>
						</div>
						
						<div class="control-group">
							登录名:　　
							  <input style="height: 25px" class="input-large focused" type="text" id="loginName" name="loginName" onblur="checkLoginName()"/>
							  <font color="red"><span id="loginNameDiv">*</span></font>
						</div>
						
						<div class="control-group">
							登录密码:　
							  <input style="height: 25px" class="input-large focused" type="text" id="loginPwd1" name="loginPwd1"  onfocus="clearP1D()" onblur="checkPwd1()"/>
							  <font color="red"><span id="pwd1Div">*</span></font>
						</div>
						
						<div class="control-group">
							确认密码:　
							  <input style="height: 25px" class="input-large focused" type="text" id="loginPwd2" name="loginPwd2" onfocus="clearP2D()" onblur="checkPwd2()"/>
							  <font color="red"><span id="pwd2Div">*</span></font>
						</div>
						
						<div class="form-actions" style="background-color: white;border: 0;margin-left: 20%">
							<font color="red">${addMessage}</font>　
							<button class="btn btn-primary" type="button" onclick="checkAll()"><i class="icon-plus-sign icon-white"></i>添加</button><br/>
						</div> <!-- /form-actions -->
					</fieldset>
    	</form>
						<br/><br/>
					
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
