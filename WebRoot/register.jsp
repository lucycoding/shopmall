<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>用户注册</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
 
  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js"></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>
  
  <script src="custom/register.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">用户注册</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_12">
			<form class="registed" name="register_form" action="register" method="post" style="border-bottom-color: #ffffff">
				<div style="margin-left: 15%">			
				<div class="email">
					<strong>账号:　　</strong>
					<input type="text" id="name" name="name" onblur="checkName()" onfocus="clearRN()"/>
					<span id="checkName"><font color="#C3293A">*</font>由英文字母、数字或下划线(6-16)字符组成,且不能以数字开头</span>
					<br/><button style="margin-left: 65px" type="button" id="checkNameExist" onclick="checkNE()">检查用户名是否存在</button>
				</div><!-- .email -->
							
				<div class="password">
					<strong>密码:　　</strong>
					<input type="password" id="password1" name="password" onfocus="clearPwd()" onblur="checkPassword()" />
					<span id="pwdRemind"><font color="#C3293A">*</font>由英文字母和数字(6-16)字符组成</span>
				</div><!-- .password -->
				
				<div class="password">
					<strong>确认密码:</strong>
					<input type="password" id="password2" name="password" onblur="checkPwd()" />
					<span id="checkPwd"><font color="#C3293A">*</font>由英文字母和数字(6-16)字符组成</span>
				</div><!-- .password -->
				
				<div class="email">
					<strong>邮箱:　　</strong>
					<input type="email" id="email" name="email" onblur="checkMail()" onfocus="clearMail()" />
					<span id="checkMail"><font color="#C3293A">*</font>请输入正确的邮箱地址，如:example@163.com</span>
				</div><!-- .email -->
				
				<div class="email">
					<strong>真名:　　</strong>
					<input type="text" id="trueName" name="trueName" />
				</div><!-- .email -->
				
				<div class="email">
					<strong>密保问题:</strong>
					<select id="question" name="question" style="width: 265px;">
                    	<option value="empty">--请选择提示问题--</option>
                    	<option value="你最爱的人的名字叫什么">你最爱的人的名字叫什么</option>
                    	<option value="你喜欢的业余爱好是什么">你喜欢的业余爱好是什么</option>
                    	<option value="你妈妈的生日是什么时候">你妈妈的生日是什么时候</option>
                    </select>
				</div><!-- .email -->
				
				<div class="email">
					<strong>密保答案:</strong>
					<input type="text" id="answer" name="answer" />
				</div><!-- .email -->
				
				<div class="email">
					<strong>验证码:　</strong>
					<input type="text" id="code" name="code"  style="width: 50px;" onblur="checkCode()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="code" id="safeCode"/>&nbsp;<a href="javascript:;" onclick="refreshCode()">换一张</a>
					<span id="codeR"></span>
				</div><!-- .email -->
				
				<div style="margin-left: 65px"><input type="checkbox" id="terms" name="terms" onclick="enable()" />我已阅读并同意网站的 <a href="###">使用条件及隐私声明 </a>。</div>
				
				</div>
			</form><!-- .registed -->
				<div class="submit" style="border: 1px solid #E0E0E0;border-top-color: #ffffff">		
					<div style="margin-left: 420px;">						
						<button class="account" onclick="checkAll()" style="width: 80px">注册</button><br/>
					</div>
				</div><!-- .submit -->
         </div><!-- .grid_6 -->
       </div><!-- #content -->
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
<%@include file="footer.jsp" %>
 
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>