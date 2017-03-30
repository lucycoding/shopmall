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
    
    <title>��ͨ�û�����</title>
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
		
		function removeUser(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var users = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					users.push(deletes[i].value);
				}
			}
			if(count == 0) {
				bootbox.alert("��û��ѡ��ɾ����");
				return false;
			}
        	bootbox.confirm("ȷ��Ҫɾ��ѡ�е��û���", function(flag) {
			if( flag ) {
				var oform = document.getElementsByTagName("form")[0];
				oform.action = "deleteUser?userIds="+users+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
				oform.submit();
			}
		});
		}
	</script>
  </head>
  
  <body>
			<div>
					<ul class="breadcrumb">
						<li><a>�û�����</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i>&nbsp;<a href="getUserPagerServlet">��ͨ�û�</a></h2>
												
					</div>
					<br/>
					<div style="margin-left: 3px;margin-right: 3px">
					<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<th style="text-align:center;"><input type="checkbox" id="selectAll" onclick="selectAll()">ȫѡ</th>
									<th style="text-align:center;">�û�ID</th>
									<th style="text-align:center;">�û���</th>
									<th style="text-align:center;">�Ա�</th>
									<th style="text-align:center;">�ֻ�</th>
									<th style="text-align:center;">��ַ</th>
									<th style="text-align:center;">����</th>
								</tr>
								<form method="post" name="deleteForm">
	    						<c:forEach var="user" items="${userList}">
								<tr>
									<td style="text-align:center;"><input type="checkbox" name="delete" value="${user.id }"></td>
									<td style="text-align:center;">${user.id }</td>
									<td style="text-align:center;">${user.name }</td>
									<td style="text-align:center;">${user.sex }</td>
									<td style="text-align:center;">${user.mphone }</td>
									<td style="text-align:center;">${user.address }</td>
									<td style="text-align:center;"><a class="btn btn-info" href="getOneUserServlet?id=${user.id}"><i class="icon-file icon-white"></i>��ϸ</a></td>
								</tr>
								</c:forEach>
    							</form>
				     </table>
				     <div class="pagination pagination-right">
				     <pg:pager items="${userPager.totalNum }" maxPageItems="${userPager.pageSize}" export="currentPageNo = pageNumber" url="getUserPagerServlet">
				     <pg:param name="pageSize" value="${userPager.pageSize }"/>
			         <pg:param name="pageNo" value="${currentPageNo}"/> 
						<ul contenteditable="false">
							<pg:first>
					            <li><a href="${pageUrl}">��ҳ</a></li>
					        </pg:first>
							<pg:prev>
					            <li><a href="${pageUrl}">��һҳ</a></li>
					        </pg:prev>
					         <pg:pages>
						         <c:choose>
						            <c:when test="${userPager.pagecurrentPageNo eq pageNumber}">
						              <li class="active"><a href="#">${pageNumber}</a></li>
						            </c:when>
						            <c:otherwise>
						            <li><a href="${pageUrl}">${pageNumber}</a></li>
						            </c:otherwise>
						         </c:choose>
					         </pg:pages>
					         <pg:next>
					            <li><a href="${pageUrl}">��һҳ</a></li>
					         </pg:next>
					         <pg:last>
					            <li><a href="${pageUrl}">ĩҳ</a></li>
					         </pg:last>
						</ul>
					</pg:pager>
					 </div>
					 <div class="pull-right">
						<a onclick="removeUser(${userPager.pageOffset},${userPager.pageSize})" href="javascript:;" class="btn btn-danger"><i class="icon-remove-sign icon-white"></i>ɾ��</a>����
						</div> 	<br/><br/><br/>
					 </div>
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>

    	
    	
    	
    	