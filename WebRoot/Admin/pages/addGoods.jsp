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
    
    <title>添加商品</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="../inc/cssall.jsp" %>
	<script type="text/javascript">
		/**
		 * 跳转到上传页
		 * functionId:功能ID
		 * fileType:文件类型
		 * maxSize:文件容量上限
		 * callback:回调函数，返回三个参数：文件真名、文件存放名和文件大小
		 */
		function openUpload(functionId,fileType,maxSize,callback){
			var url = "Admin/pages/upload.jsp?Rnd="+Math.random()+"&";
			if(functionId!=null){
				url = url + "functionId="+functionId+"&";
			}
			if(fileType!=null){
				url = url + "fileType="+fileType+"&";
			}
			if(maxSize!=null){
				url = url + "maxSize="+maxSize;
			}
			var win = window.showModalDialog(url,"","dialogWidth:350px;dialogHeight:200px;scroll:no;status:no;dialogLeft:600px;dialogTop:300px");
			if(win != null||win !=""){
				callback(win);
			}
		}
		function openUpload_(){  
		    openUpload(null,'JPG,GIF,JPEG,PNG','5',callback);  
		}  
		  
		/**  
		 * 回调函数,获取上传文件信息  
		 * realName真实文件名  
		 * saveName文件保存名  
		 * maxSize文件实际大小  
		 */  
		function callback(saveName){  
		    $("#picture").val(saveName);  
		    //回调后其它操作  
		}  
		
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
					} else {
						typeDiv.innerHTML = "<font color='orange'>还没有大类</font>";
					}
				}
			}
		}
		var GoodsName_IsExist;
		function checkGoodsNameIsExist() {
			var GoodsName = document.getElementById("GoodsName");
			var url = "checkGoodsNameIsExist?GoodsName="+GoodsName.value;
			sendGoodsName(url);
		}
		function sendGoodsName(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = GoodsNameIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		function GoodsNameIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var GoodsNameDiv = document.getElementById("GoodsNameDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						GoodsName_IsExist = true;
					} else {
						GoodsName_IsExist = false;
					}
					GoodsNameDiv.innerHTML = content;
				}
			}
		}
		function checkGoodsName() {
			var GoodsName = document.getElementById("GoodsName");
			var GoodsNameDiv = document.getElementById("GoodsNameDiv");
			if(GoodsName.value == "") {
				GoodsNameDiv.innerHTML = "<font color='orange'>商品名不能为空</font>";
			} else {
				checkGoodsNameIsExist();
			}
		}
		
		var ISBN_IsExist;
		function checkISBNIsExist() {
			var isbn = document.getElementById("ISBN");
			var url = "checkISBNIsExist?ISBN="+isbn.value;
			sendISBN(url);
		}
		function sendISBN(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = ISBNIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		function ISBNIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var ISBNDiv = document.getElementById("ISBNDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						ISBN_IsExist = true;
					} else {
						ISBN_IsExist = false;
					}
					ISBNDiv.innerHTML = content;
				}
			}
		}
		function checkISBN() {
			var isbn = document.getElementById("ISBN");
			var isbnDiv = document.getElementById("ISBNDiv");
			if(isbn.value == "") {
				isbnDiv.innerHTML = "<font color='orange'>商品编号不能为空</font>";
			} else {
				checkISBNIsExist();
			}
		}
		
		var checkPages_;
		function checkPages() {
			var pages = document.getElementById("pages");
			var pagesDiv = document.getElementById("pagesDiv");
			var pattern = /(?:19|20\d{2})\/(?:0[1-9]|1[0-2])\/(?:0[1-9]|[12][0-9]|3[01])/;
			if(pages.value == "") {
				pagesDiv.innerHTML = "<font color='orange'>生产日期不能为空</font>";
				checkPages_ = false;
			} else if(pattern.test(pages.value)) {
				pagesDiv.innerHTML = "<font color='green'>√</font>";
				checkPages_ = true;
			} else {
				pagesDiv.innerHTML = "<font color='orange'>格式不对</font>";
				checkPages_ = false;
			}
		}
		var checkPublisher_;
		function checkPublisher() {
			var publisher = document.getElementById("publisher");
			var publisherDiv = document.getElementById("publisherDiv");
			if(publisher.value == "") {
				publisherDiv.innerHTML = "<font color='orange'>产地不能为空</font>";
				checkPublisher_ = false;
			} else {
				publisherDiv.innerHTML = "<font color='green'>√</font>";
				checkPublisher_ = true;
			}
		}
		var checkAuthor_ ;
		function checkAuthor() {
			var author = document.getElementById("author");
			var authorDiv = document.getElementById("authorDiv");
			if(author.value == "") {
				authorDiv.innerHTML = "<font color='orange'>品牌不能为空</font>";
				checkAuthor_ = false;
			} else {
				authorDiv.innerHTML = "<font color='green'>√</font>";
				checkAuthor_ = true;
			}
		}
		var checkPrice_;
		function checkPrice() {
			var price = document.getElementById("price");
			var priceDiv = document.getElementById("priceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(price.value == "") {
				priceDiv.innerHTML = "<font color='orange'>原价不能为空</font>";
				checkPrice_ = false;
			} else if(pattern.test(price.value)) {
				priceDiv.innerHTML = "<font color='green'>√</font>";
				checkPrice_ = true;
			} else {
				priceDiv.innerHTML = "<font color='orange'>格式不对</font>";
				checkPrice_ = false;
			}
		}
		var checkNowPrice_;
		function checkNowPrice() {
			var nowPrice = document.getElementById("nowPrice");
			var nowPriceDiv = document.getElementById("nowPriceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(nowPrice.value == "") {
				nowPriceDiv.innerHTML = "<font color='orange'>现价不能为空</font>";
				checkNowPrice_ = false;
			} else if(pattern.test(nowPrice.value)) {
				nowPriceDiv.innerHTML = "<font color='green'>√</font>";
				checkNowPrice_ = true;
			} else {
				nowPriceDiv.innerHTML = "<font color='orange'>格式不对</font>";
				checkNowPrice_ = false;
			}
		}
		var checkGoodsNum_;
		function checkGoodsNum() {
			var GoodsNum = document.getElementById("GoodsNum");
			var GoodsNumDiv = document.getElementById("GoodsNumDiv");
			var pattern = /^[1-9]\d*$/;
			if(GoodsNum.value == "") {
				GoodsNumDiv.innerHTML = "<font color='orange'>数量不能为空</font>";
				checkGoodsNum_ = false;
			} else if(pattern.test(GoodsNum.value)) {
				GoodsNumDiv.innerHTML = "<font color='green'>√</font>";
				checkGoodsNum_ = true;
			} else {
				GoodsNumDiv.innerHTML = "<font color='orange'>格式不对</font>";
				checkGoodsNum_ = false;
			}
		}
		function add() {
			var s1 = document.getElementById("superTypeId");
			var typeDiv = document.getElementById("typeDiv");
			if(s1.value == "0") {
				typeDiv.innerHTML = "<font color='orange'>请选择类别</font>";
			} else if(!GoodsName_IsExist && !ISBN_IsExist && checkPages_ && checkPublisher_ && checkAuthor_ && checkPrice_ && checkNowPrice_ && checkGoodsNum_) {
				bootbox.confirm('确认添加商品？', function(flag) {
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
						<h2><i class="icon-plus-sign"></i>&nbsp;<a href="allowAddGoodsServlet">添加商品</a></h2>
												
					</div>
					<br/>
		<form action="addGoodsServlet" method="post">
					<fieldset style="margin-left: 30%">
						<div class="control-group">
							类别:　　&nbsp;<select id="superTypeId" name="superTypeId" onchange="getSubType()">
								<option value="0">--选择类别--</option>
								<c:forEach var="superType" items="${superTypes }">
									<option value="${superType.superTypeId }">${superType.typeName }</option>
								</c:forEach>
								</select><font color="red">*</font><span id="typeDiv"></span>
						</div>
						<div class="control-group">
							商品名:　
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsName" name="GoodsName" onblur="checkGoodsName()"/>
							  <span id="GoodsNameDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							商品编码:
							  <input style="height: 25px" class="input-large focused" type="text" id="ISBN" name="ISBN" onblur="checkISBN()"/>
							  <span id="ISBNDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							相关介绍:
							  <textarea rows="3" cols="20" id="introduce" name="introduce"></textarea>
						</div>
						
						<div class="control-group">
							生产日期:
							  <input style="height: 25px" class="input-large focused" type="text"  id="pages" name="pages" onblur="checkPages()"/>
							  <span id="pagesDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							产地:　　
							  <input style="height: 25px" class="input-large focused" type="text"  id="publisher" name="publisher" onblur="checkPublisher()"/>
							  <span id="publisherDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							品牌:　　
							  <input style="height: 25px" class="input-large focused" type="text"  id="author" name="author" onblur="checkAuthor()"/>
							  <span id="authorDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							原价:　　
							  <input style="height: 25px" class="input-large focused" type="text"  id="price" name="price" onblur="checkPrice()"/>
							  <span id="priceDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							现价:　　
							  <input style="height: 25px" class="input-large focused" type="text" id="nowPrice" name="nowPrice" onblur="checkNowPrice()"/>
							  <span id="nowPriceDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							图片:　　<input type="hidden" id="picture" name="picture"/>
							  <button class="btn btn-success" type="button" onclick="openUpload_()" ><i class="icon-cloud-upload icon-white"></i>上传</button>　　<font color="red" size="3"><span id="imgErr">${imgErr }</span></font>
						</div>
						
						<div class="control-group">
							数量:　　
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsNum" name="GoodsNum" onblur="checkGoodsNum()"/>
							  <span id="GoodsNumDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							类型:　　
							  <input type="checkbox" name="hotGoods" value="1"/>热卖
								<input type="checkbox" name="newGoods" value="1"/>新品
								<input type="checkbox" name="saleGoods" value="1"/>打折
								<input type="checkbox" name="specialGoods" value="1"/>特别推荐
						</div>
						
						<div class="form-actions" style="background-color: white;border: 0;margin-left: 20%">
							<a href="javascript:;" onclick="add()" class="btn btn-primary"><i class="icon-plus-sign icon-white"></i>添加</a><br/>
						</div> <!-- /form-actions -->
					</fieldset>
    	</form>
			    </div>  <!-- row-fluid -->				
			</div>
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
${message }
<% request.setAttribute("message",""); %>