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
				bootbox.alert("标题不能为空");
				return (false);
			} 
			else if(content.value == ""){
				bootbox.alert("内容不能为空");
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
						<li><a>公告管理</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-plus-sign"></i>&nbsp;添加公告</h2>
												
					</div>
					<br/>
		<form action="addInformServlet" method="get" onsubmit="return checktitle(this);">
    	<div class="modal-body" style="margin-left: 30%">	
					<input type="hidden" name="id" id="tr-user-id"/>
					<fieldset>
						<div class="control-group">
						标题:&nbsp;<input style="height: 25px" class="input-large focused" type="text" name="informTitle" id="title"/>
						</div>
						<div class="control-group">
						内容:&nbsp;<textarea rows="10" cols="50" name="informContent" id="content"></textarea><br/>
						　　　<span id="messageDiv" style="color: red;font-weight: bold">　　　${message }</span>
						</div>
						<div class="form-actions" style="background-color: white;border: 0;margin-left: 28%">
							<button class="btn btn-primary" type="submit"><i class="icon-plus-sign icon-white"></i>添加</button>　
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
