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
    
    <title>My JSP 'addInform.jsp' starting page</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="../inc/cssall.jsp" %>
	<script type="text/javascript">
		function checktitle() {
			var title = document.getElementById("title");
			var content = document.getElementById("content");
			if(title.value == "") {
				bootbox.alert("���ⲻ��Ϊ��");
				return (false);
			} 
			else if(content.value == ""){
				bootbox.alert("���ݲ���Ϊ��");
				return (false);
			}
			else {
				return (true);
			}
		}
	</script>
  </head>
  
  <body>
				<div>
					<ul class="breadcrumb">
						<li><a>�������</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-plus-sign"></i>&nbsp;��ӹ���</h2>
												
					</div>
					<br/>
		<form action="addInformServlet" method="get" onsubmit="return checktitle(this);">
    	<div class="modal-body" style="margin-left: 30%">	
					<input type="hidden" name="id" id="tr-user-id"/>
					<fieldset>
						<div class="control-group">
						����:&nbsp;<input style="height: 25px" class="input-large focused" type="text" name="informTitle" id="title"/>
						</div>
						<div class="control-group">
						����:&nbsp;<textarea rows="10" cols="50" name="informContent" id="content"></textarea><br/>
						������<span id="messageDiv" style="color: red;font-weight: bold">������${message }</span>
						</div>
						<div class="form-actions" style="background-color: white;border: 0;margin-left: 28%">
							<button class="btn btn-primary" type="submit"><i class="icon-plus-sign icon-white"></i>���</button>��
						</div> <!-- /form-actions -->
					</fieldset>
		</div>
    	</form>
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
