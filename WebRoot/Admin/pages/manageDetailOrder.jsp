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
    
    <title>��������</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="../inc/cssall.jsp" %>
  </head>
  
  <body>
				<div>
					<ul class="breadcrumb">
						<li><a>��������</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-list-alt"></i>&nbsp;<a href="getOrderPagerServlet">���ж���</a>������ ����<font style="text-decoration: underline;color: red">${oneOrder.orderId}</font>����ϸ��Ϣ</h2>
												
					</div>
					<br/>
					<div style="margin-left: 3px;margin-right: 3px">
					<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<td style="text-align:center;"><b>�û���</b></td>
									<td style="text-align:center;"><b>�ջ���</b></td>
									<td style="text-align:center;"><b>�ֻ�</b></td>
									<td style="text-align:center;"><b>��ַ</b></td>
									<td style="text-align:center;"><b>�ʱ�</b></td>
									<td style="text-align:center;"><b>����ʱ��</b></td>
								</tr>
								<tr>
									<td style="text-align:center;">${oneOrder.user.name }</td>
									<td style="text-align:center;">${oneOrder.recvName }</td>
									<td style="text-align:center;">${oneOrder.user.email }</td>
									<td style="text-align:center;">${oneOrder.user.address }</td>
									<td style="text-align:center;">${oneOrder.user.postcode }</td>
									<td style="text-align:center;">${oneOrder.orderDate }</td>
								</tr>
								<tr><td colspan="6"></td></tr>
								<tr><td colspan="6"></td></tr>
								<tr><td colspan="6"></td></tr>
								<tr>
									<td style="text-align:center;"><b>����ID</b></td>
									<td style="text-align:center;"><b>������ID</b></td>
									<td style="text-align:center;"><b>��Ʒ��</b></td>
									<td style="text-align:center;"><b>��Ʒ��</b></td>
									<td style="text-align:center;"><b>����</b></td>
									<td style="text-align:center;"><b>���</b></td>
								</tr>
								<% float totalPrice=0; %>
    							<c:forEach var="orderItem" items="${oneOrder.orderItem}">
								<tr>
									<td style="text-align:center;">${oneOrder.orderId}</td>
									<td style="text-align:center;">${orderItem.orderItemId }</td>
									<td style="text-align:center;">${orderItem.goodsId }</td>
									<td style="text-align:center;">${orderItem.goodsName }</td>
									<td style="text-align:center;">${orderItem.goodsNum}</td>
									<td style="text-align:center;">��${orderItem.price}</td>
									<c:set var="price" value="${orderItem.price}" />
									<% 
									Float price=(Float)pageContext.getAttribute("price");
									totalPrice+=price;%>
								</tr>
								</c:forEach>
								<tr><td colspan="5"></td><td style="text-align:center;"><b>�ܼƽ��: ��<%=totalPrice %></b></td></tr>
				     </table>
				     <c:if test="${oneOrder.flag == 1 }">
				     <a class="btn btn-success pull-right" href="Admin/pages/downloadOrderExcel.jsp"><i class="icon-share-alt icon-white"></i> ����������(.xls)</a>
				     </c:if>
					 </div>
					 
					 <br/><br/><br/>
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
