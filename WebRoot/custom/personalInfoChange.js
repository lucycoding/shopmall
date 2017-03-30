//验证邮箱格式
	function checkMail(){
		var email = document.getElementById("email");
		var patrn=/((\w)|[-]|[.])+@(((\w)|[-])+[.])+[a-z]{2,4}$/;
		var checkMail = document.getElementById("checkMail");
		if(!patrn.exec(email.value)){
			checkMail.style.color="red";
			checkMail.innerHTML="邮箱格式不对!";
			return false;
		}else{
			checkMail.style.color="green";
			checkMail.innerHTML="√";
			return true;
		}
	}
	//校验邮政编码,必须是六位数字，且第一位不能为0
	function isPostalCode()
	{
	var postcode = document.getElementById("postcode");
	var remindPostCode = document.getElementById("remindPostCode");
	var patrn=/^[1-9]{1}(\d){5}$/;
	if (!patrn.exec(postcode.value)){
		remindPostCode.style.color="red";
		remindPostCode.innerHTML="邮编格式不对";
		return false;
	}else{
		remindPostCode.style.color="green";
		remindPostCode.innerHTML="√";
		return true
	}
	}
	//校验固定电话号码
	function checkPhone(){
		var phone = document.getElementById("phone");
		var checkPhone = document.getElementById("checkPhone");
		var patrn=/^[+]{0,1}\d{3,5}-?\d{5,9}$/;
		if (!patrn.exec(phone.value)){
			checkPhone.style.color="red";
			checkPhone.innerHTML="电话格式不对";
			return false;
		}else{
			checkPhone.style.color="green";
			checkPhone.innerHTML="√";
			return true;
		}
	}
	//校验移动电话号码
	function checkMPhone(){
		var phone = document.getElementById("mphone");
		var checkMphone = document.getElementById("checkMphone");
		var patrn=/^1[356]\d{9}|01[356]\d{9}$/;
		if (!patrn.exec(phone.value)){
			checkMphone.style.color="red";
			checkMphone.innerHTML="手机格式不对";
			return false;
		}else{
			checkMphone.style.color="green";
			checkMphone.innerHTML="√";
			return true;
		}
	}
	//清除邮箱错误提示
	function clearMail(){
		var checkMail = document.getElementById("checkMail");
		checkMail.style.color="black";
		checkMail.innerHTML="";
	}
	//清除邮政编码错误提示
	function clearPostR(){
		var remindPostCode = document.getElementById("remindPostCode");
		remindPostCode.innerHTML="";
	}
	//清除固定电话错误提示
	function clearPhoneR(){
		var checkPhone = document.getElementById("checkPhone");
		checkPhone.innerHTML="";
	}
	function clearMphoneR(){
		var checkMphone = document.getElementById("checkMphone");
		checkMphone.innerHTML="";
	}
	//刷新验证码
	function refreshCode(){
		var safeCode = document.getElementById("safeCode");
		safeCode.src = "code";
		location.reload();
	}
	
	//检查验证码是否正确
	function checkCode(){
		var code = document.getElementById("code");
		var codeR = document.getElementById("codeR");
		if(code.value != null && code.value !=""){
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
				codeR.innerHTML="√";
			}else{
				codeR.style.color="red";
				codeR.innerHTML="输入错误";
			}
		}
	}
	
	function checkForm(){
		if(checkMail() && isPostalCode() && checkPhone() && checkMPhone() && checkCode()){
			document.infoform.submit();		
		}else{
			if(!checkCode()){
				alert("未输入验证码!");
			}else{
				alert("请将资料填写完整!");
			}
		}
	}

function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
}