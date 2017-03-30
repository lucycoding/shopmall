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
				bootbox.alert("��û��ѡ��ɾ����");
				return false;
			}
			bootbox.confirm("ȷ��ɾ��ѡ�еĹ���Ա�˻�?", function(flag) {
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
						<li><a>ADMIN����</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i>&nbsp;<a href="getAdminPagerServlet">���й���Ա</a></h2>
												
					</div>
					<br/>
					<div style="margin-left: 3px;margin-right: 3px">
					<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<th style="text-align:center;"><input type="checkbox" id="selectAll" onclick="selectAll()">ȫѡ</th>
									<th style="text-align:center;">����ԱID</th>
									<th style="text-align:center;">��ʵ����</th>
									<th style="text-align:center;">����Ա����</th>
									<th style="text-align:center;">��¼��</th>
									<th style="text-align:center;">����</th>
								</tr>
								<form method="post" name="deleteForm">
    							<c:forEach var="admin" items="${ adminList}">
								<tr>
									<td style="text-align:center;"><input type="checkbox" name="delete" value="${admin.id }"></td>
									<td style="text-align:center;">${admin.id }</td>
									<td style="text-align:center;">${admin.adminName }</td>
									<td style="text-align:center;">
										<c:if test="${admin.adminType == 1 }">��Ʒ</c:if>
										<c:if test="${admin.adminType == 2 }">����</c:if>
										<c:if test="${admin.adminType == 3 }">�û�</c:if>
										<c:if test="${admin.adminType == 4 }">ϵͳ</c:if>
									</td>
									<td style="text-align:center;">${admin.loginName }</td>
									<td style="text-align:center;"><a class="btn btn-primary" href="getOneAdminServlet?id=${admin.id}"><i class="icon-edit icon-white"></i>�޸�</a></td>
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
					            <li><a href="${pageUrl}">��ҳ</a></li>
					        </pg:first>
							<pg:prev>
					            <li><a href="${pageUrl}">��һҳ</a></li>
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
					            <li><a href="${pageUrl}">��һҳ</a></li>
					         </pg:next>
					         <pg:last>
					            <li><a href="${pageUrl}">ĩҳ</a></li>
					         </pg:last>
						</ul>
					</pg:pager>
					 </div>
					 <div class="pull-right">
						<a onclick="removeAdmin(${adminPager.pageOffset},${adminPager.pageSize})" href="javascript:;" class="btn btn-danger"><i class="icon-remove-sign icon-white"></i>ɾ��</a>����
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


    	
    	
    	
    	