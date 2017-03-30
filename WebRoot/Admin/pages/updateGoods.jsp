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
    
    <title>修改商品</title>
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
						typeDiv.innerHTML = "还没有大类";
					}
				}
			}
		}
        var checkGoodsName_;
		function checkGoodsName() {
			var GoodsName = document.getElementById("GoodsName");
			var GoodsNameDiv = document.getElementById("GoodsNameDiv");
			if(GoodsName.value == "") {
				GoodsNameDiv.innerHTML = "商品名不能为空";
				checkGoodsName_=false;
			} else {
				GoodsNameDiv.innerHTML="√";
				checkGoodsName_=true;
			}
		}
		var checkISBN_;
		function checkISBN() {
			var isbn = document.getElementById("ISBN");
			var isbnDiv = document.getElementById("ISBNDiv");
			if(isbn.value == "") {
				isbnDiv.innerHTML = "商品编码不能为空";
				checkISBN_=false;
			} else {
				ISBNDiv.innerHTML = "√";
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
				pagesDiv.innerHTML = "商品的生产日期不能为空";
				checkPages_ = false;
			} else if(pattern.test(pages.value)) {
				pagesDiv.innerHTML = "√";
				checkPages_ = true;
			} else {
				pagesDiv.innerHTML = "格式不对";
				checkPages_ = false;
			}
		}
		var checkPublisher_;
		function checkPublisher() {
			var publisher = document.getElementById("publisher");
			var publisherDiv = document.getElementById("publisherDiv");
			if(publisher.value == "") {
				publisherDiv.innerHTML = "产地不能为空";
				checkPublisher_ = false;
			} else {
				publisherDiv.innerHTML = "√";
				checkPublisher_ = true;
			}
		}
		var checkAuthor_ ;
		function checkAuthor() {
			var author = document.getElementById("author");
			var authorDiv = document.getElementById("authorDiv");
			if(author.value == "") {
				authorDiv.innerHTML = "品牌不能为空";
				checkAuthor_ = false;
			} else {
				authorDiv.innerHTML = "√";
				checkAuthor_ = true;
			}
		}
		var checkPrice_;
		function checkPrice() {
			var price = document.getElementById("price");
			var priceDiv = document.getElementById("priceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(price.value == "") {
				priceDiv.innerHTML = "原价不能为空";
				checkPrice_ = false;
			} else if(pattern.test(price.value)) {
				priceDiv.innerHTML = "√";
				checkPrice_ = true;
			} else {
				priceDiv.innerHTML = "格式不对";
				checkPrice_ = false;
			}
		}
		var checkNowPrice_;
		function checkNowPrice() {
			var nowPrice = document.getElementById("nowPrice");
			var nowPriceDiv = document.getElementById("nowPriceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(nowPrice.value == "") {
				nowPriceDiv.innerHTML = "现价不能为空";
				checkNowPrice_ = false;
			} else if(pattern.test(nowPrice.value)) {
				nowPriceDiv.innerHTML = "√";
				checkNowPrice_ = true;
			} else {
				nowPriceDiv.innerHTML = "格式不对";
				checkNowPrice_ = false;
			}
		}
		var checkGoodsNum_;
		function checkGoodsNum() {
			var GoodsNum = document.getElementById("GoodsNum");
			var GoodsNumDiv = document.getElementById("GoodsNumDiv");
			var pattern = /^[1-9]\d*$/;
			if(GoodsNum.value == "") {
				GoodsNumDiv.innerHTML = "数量不能为空";
				checkGoodsNum_ = false;
			} else if(pattern.test(GoodsNum.value)) {
				GoodsNumDiv.innerHTML = "√";
				checkGoodsNum_ = true;
			} else {
				GoodsNumDiv.innerHTML = "格式不对";
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
				typeDiv.innerHTML = "请选择类型";
			} else if(checkGoodsName_ && checkISBN_ && checkPages_ && checkPublisher_ && checkAuthor_ && checkPrice_ && checkNowPrice_ && checkGoodsNum_) {
				bootbox.confirm('确认修改该商品？', function(flag) {
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
						<li><a>商品管理</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-lock"></i>&nbsp;修改商品</h2>
												
					</div>
					<br/>
				<form action="updateGoodsServlet" method="get">
					<fieldset style="margin-left: 30%">
						<div class="control-group">
							类别:　　&nbsp;<select id="superTypeId" name="superTypeId" onchange="getSubType()">
								<option value="0">--选择大类--</option>
								<c:forEach var="superType" items="${superTypes }">
									<option value="${superType.superTypeId }">${superType.typeName }</option>
								</c:forEach>
								</select><font color="red">*</font><span id="typeDiv"></span>
						</div>
						<input type="hidden" id="superType" name="superTypeId" value="${Goods.superTypeId}"/>
						
						<input type="hidden" name="GoodsId" value="${Goods.goodsId}"/>
						
						<div class="control-group">
							商品ID:　
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsId" value="${Goods.goodsId}" disabled="disabled"/>
							  <span id="GoodsIdDiv"><font color="red"></font></span>
						</div>
						
						<div class="control-group">
							商品名:　
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsName" name="GoodsName" value="${Goods.goodsName}" onblur="checkGoodsName()"/>
							  <span id="GoodsNameDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							商品编码:
							  <input style="height: 25px" class="input-large focused" type="text" id="ISBN" name="ISBN"  value="${Goods.ISBN}" onblur="checkISBN()"/>
							  <span id="ISBNDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							相关介绍:
							  <textarea rows="3" cols="20" id="introduce" name="introduce">${Goods.introduce}</textarea>
						</div>
						
						<div class="control-group">
							生产日期:
							  <input style="height: 25px" class="input-large focused" type="text"  id="pages" name="pages" value="${Goods.produceDate}" onblur="checkPages()"/>
							  <span id="pagesDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							产地:　　
							  <input style="height: 25px" class="input-large focused" type="text"  id="publisher" name="publisher"  value="${Goods.publisher}" onblur="checkPublisher()"/>
							  <span id="publisherDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							品牌:　　
							  <input style="height: 25px" class="input-large focused" type="text"  id="author" name="author" value="${Goods.author}" onblur="checkAuthor()"/>
							  <span id="authorDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							原价:　　
							  <input style="height: 25px" class="input-large focused" type="text"  id="price" name="price" value="${Goods.price}" onblur="checkPrice()"/>
							  <span id="priceDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							现价:　　
							  <input style="height: 25px" class="input-large focused" type="text" id="nowPrice" name="nowPrice" value="${Goods.nowPrice}" onblur="checkNowPrice()"/>
							  <span id="nowPriceDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							数量:　　
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsNum" name="GoodsNum" value="${Goods.goodsNum}" onblur="checkGoodsNum()"/>
							  <span id="GoodsNumDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							类型:　　
								<c:if test="${Goods.hostGoods == 1 }">
								    <input type="checkbox" name="hostGoods" value="1" checked="checked"/>热卖
								  </c:if>
								  <c:if test="${Goods.hostGoods != 1 }">
								    <input type="checkbox" name="hostGoods" value="1"/>热卖
								  </c:if>
								  
								  
								  <c:if test="${Goods.newGoods == 1 }">
									<input type="checkbox" name="newGoods" value="1" checked="checked"/>新品
								  </c:if>
								  <c:if test="${Goods.newGoods != 1 }">
									<input type="checkbox" name="newGoods" value="1"/>新品
								  </c:if>
								  
								  <c:if test="${Goods.saleGoods == 1 }">
									<input type="checkbox" name="saleGoods" value="1" checked="checked"/>打折
								  </c:if>
								  <c:if test="${Goods.saleGoods != 1 }">
									<input type="checkbox" name="saleGoods" value="1"/>打折
								  </c:if>
								  
								  <c:if test="${Goods.specialGoods ==1 }">
									<input type="checkbox" name="specialGoods" value="1" checked="checked"/>特别推荐
								  </c:if>
								  <c:if test="${Goods.specialGoods !=1 }">
									<input type="checkbox" name="specialGoods" value="1"/>特别推荐
								  </c:if>
						</div>
						
						<div class="form-actions" style="background-color: white;border: 0;margin-left: 20%">
							<a href="javascript:;" onclick="update()" class="btn btn-primary">修改</a><br/>
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