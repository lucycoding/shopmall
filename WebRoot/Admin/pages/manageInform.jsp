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
    
    <title>�������</title>
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
		function removeInform(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var informs = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					informs.push(deletes[i].value);
				}
			}
			if(count == 0) {
				bootbox.alert("��û��ѡ��ɾ����");
				return false;
			}
			bootbox.confirm("ȷ��ɾ��ѡ�еĹ���?", function(flag) {
			if( flag ) {
				var oform = document.getElementsByTagName("form")[0];
				oform.action = "deleteInform?informIds="+informs+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
				oform.submit();
			}
			});
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
						<h2><i class="icon-search"></i>&nbsp;<a href="getInformPagerServlet">�鿴����</a></h2>
												
					</div>
					<br/>
					<div style="margin-left: 3px;margin-right: 3px">
					<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<th style="text-align:center;"><input type="checkbox" id="selectAll" onclick="selectAll()">ȫѡ</th>
									<th style="text-align:center;">����ID</th>
									<th style="text-align:center;">����</th>
									<th style="text-align:center;">ʱ��</th>
									<th style="text-align:center;">����</th>
								</tr>
								<form method="post" name="deleteForm">
	    						<c:forEach var="inform" items="${informList}">
								<tr>
									<td style="text-align:center;"><input type="checkbox" name="delete" value="${inform.informId }"></td>
									<td style="text-align:center;">${inform.informId }</td>
									<td style="text-align:center;">${inform.informTitle }</td>
									<td style="text-align:center;">${inform.informTime }</td>
									<td style="text-align:center;">${inform.informContent }</td>
								</tr>
								</c:forEach>
    							</form>
				     </table>
				     <div class="pagination pagination-right">
				     <pg:pager items="${informPager.totalNum }" maxPageItems="${informPager.pageSize}" export="currentPageNo = pageNumber" url="getInformPagerServlet">
				     <pg:param name="pageSize" value="${informPager.pageSize }"/>
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
						            <c:when test="${informPager.pagecurrentPageNo eq pageNumber}">
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
						<a onclick="removeInform(${informPager.pageOffset},${informPager.pageSize})" href="javascript:;" class="btn btn-danger"><i class="icon-remove-sign icon-white"></i>ɾ��</a>����
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