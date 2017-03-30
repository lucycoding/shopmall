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
    
    <title>�޸���Ʒ</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<%@ include file="../inc/cssall.jsp" %>
	<script type="text/javascript">
		var req;
		function getSuperType() {
			var url = "getSuperType";
			sendSuperTypeRequest(url);
		}
		function sendSuperTypeRequest(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = showSuper;
			req.open("get",url,true);
			req.send(null);
		}
		function showSuper() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var subTypeXml = req.responseXML;
					var superTypes = subTypeXml.getElementsByTagName("super");
					var superTypeId = document.getElementById("superTypeId");
					if(superTypes.length > 0) {
						for(var i=0;i<superTypes.length;i++) {
							var superId = superTypes[i].getElementsByTagName("superId").item(0).firstChild.data;
							var superName = superTypes[i].getElementsByTagName("superName").item(0).firstChild.data;
							var op = document.createElement("option");
							op.setAttribute("value",superId);
							var txt = document.createTextNode(superName);
							op.appendChild(txt);
							superTypeId.appendChild(op);
							superTypeId.style.width = "auto";
						}
						var nType = document.getElementById("superType").value;
                        for(var i=0;i<=superTypeId.options.length;i++ ){
                             if(superTypeId.options[i].value==nType){
                                  superTypeId.options.selectedIndex = i;
                                  getSubType();
                                    return;
                             }
                         }
					} else {
						typeDiv.innerHTML = "��û�д���";
					}
				}
			}
		}
        var checkGoodsName_;
		function checkGoodsName() {
			var GoodsName = document.getElementById("GoodsName");
			var GoodsNameDiv = document.getElementById("GoodsNameDiv");
			if(GoodsName.value == "") {
				GoodsNameDiv.innerHTML = "��Ʒ������Ϊ��";
				checkGoodsName_=false;
			} else {
				GoodsNameDiv.innerHTML="��";
				checkGoodsName_=true;
			}
		}
		var checkISBN_;
		function checkISBN() {
			var isbn = document.getElementById("ISBN");
			var isbnDiv = document.getElementById("ISBNDiv");
			if(isbn.value == "") {
				isbnDiv.innerHTML = "��Ʒ���벻��Ϊ��";
				checkISBN_=false;
			} else {
				ISBNDiv.innerHTML = "��";
				checkISBN_=true;
			}
		}
		
		var checkPages_;
		function checkPages() {
			var pages = document.getElementById("pages");
			var pagesDiv = document.getElementById("pagesDiv");
			//var pattern = /^[0-9]\d*$/;
			var pattern = /(?:19|20\d{2})\/(?:0[1-9]|1[0-2])\/(?:0[1-9]|[12][0-9]|3[01])/;
			if(pages.value == "") {
				pagesDiv.innerHTML = "��Ʒ���������ڲ���Ϊ��";
				checkPages_ = false;
			} else if(pattern.test(pages.value)) {
				pagesDiv.innerHTML = "��";
				checkPages_ = true;
			} else {
				pagesDiv.innerHTML = "��ʽ����";
				checkPages_ = false;
			}
		}
		var checkPublisher_;
		function checkPublisher() {
			var publisher = document.getElementById("publisher");
			var publisherDiv = document.getElementById("publisherDiv");
			if(publisher.value == "") {
				publisherDiv.innerHTML = "���ز���Ϊ��";
				checkPublisher_ = false;
			} else {
				publisherDiv.innerHTML = "��";
				checkPublisher_ = true;
			}
		}
		var checkAuthor_ ;
		function checkAuthor() {
			var author = document.getElementById("author");
			var authorDiv = document.getElementById("authorDiv");
			if(author.value == "") {
				authorDiv.innerHTML = "Ʒ�Ʋ���Ϊ��";
				checkAuthor_ = false;
			} else {
				authorDiv.innerHTML = "��";
				checkAuthor_ = true;
			}
		}
		var checkPrice_;
		function checkPrice() {
			var price = document.getElementById("price");
			var priceDiv = document.getElementById("priceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(price.value == "") {
				priceDiv.innerHTML = "ԭ�۲���Ϊ��";
				checkPrice_ = false;
			} else if(pattern.test(price.value)) {
				priceDiv.innerHTML = "��";
				checkPrice_ = true;
			} else {
				priceDiv.innerHTML = "��ʽ����";
				checkPrice_ = false;
			}
		}
		var checkNowPrice_;
		function checkNowPrice() {
			var nowPrice = document.getElementById("nowPrice");
			var nowPriceDiv = document.getElementById("nowPriceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(nowPrice.value == "") {
				nowPriceDiv.innerHTML = "�ּ۲���Ϊ��";
				checkNowPrice_ = false;
			} else if(pattern.test(nowPrice.value)) {
				nowPriceDiv.innerHTML = "��";
				checkNowPrice_ = true;
			} else {
				nowPriceDiv.innerHTML = "��ʽ����";
				checkNowPrice_ = false;
			}
		}
		var checkGoodsNum_;
		function checkGoodsNum() {
			var GoodsNum = document.getElementById("GoodsNum");
			var GoodsNumDiv = document.getElementById("GoodsNumDiv");
			var pattern = /^[1-9]\d*$/;
			if(GoodsNum.value == "") {
				GoodsNumDiv.innerHTML = "��������Ϊ��";
				checkGoodsNum_ = false;
			} else if(pattern.test(GoodsNum.value)) {
				GoodsNumDiv.innerHTML = "��";
				checkGoodsNum_ = true;
			} else {
				GoodsNumDiv.innerHTML = "��ʽ����";
				checkGoodsNum_ = false;
			}
		}
		function update() {
			checkGoodsName();
			checkISBN();
			checkPages();
			checkPublisher();
			checkAuthor();
			checkPrice();
			checkNowPrice();
			checkGoodsNum();
			var s1 = document.getElementById("superTypeId");
			var typeDiv = document.getElementById("typeDiv");
			if(s1.value == "0") {
				typeDiv.innerHTML = "��ѡ������";
			} else if(checkGoodsName_ && checkISBN_ && checkPages_ && checkPublisher_ && checkAuthor_ && checkPrice_ && checkNowPrice_ && checkGoodsNum_) {
				bootbox.confirm('ȷ���޸ĸ���Ʒ��', function(flag) {
					if( flag ) {
						var oForm = document.getElementsByTagName("form")[0];
						oForm.submit();
					}
				});
			}
		}
	</script>
  </head>
   <body onload="getSuperType()">
				<div>
					<ul class="breadcrumb">
						<li><a>��Ʒ����</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-lock"></i>&nbsp;�޸���Ʒ</h2>
												
					</div>
					<br/>
				<form action="updateGoodsServlet" method="get">
					<fieldset style="margin-left: 30%">
						<div class="control-group">
							���:����&nbsp;<select id="superTypeId" name="superTypeId" onchange="getSubType()">
								<option value="0">--ѡ�����--</option>
								<c:forEach var="superType" items="${superTypes }">
									<option value="${superType.superTypeId }">${superType.typeName }</option>
								</c:forEach>
								</select><font color="red">*</font><span id="typeDiv"></span>
						</div>
						<input type="hidden" id="superType" name="superTypeId" value="${Goods.superTypeId}"/>
						
						<input type="hidden" name="GoodsId" value="${Goods.goodsId}"/>
						
						<div class="control-group">
							��ƷID:��
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsId" value="${Goods.goodsId}" disabled="disabled"/>
							  <span id="GoodsIdDiv"><font color="red"></font></span>
						</div>
						
						<div class="control-group">
							��Ʒ��:��
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsName" name="GoodsName" value="${Goods.goodsName}" onblur="checkGoodsName()"/>
							  <span id="GoodsNameDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							��Ʒ����:
							  <input style="height: 25px" class="input-large focused" type="text" id="ISBN" name="ISBN"  value="${Goods.ISBN}" onblur="checkISBN()"/>
							  <span id="ISBNDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							��ؽ���:
							  <textarea rows="3" cols="20" id="introduce" name="introduce">${Goods.introduce}</textarea>
						</div>
						
						<div class="control-group">
							��������:
							  <input style="height: 25px" class="input-large focused" type="text"  id="pages" name="pages" value="${Goods.produceDate}" onblur="checkPages()"/>
							  <span id="pagesDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							����:����
							  <input style="height: 25px" class="input-large focused" type="text"  id="publisher" name="publisher"  value="${Goods.publisher}" onblur="checkPublisher()"/>
							  <span id="publisherDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							Ʒ��:����
							  <input style="height: 25px" class="input-large focused" type="text"  id="author" name="author" value="${Goods.author}" onblur="checkAuthor()"/>
							  <span id="authorDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							ԭ��:����
							  <input style="height: 25px" class="input-large focused" type="text"  id="price" name="price" value="${Goods.price}" onblur="checkPrice()"/>
							  <span id="priceDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							�ּ�:����
							  <input style="height: 25px" class="input-large focused" type="text" id="nowPrice" name="nowPrice" value="${Goods.nowPrice}" onblur="checkNowPrice()"/>
							  <span id="nowPriceDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							����:����
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsNum" name="GoodsNum" value="${Goods.goodsNum}" onblur="checkGoodsNum()"/>
							  <span id="GoodsNumDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							����:����
								<c:if test="${Goods.hostGoods == 1 }">
								    <input type="checkbox" name="hostGoods" value="1" checked="checked"/>����
								  </c:if>
								  <c:if test="${Goods.hostGoods != 1 }">
								    <input type="checkbox" name="hostGoods" value="1"/>����
								  </c:if>
								  
								  
								  <c:if test="${Goods.newGoods == 1 }">
									<input type="checkbox" name="newGoods" value="1" checked="checked"/>��Ʒ
								  </c:if>
								  <c:if test="${Goods.newGoods != 1 }">
									<input type="checkbox" name="newGoods" value="1"/>��Ʒ
								  </c:if>
								  
								  <c:if test="${Goods.saleGoods == 1 }">
									<input type="checkbox" name="saleGoods" value="1" checked="checked"/>����
								  </c:if>
								  <c:if test="${Goods.saleGoods != 1 }">
									<input type="checkbox" name="saleGoods" value="1"/>����
								  </c:if>
								  
								  <c:if test="${Goods.specialGoods ==1 }">
									<input type="checkbox" name="specialGoods" value="1" checked="checked"/>�ر��Ƽ�
								  </c:if>
								  <c:if test="${Goods.specialGoods !=1 }">
									<input type="checkbox" name="specialGoods" value="1"/>�ر��Ƽ�
								  </c:if>
						</div>
						
						<div class="form-actions" style="background-color: white;border: 0;margin-left: 20%">
							<a href="javascript:;" onclick="update()" class="btn btn-primary">�޸�</a><br/>
						</div> <!-- /form-actions -->
					</fieldset>
    			</form>
			    </div>  <!-- row-fluid -->				
			</div>
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
${updateMessage }
<% session.setAttribute("updateMessage",""); %>