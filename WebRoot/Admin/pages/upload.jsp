<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<base target="_self">
<title>�ļ��ϴ�</title>
<script type="text/javascript">
	//����ļ���С������
	function fileChange(target) {
		//����ϴ��ļ������� 
		if (!(/(?:jpg|gif|png|jpeg)$/i.test(target.value))) {
			alert("ֻ�����ϴ�jpg|gif|png|jpeg��ʽ��ͼƬ");
			if (window.ActiveXObject) {//for IE 
				target.select();//select the file ,and clear selection 
				document.selection.clear();
			} else if (window.opera) {//for opera 
				target.type = "text";
				target.type = "file";
			} else
				target.value = "";//for FF,Chrome,Safari 
			return;
		} else {
			return; //alert("ok");//or you can do nothing here. 
		}

		//����ϴ��ļ��Ĵ�С 
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		var fileSize = 0;
		if (isIE && !target.files) {
			var filePath = target.value;
			var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
			var file = fileSystem.GetFile(filePath);
			fileSize = file.Size;
		} else {
			fileSize = target.files[0].size;
		}
		var size = fileSize / 1024;
		if (size > (500)) {
			alert("�ļ���С���ܳ���500KB");
			if (window.ActiveXObject) {//for IE 
				target.select();//select the file ,and clear selection 
				document.selection.clear();
			} else if (window.opera) {//for opera 
				target.type = "text";
				target.type = "file";
			} else {
				target.value = "";//for FF,Chrome,Safari 
			}
			return;
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<h5>�ļ��ϴ�</h5><hr/>
	<form id="file_upload_id" name="file_upload_name" action="<%=request.getContextPath()%>/fileUploadServlet" method="post" enctype="multipart/form-data">
		<div><input type="file" name="file" onblur="fileChange(this)"/></div>
			<div style="font: 12">�ļ�����ܳ���5MB</div>
			<div style="font: 12">�ļ���ʽ�����ǣ�JPG,GIF,JPEG,PNG</div>
		<div><input type="submit" value="�ϴ�"/></div>
		<font color="red">${requestScope['upload.message'] }</font>
	</form>
</body>
</html>