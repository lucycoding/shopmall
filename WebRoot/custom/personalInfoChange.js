//��֤�����ʽ
	function checkMail(){
		var email = document.getElementById("email");
		var patrn=/((\w)|[-]|[.])+@(((\w)|[-])+[.])+[a-z]{2,4}$/;
		var checkMail = document.getElementById("checkMail");
		if(!patrn.exec(email.value)){
			checkMail.style.color="red";
			checkMail.innerHTML="�����ʽ����!";
			return false;
		}else{
			checkMail.style.color="green";
			checkMail.innerHTML="��";
			return true;
		}
	}
	//У����������,��������λ���֣��ҵ�һλ����Ϊ0
	function isPostalCode()
	{
	var postcode = document.getElementById("postcode");
	var remindPostCode = document.getElementById("remindPostCode");
	var patrn=/^[1-9]{1}(\d){5}$/;
	if (!patrn.exec(postcode.value)){
		remindPostCode.style.color="red";
		remindPostCode.innerHTML="�ʱ��ʽ����";
		return false;
	}else{
		remindPostCode.style.color="green";
		remindPostCode.innerHTML="��";
		return true
	}
	}
	//У��̶��绰����
	function checkPhone(){
		var phone = document.getElementById("phone");
		var checkPhone = document.getElementById("checkPhone");
		var patrn=/^[+]{0,1}\d{3,5}-?\d{5,9}$/;
		if (!patrn.exec(phone.value)){
			checkPhone.style.color="red";
			checkPhone.innerHTML="�绰��ʽ����";
			return false;
		}else{
			checkPhone.style.color="green";
			checkPhone.innerHTML="��";
			return true;
		}
	}
	//У���ƶ��绰����
	function checkMPhone(){
		var phone = document.getElementById("mphone");
		var checkMphone = document.getElementById("checkMphone");
		var patrn=/^1[356]\d{9}|01[356]\d{9}$/;
		if (!patrn.exec(phone.value)){
			checkMphone.style.color="red";
			checkMphone.innerHTML="�ֻ���ʽ����";
			return false;
		}else{
			checkMphone.style.color="green";
			checkMphone.innerHTML="��";
			return true;
		}
	}
	//������������ʾ
	function clearMail(){
		var checkMail = document.getElementById("checkMail");
		checkMail.style.color="black";
		checkMail.innerHTML="";
	}
	//����������������ʾ
	function clearPostR(){
		var remindPostCode = document.getElementById("remindPostCode");
		remindPostCode.innerHTML="";
	}
	//����̶��绰������ʾ
	function clearPhoneR(){
		var checkPhone = document.getElementById("checkPhone");
		checkPhone.innerHTML="";
	}
	function clearMphoneR(){
		var checkMphone = document.getElementById("checkMphone");
		checkMphone.innerHTML="";
	}
	//ˢ����֤��
	function refreshCode(){
		var safeCode = document.getElementById("safeCode");
		safeCode.src = "code";
		location.reload();
	}
	
	//�����֤���Ƿ���ȷ
	function checkCode(){
		var code = document.getElementById("code");
		var codeR = document.getElementById("codeR");
		if(code.value != null && code.value !=""){
			if(window.XMLHttpRequest){
				req = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			//���ûص�����
			req.onreadystatechange = callbackForCode;
			var url = "checkRandomCode?code="+code.value;
			req.open("get",url,true);
			req.send(null);
			return true;
		}else{
			codeR.style.color="red";
			codeR.innerHTML="��������֤��";
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
			if(code[0].getElementsByTagName("message")[0].firstChild.data=="correct"){//��֤��������ȷ
				codeR.style.color="green";
				codeR.innerHTML="��";
			}else{
				codeR.style.color="red";
				codeR.innerHTML="�������";
			}
		}
	}
	
	function checkForm(){
		if(checkMail() && isPostalCode() && checkPhone() && checkMPhone() && checkCode()){
			document.infoform.submit();		
		}else{
			if(!checkCode()){
				alert("δ������֤��!");
			}else{
				alert("�뽫������д����!");
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