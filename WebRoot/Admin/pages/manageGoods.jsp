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
    <title>������Ʒ</title>
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
		
		function removeGoods(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var Goods = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					Goods.push(deletes[i].value);
				}
			}
			if(count == 0) {
				bootbox.alert("��û��ѡ��ɾ����");
				return false;
			}
			bootbox.confirm("ȷ��ɾ��ѡ�е���Ʒ?", function(flag) {
			if( flag ) {
				var oform = document.getElementsByTagName("form")[0];
				oform.action = "deleteGoodsServlet?GoodsIds="+Goods+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
				oform.submit();
			}
			});
		}
		function searchGoods(pageOffset,pageSize) {
			var GoodsName = document.getElementById("GoodsName");
			var searchDiv = document.getElementById("searchDiv");
			var oform = document.getElementsByTagName("form")[0];
			if(GoodsName.value != "") {
				oform.action = "getGoodsByGoodsNameServlet?GoodsName="+GoodsName.value;
				oform.submit();
			} else {
				searchDiv.innerHTML = "������ؼ���";
			}	
		}
	</script>
  </head>
  <body>
				<div>
					<ul class="breadcrumb">
						<li><a>��Ʒ����</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i>&nbsp;<a href="getGoodsPagerServlet">�鿴��Ʒ</a></h2>
												
					</div>
					<br/>
					<div style="margin-left: 3px;margin-right: 3px">
					<div class="input-append">��
							<input class="input-large" style="height: 25px" type="text" id="GoodsName" name="GoodsName" placeholder="������ؼ���(ȫ��ģ����ѯ)">
							<button class="btn add-on" onclick="searchGoods(${GoodsPager.pageOffset},${GoodsPager.pageSize})"><i class="icon-search"></i></button>
							<font color="red"><span id="searchDiv"></span></font>
						</div><br/>
					<table class="table table-striped table-bordered" id="user-table" style="font-size: 12px;">
								<tr>
									<th style="text-align:center;"><input type="checkbox" id="selectAll" onclick="selectAll()">ȫѡ</th>
									<th style="text-align:center;">��ƷID</th>
									<th style="text-align:center;">��Ʒ��</th>
									<th style="text-align:center;">����</th>
									<th style="text-align:center;">ԭ��</th>
									<th style="text-align:center;">�ּ�</th>
									<th style="text-align:center;">��Ʒ</th>
									<th style="text-align:center;">����</th>
									<th style="text-align:center;">����</th>
									<th style="text-align:center;">����</th>
									<th style="text-align:center;">����</th>
								</tr>
								<form method="post" name="deleteForm">
    							<c:forEach var="Goods" items="${ GoodsList}">
								<tr>
									<td style="text-align:center;"><input type="checkbox" name="delete" value="${Goods.goodsId }"></td>
									<td style="text-align:center;">${Goods.goodsId }</td>
									<td style="text-align:center;">${Goods.goodsName }</td>
									<td style="text-align:center;">${Goods.introduce }</td>
									<td style="text-align:center;">${Goods.price }</td>
									<td style="text-align:center;">${Goods.nowPrice}</td>
									<td style="text-align:center;"><c:if test="${Goods.newGoods == 1}">��</c:if><c:if test="${Goods.newGoods == 0}">-</c:if></td>
									<td style="text-align:center;"><c:if test="${Goods.saleGoods == 1}">��</c:if><c:if test="${Goods.saleGoods == 0}">-</c:if></td>
									<td style="text-align:center;"><c:if test="${Goods.hostGoods == 1}">��</c:if><c:if test="${Goods.hostGoods == 0}">-</c:if></td>
									<td style="text-align:center;">${Goods.goodsNum }</td>
									<td style="text-align:center;"><a class="btn btn-primary" href="updateGoodServlet?GoodsId=${Goods.goodsId}"><i class="icon-edit icon-white"></i>�޸�</a></td>
								</tr>
								</c:forEach>
    							</form>
				     </table>
				     <div class="pagination pagination-right">
				     <pg:pager items="${GoodsPager.totalNum }" maxPageItems="${GoodsPager.pageSize}" export="currentPageNo = pageNumber" url="getGoodsPagerServlet">
				     <pg:param name="pageSize" value="${GoodsPager.pageSize }"/>
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
						            <c:when test="${GoodsPager.pagecurrentPageNo eq pageNumber}">
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
						<a onclick="removeGoods(${GoodsPager.pageOffset},${GoodsPager.pageSize})" href="javascript:;" class="btn btn-danger"><i class="icon-remove-sign icon-white"></i>ɾ��</a>����
						</div> 	<br/><br/><br/>
					 </div>
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
 
</html>
