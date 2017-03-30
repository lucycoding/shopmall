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
    <title>发货订单</title>
  </head>
  
  <body>
						<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<td colspan="6" style="text-align:center;font-size: 20px;font-weight: bolder;">网上商城发货单——订单号${oneOrder.orderId}</td>
								</tr>
								<tr><td colspan="6"></td></tr>
								<tr><td colspan="6"></td></tr>
								<tr>
									<td style="text-align:center;"><b>用户名</b></td>
									<td style="text-align:center;"><b>收货人</b></td>
									<td style="text-align:center;"><b>手机</b></td>
									<td style="text-align:center;"><b>地址</b></td>
									<td style="text-align:center;"><b>邮编</b></td>
									<td style="text-align:center;"><b>生成时间</b></td>
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
									<td style="text-align:center;"><b>订单ID</b></td>
									<td style="text-align:center;"><b>订单项ID</b></td>
									<td style="text-align:center;"><b>商品号</b></td>
									<td style="text-align:center;"><b>商品名</b></td>
									<td style="text-align:center;"><b>数量</b></td>
									<td style="text-align:center;"><b>金额</b></td>
								</tr>
								<% float totalPrice=0; %>
    							<c:forEach var="orderItem" items="${oneOrder.orderItem}">
								<tr>
									<td style="text-align:center;">${oneOrder.orderId}</td>
									<td style="text-align:center;">${orderItem.orderItemId }</td>
									<td style="text-align:center;">${orderItem.goodsId }</td>
									<td style="text-align:center;">${orderItem.goodsName }</td>
									<td style="text-align:center;">${orderItem.goodsNum}</td>
									<td style="text-align:center;">￥${orderItem.price}</td>
									<c:set var="price" value="${orderItem.price}" />
									<% 
									Float price=(Float)pageContext.getAttribute("price");
									totalPrice+=price;%>
								</tr>
								</c:forEach>
								<tr><td colspan="6"></td></tr>
								<tr><td colspan="6"></td></tr>
								<tr><td colspan="5"></td><td style="text-align:center;"><b>总计金额: ￥<%=totalPrice %></b></td></tr>
				     </table>
  </body>
</html>
