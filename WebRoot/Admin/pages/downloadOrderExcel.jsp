<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="tools.jsp" %>
<%
   response.reset(); 
   response.setContentType("application/vnd.ms-excel;charset=GBK");
   response.setHeader("Content-Disposition","attachment;filename=orderId_"+session.getAttribute("oneOrderId")+".xls");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��������</title>
  </head>
  
  <body>
						<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<td colspan="6" style="text-align:center;font-size: 20px;font-weight: bolder;">�����̳Ƿ���������������${oneOrder.orderId}</td>
								</tr>
								<tr><td colspan="6"></td></tr>
								<tr><td colspan="6"></td></tr>
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
									<td style="text-align:center;">[${oneOrder.orderDate }]</td>
								</tr>
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
								<tr><td colspan="6"></td></tr>
								<tr><td colspan="6"></td></tr>
								<tr><td colspan="5"></td><td style="text-align:center;"><b>�ܼƽ��: ��<%=totalPrice %></b></td></tr>
				     </table>
  </body>
</html>
