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
    
    <title>普通用户管理</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="../inc/cssall.jsp" %>
	<script type="text/javascript">
		function selectAll() {
			var deletes =document.getElementsByName("delete");
			var selectAll = document.getElementById("selectAll");
			for(var i = 0;i<deletes.length;i++) {
				if(selectAll.checked == true) {
					deletes[i].style.opacity = 0.6;
				 	deletes[i].checked = true;
				}
				else {
					deletes[i].checked = false;
				}
			}
		}
		
		function removeAdmin(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var admins = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					admins.push(deletes[i].value);
				}
			}
			if(count == 0) {
				bootbox.alert("还没有选中删除项");
				return false;
			}
			bootbox.confirm("确定删除选中的管理员账户?", function(flag) {
			if( flag ) {
				var oform = document.getElementsByTagName("form")[0];
				oform.action = "deleteAdmin?adminIds="+admins+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
				oform.submit();
			}
			});
		}
	</script>
  </head>
  
  <body>
				<div>
					<ul class="breadcrumb">
						<li><a>ADMIN管理</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i>&nbsp;<a href="getAdminPagerServlet">所有管理员</a></h2>
												
					</div>
					<br/>
					<div style="margin-left: 3px;margin-right: 3px">
					<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<th style="text-align:center;"><input type="checkbox" id="selectAll" onclick="selectAll()">全选</th>
									<th style="text-align:center;">管理员ID</th>
									<th style="text-align:center;">真实姓名</th>
									<th style="text-align:center;">管理员级别</th>
									<th style="text-align:center;">登录名</th>
									<th style="text-align:center;">更多</th>
								</tr>
								<form method="post" name="deleteForm">
    							<c:forEach var="admin" items="${ adminList}">
								<tr>
									<td style="text-align:center;"><input type="checkbox" name="delete" value="${admin.id }"></td>
									<td style="text-align:center;">${admin.id }</td>
									<td style="text-align:center;">${admin.adminName }</td>
									<td style="text-align:center;">
										<c:if test="${admin.adminType == 1 }">商品</c:if>
										<c:if test="${admin.adminType == 2 }">订单</c:if>
										<c:if test="${admin.adminType == 3 }">用户</c:if>
										<c:if test="${admin.adminType == 4 }">系统</c:if>
									</td>
									<td style="text-align:center;">${admin.loginName }</td>
									<td style="text-align:center;"><a class="btn btn-primary" href="getOneAdminServlet?id=${admin.id}"><i class="icon-edit icon-white"></i>修改</a></td>
								</tr>
								</c:forEach>
    							</form>
				     </table>
				     <div class="pagination pagination-right">
				     <pg:pager items="${adminPager.totalNum }" maxPageItems="${adminPager.pageSize}" export="currentPageNo = pageNumber" url="getAdminPagerServlet">
				     <pg:param name="pageSize" value="${adminPager.pageSize }"/>
			         <pg:param name="pageNo" value="${currentPageNo}"/> 
						<ul contenteditable="false">
							<pg:first>
					            <li><a href="${pageUrl}">首页</a></li>
					        </pg:first>
							<pg:prev>
					            <li><a href="${pageUrl}">上一页</a></li>
					        </pg:prev>
					         <pg:pages>
						         <c:choose>
						            <c:when test="${adminPager.pagecurrentPageNo eq pageNumber}">
						              <li class="active"><a href="#">${pageNumber}</a></li>
						            </c:when>
						            <c:otherwise>
						            <li><a href="${pageUrl}">${pageNumber}</a></li>
						            </c:otherwise>
						         </c:choose>
					         </pg:pages>
					         <pg:next>
					            <li><a href="${pageUrl}">下一页</a></li>
					         </pg:next>
					         <pg:last>
					            <li><a href="${pageUrl}">末页</a></li>
					         </pg:last>
						</ul>
					</pg:pager>
					 </div>
					 <div class="pull-right">
						<a onclick="removeAdmin(${adminPager.pageOffset},${adminPager.pageSize})" href="javascript:;" class="btn btn-danger"><i class="icon-remove-sign icon-white"></i>删除</a>　　
						</div> 	<br/><br/><br/>
					 </div>
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  		
 ${message }

<%
request.setAttribute("message","");
 %>
  </body>
</html>


    	
    	
    	
    	