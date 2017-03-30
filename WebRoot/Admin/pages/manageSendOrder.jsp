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
    
    <title>订单管理</title>
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
		
		function removeOrder(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var orders = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					orders.push(deletes[i].value);
				}
			}
			if(count == 0) {
				bootbox.alert("还没有选中删除项");
				return false;
			}
			bootbox.confirm("确定删除选中的订单?", function(flag) {
			if( flag ) {
				var oform = document.getElementsByTagName("form")[0];
				oform.action = "deleteOrder?orderIds="+orders+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
				oform.submit();
			}
			});
		}

		function freezeOrder(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var orders = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					orders.push(deletes[i].value);
				}
			}
			if(count == 0) {
				bootbox.alert("还没有选中订单项");
				return false;
			}
			bootbox.confirm("确认收货选中的订单?", function(flag) {
			if( flag ) {
				var oform = document.getElementsByTagName("form")[0];
				oform.action = "freezeOrderServlet?orderIds="+orders+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
				oform.submit();
			}
			});
		}
	</script>
  </head>
  
  <body> 
				<div>
					<ul class="breadcrumb">
						<li><a>订单管理</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-ok-circle"></i>&nbsp;<a href="getOrderSendPagerServlet">已发货订单</a></h2>
												
					</div>
					<br/>
					<div style="margin-left: 3px;margin-right: 3px">
					<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<th style="text-align:center;"><input type="checkbox" id="selectAll" onclick="selectAll()">全选</th>
									<th style="text-align:center;">订单ID</th>
									<th style="text-align:center;">用户名</th>
									<th style="text-align:center;">收货人</th>
									<th style="text-align:center;">收货地址</th>
									<th style="text-align:center;">邮编</th>
									<th style="text-align:center;">邮箱</th>
									<th style="text-align:center;">时间</th>
									<th style="text-align:center;">状态</th>
									<th style="text-align:center;">更多</th>
								</tr>
    							<form method="post" name="sendForm">
    							<c:forEach var="order" items="${ orderList}">
								<tr>
									<td style="text-align:center;"><input type="checkbox" name="delete" value="${order.orderId }"></td>
									<td style="text-align:center;">${order.orderId }</td>
									<td style="text-align:center;">${order.user.name }</td>
									<td style="text-align:center;">${order.recvName }</td>
									<td style="text-align:center;">${order.user.address }</td>
									<td style="text-align:center;">${order.user.postcode}</td>
									<td style="text-align:center;">${order.user.email}</td>
									<td style="text-align:center;">${order.orderDate }</td>
									<td style="text-align:center;">已发货</td>
									<td style="text-align:center;"><a class="btn btn-info" href="getOneOrderServlet?orderId=${order.orderId}"><i class="icon-file icon-white"></i>详细</a></td>
								</tr>
								</c:forEach>
    							</form>
				     </table>
				     <div class="pagination pagination-right">
				     <pg:pager items="${orderPager.totalNum }" maxPageItems="${orderPager.pageSize}" export="currentPageNo = pageNumber" url="getOrderSendPagerServlet">
				     <pg:param name="pageSize" value="${orderPager.pageSize }"/>
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
						            <c:when test="${orderPager.pagecurrentPageNo eq pageNumber}">
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
					 	<a onclick="freezeOrder(${orderPager.pageOffset},${orderPager.pageSize})" href="javascript:;" class="btn btn-warning"><i class="icon-ban-circle icon-white"></i>确认收货</a>　
						<a onclick="removeOrder(${orderPager.pageOffset},${orderPager.pageSize})" href="javascript:;" class="btn btn-danger"><i class="icon-remove-sign icon-white"></i>删除</a>　　
						</div> 	<br/><br/><br/>
					 </div>
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
