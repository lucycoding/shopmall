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
    
    <title>�û�����</title>
    <link rel="shortcut icon" href="favicon.ico">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<%@ include file="../inc/cssall.jsp" %>
	<link href="../cssall/datetimepicker.css" rel="stylesheet">
	<style type="text/css">
	input[type="checkbox"] { -webkit-appearance: checkbox;}
	</style>
  </head>
  
  <body>
				<div>
					<ul class="breadcrumb">
						<li><a>�û�����</a>
					</ul>
				</div>

				<div class="row-fluid">
			   	   <div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i>&nbsp;�û�����    ������ �û�<font style="text-decoration: underline;color: red">${user.name }</font>����ϸ��Ϣ</h2>
												
					</div>
					<br/>
					<div style="display: inline-block;padding-left: 5%;">
		    			<p><span><b>�û�id��</b>${user.id}</span></p>
		    			<p><span><b>�û�����</b>${user.name}</span></p>
		    			<p><span><b>���룺</b>******</span></p>
		    			<p><span><b>���䣺</b>${user.email}</span></p>
		    			<p><span><b>������</b>${user.trueName}</span></p>
		    			<p><span><b>�Ա�</b>${user.sex}</span></p>
		    			<p><span><b>���գ�</b>${user.birthday}</span></p>
		    			</div>
		    			<div style="display: inline-block;padding-left: 20%;">
		    			<p><span><b>��ַ��</b>${user.address}</span></p>
		    			<p><span><b>�ʱࣺ</b>${user.postcode}</span></p>
		    			<p><span><b>�̻���</b>${user.phone}</span></p>
		    			<p><span><b>�ֻ���</b>${user.mphone}</span></p>
		    			<p><span><b>��ȫ���⣺</b>${user.question}</span></p>
		    			<p><span><b>�𰸣�</b>${user.answer}</span></p>
		    			<p><span><a class="btn btn-primary" href="getUserPagerServlet"><i class="icon-repeat icon-white"></i>����</a></span></p>
		    		</div>
						<br/><br/>
					
			    </div>  <!-- row-fluid -->				
			</div>
			<!--/#content.span9-->
  		<%@ include file="../inc/jsall.jsp" %>
  </body>
</html>
