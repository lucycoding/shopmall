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
    
    <title>�޸�����</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="../inc/cssall.jsp" %>
	<script type="text/javascript">
		var checkPassword_ = false;
		function checkPassword() {
			var password = document.getElementById("password");
			var passwordDiv = document.getElementById("passwordDiv");
			if(password.value == "") {
				passwordDiv.innerHTML = "���벻��Ϊ��";
				checkPassword_ = false;
			} else {
				passwordDiv.innerHTML = "";
				checkPassword_ = true;
			}
		}
		var checkRpassword_ = false;
		function checkRpassword() {
			var rpassword = document.getElementById("rpassword");
			var password = document.getElementById("password");
			var rpasswordDiv = document.getElementById("rpasswordDiv");
			if(rpassword.value == "") {
				rpasswordDiv.innerHTML = "ȷ�����벻��Ϊ��";
				checkRpassword_ = false;
			} else if(password.value != rpassword.value){
				rpasswordDiv.innerHTML = "����ȷ���д�";
				checkRpassword_ = false;
			} else {
				rpasswordDiv.innerHTML = "";
				checkRpassword_ = true;
			}
		}
		function update() {
			var oForm = document.getElementsByTagName("form")[0];
			var messageDiv = document.getElementById("messageDiv");
			if(checkRpassword_ && checkPassword_) {
				var name = oForm.name.value;
				var password = oForm.password.value;
				var rpassword = oForm.rpassword.value;
				bootbox.confirm("ȷ���޸�����?", function(flag) {
				if( flag ) {
					oForm.action = "adminUpdatePassword?name="+name+"&password="+password+"&rpassword="+rpassword;
					oForm.submit();
				}
				});
			} else {
				messageDiv.innerHTML = "��������ȷ������";
			}
		}
	</script>
	
  </head>
   <body>
				<div>
					<ul class="breadcrumb">
						<li><a>ϵͳ����Ա</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-lock"></i>&nbsp;�޸�����</h2>
												
					</div>
					<br/>
		<form action="" method="post">
    	<div class="modal-body" style="margin-left: 30%">	
					<input type="hidden" name="id" id="tr-user-id"/>
					<fieldset>
						<div class="control-group">
							<label class="control-label" for="tr-currpass">�˺�</label>
							<div class="controls">
							  <input style="height: 25px" class="input-large focused" type="text" id="name" name="name" value="${admin.loginName}" disabled="disabled"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="tr-currpass">��ʵ����</label>
							<div class="controls">
							  <input style="height: 25px" class="input-large focused" type="text" id="turename" name="truename" value="${admin.adminName}" disabled="disabled"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="tr-password">������</label>
							<div class="controls">
							  <input style="height: 25px" class="input-large focused" type="password" id="password" name="password" onblur="checkPassword()"><br/>
							<span id="passwordDiv" style="color: red;"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="tr-repassword">�ظ�������</label>
							<div class="controls">
							  <input style="height: 25px" class="input-large focused" type="password" id="rpassword" name="rpassword" onblur="checkRpassword()"><br/>
							<span id="rpasswordDiv" style="color: red;"></span>
							<span id="messageDiv" style="color: red;font-weight: bold">${message }</span>
							</div>
						</div>
						
						<div class="form-actions" style="background-color: white;border: 0;margin-left: 20%">
							<a href="javascript:;" onclick="update()" class="btn btn-primary"><i class="icon-edit icon-white"></i>�޸�</a>
						</div> <!-- /form-actions -->
					</fieldset>
		</div>
    	</form>
			    </div>  <!-- row-fluid -->				
			</div>
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>