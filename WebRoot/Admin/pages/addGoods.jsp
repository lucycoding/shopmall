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
    
    <title>�����Ʒ</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="../inc/cssall.jsp" %>
	<script type="text/javascript">
		/**
		 * ��ת���ϴ�ҳ
		 * functionId:����ID
		 * fileType:�ļ�����
		 * maxSize:�ļ���������
		 * callback:�ص����������������������ļ��������ļ���������ļ���С
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
		 * �ص�����,��ȡ�ϴ��ļ���Ϣ  
		 * realName��ʵ�ļ���  
		 * saveName�ļ�������  
		 * maxSize�ļ�ʵ�ʴ�С  
		 */  
		function callback(saveName){  
		    $("#picture").val(saveName);  
		    //�ص�����������  
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
						typeDiv.innerHTML = "<font color='orange'>��û�д���</font>";
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
				GoodsNameDiv.innerHTML = "<font color='orange'>��Ʒ������Ϊ��</font>";
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
				isbnDiv.innerHTML = "<font color='orange'>��Ʒ��Ų���Ϊ��</font>";
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
				pagesDiv.innerHTML = "<font color='orange'>�������ڲ���Ϊ��</font>";
				checkPages_ = false;
			} else if(pattern.test(pages.value)) {
				pagesDiv.innerHTML = "<font color='green'>��</font>";
				checkPages_ = true;
			} else {
				pagesDiv.innerHTML = "<font color='orange'>��ʽ����</font>";
				checkPages_ = false;
			}
		}
		var checkPublisher_;
		function checkPublisher() {
			var publisher = document.getElementById("publisher");
			var publisherDiv = document.getElementById("publisherDiv");
			if(publisher.value == "") {
				publisherDiv.innerHTML = "<font color='orange'>���ز���Ϊ��</font>";
				checkPublisher_ = false;
			} else {
				publisherDiv.innerHTML = "<font color='green'>��</font>";
				checkPublisher_ = true;
			}
		}
		var checkAuthor_ ;
		function checkAuthor() {
			var author = document.getElementById("author");
			var authorDiv = document.getElementById("authorDiv");
			if(author.value == "") {
				authorDiv.innerHTML = "<font color='orange'>Ʒ�Ʋ���Ϊ��</font>";
				checkAuthor_ = false;
			} else {
				authorDiv.innerHTML = "<font color='green'>��</font>";
				checkAuthor_ = true;
			}
		}
		var checkPrice_;
		function checkPrice() {
			var price = document.getElementById("price");
			var priceDiv = document.getElementById("priceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(price.value == "") {
				priceDiv.innerHTML = "<font color='orange'>ԭ�۲���Ϊ��</font>";
				checkPrice_ = false;
			} else if(pattern.test(price.value)) {
				priceDiv.innerHTML = "<font color='green'>��</font>";
				checkPrice_ = true;
			} else {
				priceDiv.innerHTML = "<font color='orange'>��ʽ����</font>";
				checkPrice_ = false;
			}
		}
		var checkNowPrice_;
		function checkNowPrice() {
			var nowPrice = document.getElementById("nowPrice");
			var nowPriceDiv = document.getElementById("nowPriceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(nowPrice.value == "") {
				nowPriceDiv.innerHTML = "<font color='orange'>�ּ۲���Ϊ��</font>";
				checkNowPrice_ = false;
			} else if(pattern.test(nowPrice.value)) {
				nowPriceDiv.innerHTML = "<font color='green'>��</font>";
				checkNowPrice_ = true;
			} else {
				nowPriceDiv.innerHTML = "<font color='orange'>��ʽ����</font>";
				checkNowPrice_ = false;
			}
		}
		var checkGoodsNum_;
		function checkGoodsNum() {
			var GoodsNum = document.getElementById("GoodsNum");
			var GoodsNumDiv = document.getElementById("GoodsNumDiv");
			var pattern = /^[1-9]\d*$/;
			if(GoodsNum.value == "") {
				GoodsNumDiv.innerHTML = "<font color='orange'>��������Ϊ��</font>";
				checkGoodsNum_ = false;
			} else if(pattern.test(GoodsNum.value)) {
				GoodsNumDiv.innerHTML = "<font color='green'>��</font>";
				checkGoodsNum_ = true;
			} else {
				GoodsNumDiv.innerHTML = "<font color='orange'>��ʽ����</font>";
				checkGoodsNum_ = false;
			}
		}
		function add() {
			var s1 = document.getElementById("superTypeId");
			var typeDiv = document.getElementById("typeDiv");
			if(s1.value == "0") {
				typeDiv.innerHTML = "<font color='orange'>��ѡ�����</font>";
			} else if(!GoodsName_IsExist && !ISBN_IsExist && checkPages_ && checkPublisher_ && checkAuthor_ && checkPrice_ && checkNowPrice_ && checkGoodsNum_) {
				bootbox.confirm('ȷ�������Ʒ��', function(flag) {
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
						<h2><i class="icon-plus-sign"></i>&nbsp;<a href="allowAddGoodsServlet">�����Ʒ</a></h2>
												
					</div>
					<br/>
		<form action="addGoodsServlet" method="post">
					<fieldset style="margin-left: 30%">
						<div class="control-group">
							���:����&nbsp;<select id="superTypeId" name="superTypeId" onchange="getSubType()">
								<option value="0">--ѡ�����--</option>
								<c:forEach var="superType" items="${superTypes }">
									<option value="${superType.superTypeId }">${superType.typeName }</option>
								</c:forEach>
								</select><font color="red">*</font><span id="typeDiv"></span>
						</div>
						<div class="control-group">
							��Ʒ��:��
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsName" name="GoodsName" onblur="checkGoodsName()"/>
							  <span id="GoodsNameDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							��Ʒ����:
							  <input style="height: 25px" class="input-large focused" type="text" id="ISBN" name="ISBN" onblur="checkISBN()"/>
							  <span id="ISBNDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							��ؽ���:
							  <textarea rows="3" cols="20" id="introduce" name="introduce"></textarea>
						</div>
						
						<div class="control-group">
							��������:
							  <input style="height: 25px" class="input-large focused" type="text"  id="pages" name="pages" onblur="checkPages()"/>
							  <span id="pagesDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							����:����
							  <input style="height: 25px" class="input-large focused" type="text"  id="publisher" name="publisher" onblur="checkPublisher()"/>
							  <span id="publisherDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							Ʒ��:����
							  <input style="height: 25px" class="input-large focused" type="text"  id="author" name="author" onblur="checkAuthor()"/>
							  <span id="authorDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							ԭ��:����
							  <input style="height: 25px" class="input-large focused" type="text"  id="price" name="price" onblur="checkPrice()"/>
							  <span id="priceDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							�ּ�:����
							  <input style="height: 25px" class="input-large focused" type="text" id="nowPrice" name="nowPrice" onblur="checkNowPrice()"/>
							  <span id="nowPriceDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							ͼƬ:����<input type="hidden" id="picture" name="picture"/>
							  <button class="btn btn-success" type="button" onclick="openUpload_()" ><i class="icon-cloud-upload icon-white"></i>�ϴ�</button>����<font color="red" size="3"><span id="imgErr">${imgErr }</span></font>
						</div>
						
						<div class="control-group">
							����:����
							  <input style="height: 25px" class="input-large focused" type="text" id="GoodsNum" name="GoodsNum" onblur="checkGoodsNum()"/>
							  <span id="GoodsNumDiv"><font color="red">*</font></span>
						</div>
						
						<div class="control-group">
							����:����
							  <input type="checkbox" name="hotGoods" value="1"/>����
								<input type="checkbox" name="newGoods" value="1"/>��Ʒ
								<input type="checkbox" name="saleGoods" value="1"/>����
								<input type="checkbox" name="specialGoods" value="1"/>�ر��Ƽ�
						</div>
						
						<div class="form-actions" style="background-color: white;border: 0;margin-left: 20%">
							<a href="javascript:;" onclick="add()" class="btn btn-primary"><i class="icon-plus-sign icon-white"></i>���</a><br/>
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