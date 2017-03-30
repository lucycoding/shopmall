$(document).ready(function() {
		$("select").selectBox();
	});

$(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })

//必须同意协议后才可注册
	function enable(){
		var terms = document.getElementById("terms");
		var register = document.getElementById("register");
		if(terms.checked){
			register.disabled=false;
		}else{
			register.disabled=true;
		}
	}
	//检查用户名是否合法,只能由英文字母、数字和下划线组成，且开头不能为数字
	function checkName(){
		var name = document.getElementById("name");
		//var pic = document.getElementById("pic");
		var checkName = document.getElementById("checkName");
		var patrn=/^[a-zA-Z_]{1}\w{5,16}$/; 
		if (!patrn.exec(name.value)){
			 checkName.style.color="red";
			 checkName.innerHTML="用户名输入有误!";
			 return false;
		}else{	
			 checkName.style.color="green";
			 checkName.innerHTML="√ 输入正确";
			 return true;
		}
	}
	//检查用户名是否存在
	var req;
	var name_IsExist;
	function checkNE(){
		var name = document.getElementById("name");
		if(checkName()){
			if(window.XMLHttpRequest){
				req = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			//设置回调函数
			req.onreadystatechange = callbackForName;
			var url = "checkNameExist?name="+name.value;
			req.open("get",url,true);
			req.send(null);
			return true;
		}else{
			return false;
		}
		
	}
	function callbackForName(){
		var state = req.readyState;
		if(state==4){
			var doms = req.responseXML;
			var user = doms.getElementsByTagName("user");
			var checkName = document.getElementById("checkName");
			var name = user[0].getElementsByTagName("name")[0].firstChild.data;
			if(name == "用户名已存在"){//用户名已经存在
				name_IsExist = true;
				checkName.style.color = "red";
				checkName.innerHTML = name;
			}else{
				name_IsExist = false;
				checkName.innerHTML = name;
			}
		}
	}
	//检查密码,只能由6到15位的英文字母和数字组成
	function checkPassword(){
		var password1 = document.getElementById("password1");
		var pwdRemind = document.getElementById("pwdRemind");
		var patrn=/^[a-z,A-Z,0-9]{6,15}$/;
		if (!patrn.exec(password1.value)){
			pwdRemind.style.color="red";
			pwdRemind.innerHTML="密码格式输入有误!";
			return false;
		}else{
			pwdRemind.style.color="green";
			pwdRemind.innerHTML="√ 输入正确";
			return true;
		}
	}
	//确认密码
	function checkPwd(){
		var password1 = document.getElementById("password1");
		var password2 = document.getElementById("password2");
		var checkPwd = document.getElementById("checkPwd");
		if(password1.value!=password2.value){
			checkPwd.style.color="red";
			checkPwd.innerHTML="两次密码输入不一致!";
			return false;
		}else{
			checkPwd.style.color="green";
			checkPwd.innerHTML="两次密码输入一致!";
			return true;
		}
	}
	//验证邮箱格式
	function checkMail(){
		var email = document.getElementById("email");
		var patrn=/((\w)|[-]|[.])+@(((\w)|[-])+[.])+[a-z]{2,4}$/;
		var checkMail = document.getElementById("checkMail");
		if(!patrn.exec(email.value)){
			checkMail.style.color="red";
			checkMail.innerHTML="邮箱格式输入有误!";
			return false;
		}else{
			checkMail.style.color="green";
			checkMail.innerHTML="√ 邮箱输入正确!";
			return true;
		}
	}
	//检查验证码是否正确
	function checkCode(){
		var code = document.getElementById("code");
		var codeR = document.getElementById("codeR");
		if(code.value != null){
			if(window.XMLHttpRequest){
				req = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			//设置回调函数
			req.onreadystatechange = callbackForCode;
			var url = "checkRandomCode?code="+code.value;
			req.open("get",url,true);
			req.send(null);
			return true;
		}else{
			codeR.style.color="red";
			codeR.innerHTML="请输入验证码";
			return false;
		}
		
	}
	function callbackForCode(){
		var state = req.readyState;
		var codeR = document.getElementById("codeR");
		if(state==4){
			var doms = req.responseXML;
			var code = doms.getElementsByTagName("code");
			var message = code[0].getElementsByTagName("message")[0].firstChild.data;
			if(code[0].getElementsByTagName("message")[0].firstChild.data=="correct"){//验证码输入正确
				codeR.style.color="green";
				codeR.innerHTML="√ 输入正确";
			}else{
				codeR.style.color="red";
				codeR.innerHTML="输入错误";
			}
		}
	}
	//必须所有信息填写正确才能成功提交信息
	function checkAll(){
		if(!name_IsExist && checkPwd() && checkPassword() && checkNE() && checkName() && checkMail() && checkCode()){
			document.register_form.submit();
		}else{
			alert("请正确填写资料!!");
			return;
		}
	}
	//清楚用户名错误提示
	function clearRN(){
		var checkName = document.getElementById("checkName");
		checkName.style.color="black";
		checkName.innerHTML="英文字母或下划线(6-15)字符组成";
	}
	//清楚密码验证错误提示
	function clearPwd(){
		var checkPwd = document.getElementById("checkPwd");
		var pwdRemind = document.getElementById("pwdRemind");
		checkPwd.style.color="black";
		checkPwd.innerHTML="由英文字母和数字(6-15)字符组成";
		pwdRemind.innerHTML="";
	}
	//清除邮箱错误提示
	function clearMail(){
		var checkMail = document.getElementById("checkMail");
		checkMail.style.color="black";
		checkMail.innerHTML="请输入正确的邮箱地址";
	}
	//刷新验证码
	function refreshCode(){
		var safeCode = document.getElementById("safeCode");
		safeCode.src = "code";
		location.reload();
	}