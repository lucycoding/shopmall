<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String name=(String)session.getAttribute("name"); 
	if(name == null || "".equals(name)){
		out.print("<script>alert('会话已过期，请登录!');parent.window.location.href='login.jsp';</script>");
	}
%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>修改用户信息</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
 
  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js"></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>
  
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script src="js/jquery.min.js" ></script>
	
	<script src="custom/personalInfoChange.js" ></script>
</head>
<body style="background: none;">
  <br/><br/>
    <div class="container_12">      
		
		<div class="grid_12 adress">
   		<form action="updateUserInfo" method="post" id="infoform" name="infoform" >
			<div class="grid_5" style="float:left;">
				<br/>
				<span style="font-size: 18px;font-weight: bold;">用&nbsp;户&nbsp;名：</span>
				<input type="text" disabled="disabled" value="${user.name}"><br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">邮　　箱：</span>
				<input type="text" name="email" id="email" value="${user.email}"  onblur="checkMail()" onfocus="clearMail()" /><span id="checkMail"></span><br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">真　　名：</span>
				<input type="text" name="trueName" value="${user.trueName}"  /><br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">性　　别：</span>
				<input type="radio" name="sex" value="男" <c:if test="${user.sex == '男' }">checked="checked"</c:if> />男
                <input type="radio" name="sex" value="女" <c:if test="${user.sex == '女' }">checked="checked"</c:if> />女        <br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">密保问题：</span>
					<select id="question" name="question">
                    	<option value="你最爱的人的名字叫什么" <c:if test="${user.question == '你最爱的人的名字叫什么' }">selected="selected"</c:if>>你最爱的人的名字叫什么</option>
                    	<option value="你喜欢的业余爱好是什么" <c:if test="${user.question == '你喜欢的业余爱好是什么' }">selected="selected"</c:if>>你喜欢的业余爱好是什么</option>
                    	<option value="你妈妈的生日是什么时候" <c:if test="${user.question == '你妈妈的生日是什么时候' }">selected="selected"</c:if>>你妈妈的生日是什么时候</option>
                    </select><br/><br/>
                    
                <br/>
				<span style="font-size: 18px;font-weight: bold;">密保答案：</span>
				<input type="text" name="answer" value="${user.answer}"  /><br/><br/>
			</div>	
			<div class="grid_5" style="float:left;">
				<br/>
				<span style="font-size: 18px;font-weight: bold;">生　日：</span>
				<input name="birthday" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" value="${user.birthday }"></input><br/><br/>
				<br/>
				<span style="font-size: 18px;font-weight: bold;">地　址：</span>
				<input type="text" name="address" value="${user.address}"  /><br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">邮　编：</span>
				<input type="text" id="postcode" name="postcode" value="${user.postcode}"  onblur="isPostalCode()" onfocus="clearPostR()" /><span id="remindPostCode"></span><br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">固　话：</span>
				<input type="text" id="phone" name="phone" onblur="checkPhone()" onfocus="clearPhoneR()" value="${user.phone}" /><span id="checkPhone"></span><br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">手　机：</span>
				<input type="text"  id="mphone" name="mphone" onblur="checkMPhone()" onfocus="clearMphoneR()" value="${user.mphone}" /><span id="checkMphone"></span><br/><br/>
				
				<br/>
				<span style="font-size: 18px;font-weight: bold;">验证码：</span>
				<input type="text" id="code" name="code"  style="width: 50px;" onblur="checkCode()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="code" id="safeCode" />&nbsp;<a href="javascript:;" onclick="refreshCode()">换一张</a>
				<span id="codeR"></span><br/><br/>
			</div>
		</form>	
        </div><!-- .adress -->
        <br/><br/><br/><br/><br/><br/>
			<div style="margin-left: 600px;">						
				<button onclick="checkForm()" style="width: 80px;height: 30px ;background: #59B7C2;border: 0 none;color: white;">修改</button><br/>
			</div>
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  
  <div class="clear"></div>
 
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>