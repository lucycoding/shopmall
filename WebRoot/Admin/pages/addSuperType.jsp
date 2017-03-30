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
    
    <title>类别管理</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="../inc/cssall.jsp" %>
	<script type="text/javascript">
	    var superTypeName_IsValid;
		function checkSuperTypeName() {
			var superTypeName = document.getElementById("superTypeName");
			var superTypeNameDiv = document.getElementById("superTypeNameDiv");
			if(superTypeName.value == "") {
				superTypeNameDiv.innerHTML = "类名不能为空";
				superTypeName_IsValid=false;
			} else {
				checkSuperTypeNameIsExist();
			}
		}
		var req;
		function checkSuperTypeNameIsExist() {
			var superTypeName = document.getElementById("superTypeName");
			var url = "checkSuperTypeIsExist?superTypeName="+superTypeName.value;
			sendSuperTypeName(url);
		}
		function sendSuperTypeName(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = superTypeNameIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		var superTypeName_IsExist;
		function superTypeNameIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var superTypeNameDiv = document.getElementById("superTypeNameDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						superTypeName_IsExist = true;
					} else {
						superTypeName_IsExist = false;
						superTypeName_IsValid=true;
					}
					superTypeNameDiv.innerHTML = content;
				}
			}
		}
		function addSuperType() {
			var oForm = document.getElementsByTagName("form")[0];
			var superTypeName = document.getElementById("superTypeName");
			if(superTypeName.value == ""){
				bootbox.alert("类名不能为空！");
				return;
			}
			if(superTypeName_IsValid) {
				bootbox.confirm("确定添加该类别?", function(flag) {
				if( flag ) {
					oForm.action = "addSuperTypeServlet?sueprTypeName="+superTypeName.value;
					oForm.submit();
				}
				});
			}
		}
		function update(id){
			var typeName=document.getElementById(id).value;
			location.href="updateSuperType?id="+id+"&name="+typeName;
		}
		function deleteType() {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var types = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					types.push(deletes[i].value);
				}
			}
			if(count == 0) {
				bootbox.alert("还没有选中删除项");
				return false;
			}
			bootbox.confirm("确定删除选中的类别（请先删除该类别下的所有商品）?", function(flag) {
			if( flag ) {
				var oform = document.getElementsByTagName("form")[1];
				oform.action = "deleteSuperType?typeIds="+types;
				oform.submit();
			}
			});
		}
	</script>
  </head>
  
 <body>
				<div>
					<ul class="breadcrumb">
						<li><a>商品管理</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-plus-sign"></i>&nbsp;<a href="allowAddSuperServlet">添加类别</a></h2>
												
					</div>
					<br/>
		<form action="addSuperTypeServlet" method="get">
    	<div class="modal-body" style="margin-left: 30%">	
					<input type="hidden" name="id" id="tr-user-id"/>
					<fieldset>
						<div class="control-group">
							类别名称:&nbsp;<input style="height: 28px" class="input-small focused" type="text" id="superTypeName" name="superTypeName" onblur="checkSuperTypeName()" />
							　<button class="btn btn-primary" type="button" onclick="addSuperType()" onblur="checkSuperTypeName()"><i class="icon-plus-sign icon-white"></i>添加</button>
							<br/>　　　　　<font color="red"><span id="superTypeNameDiv">${message }</span></font>
						</div>
					</fieldset>
		</div>
    	</form>
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
			
			<div class="row-fluid">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-list"></i>&nbsp;<a href="allowAddSuperServlet">所有类别</a></h2>
												
					</div>
					<br/>
					<div style="margin-left: 3px;margin-right: 3px">
					<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<th style="text-align:center;"><input type="checkbox" id="selectAll" onclick="selectAll()">全选</th>
									<th style="text-align:center;">分类ID</th>
									<th style="text-align:center;">分类名</th>
								</tr>
								<form method="post" name="deleteForm">
    							<c:forEach var="superType" items="${ superTypeList}">
								<tr>
									<td style="text-align:center;"><input type="checkbox" name="delete" value="${superType.superTypeId }"></td>
									<td style="text-align:center;">${superType.superTypeId }</td>
									<td style="text-align:center;"><input type="text" style="height: 28px;" class="input-small focused" id="${superType.superTypeId }" value="${superType.typeName }"/>　<a class="btn btn-primary" href="javascript:;" onclick="update(${superType.superTypeId })"><i class="icon-edit icon-white"></i>修改</a></td>
								</tr>
								</c:forEach>
    							</form>
				     </table>
					 <div class="pull-right">
						<a onclick="deleteType()" href="javascript:;" class="btn btn-danger"><i class="icon-remove-sign icon-white"></i>删除</a>　　
						</div> 	<br/><br/><br/>
					 </div>
			    </div>  <!-- row-fluid -->	
			</div>
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
${updateSuperTypeMessage }

<% request.setAttribute("message","");
	session.setAttribute("updateSuperTypeMessage","");
 %>