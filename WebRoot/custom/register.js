$(document).ready(function() {
		$("select").selectBox();
	});

$(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })

//����ͬ��Э���ſ�ע��
	function enable(){
		var terms = document.getElementById("terms");
		var register = document.getElementById("register");
		if(terms.checked){
			register.disabled=false;
		}else{
			register.disabled=true;
		}
	}
	//����û����Ƿ�Ϸ�,ֻ����Ӣ����ĸ�����ֺ��»�����ɣ��ҿ�ͷ����Ϊ����
	function checkName(){
		var name = document.getElementById("name");
		//var pic = document.getElementById("pic");
		var checkName = document.getElementById("checkName");
		var patrn=/^[a-zA-Z_]{1}\w{5,16}$/; 
		if (!patrn.exec(name.value)){
			 checkName.style.color="red";
			 checkName.innerHTML="�û�����������!";
			 return false;
		}else{	
			 checkName.style.color="green";
			 checkName.innerHTML="�� ������ȷ";
			 return true;
		}
	}
	//����û����Ƿ����
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
			//���ûص�����
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
			if(name == "�û����Ѵ���"){//�û����Ѿ�����
				name_IsExist = true;
				checkName.style.color = "red";
				checkName.innerHTML = name;
			}else{
				name_IsExist = false;
				checkName.innerHTML = name;
			}
		}
	}
	//�������,ֻ����6��15λ��Ӣ����ĸ���������
	function checkPassword(){
		var password1 = document.getElementById("password1");
		var pwdRemind = document.getElementById("pwdRemind");
		var patrn=/^[a-z,A-Z,0-9]{6,15}$/;
		if (!patrn.exec(password1.value)){
			pwdRemind.style.color="red";
			pwdRemind.innerHTML="�����ʽ��������!";
			return false;
		}else{
			pwdRemind.style.color="green";
			pwdRemind.innerHTML="�� ������ȷ";
			return true;
		}
	}
	//ȷ������
	function checkPwd(){
		var password1 = document.getElementById("password1");
		var password2 = document.getElementById("password2");
		var checkPwd = document.getElementById("checkPwd");
		if(password1.value!=password2.value){
			checkPwd.style.color="red";
			checkPwd.innerHTML="�����������벻һ��!";
			return false;
		}else{
			checkPwd.style.color="green";
			checkPwd.innerHTML="������������һ��!";
			return true;
		}
	}
	//��֤�����ʽ
	function checkMail(){
		var email = document.getElementById("email");
		var patrn=/((\w)|[-]|[.])+@(((\w)|[-])+[.])+[a-z]{2,4}$/;
		var checkMail = document.getElementById("checkMail");
		if(!patrn.exec(email.value)){
			checkMail.style.color="red";
			checkMail.innerHTML="�����ʽ��������!";
			return false;
		}else{
			checkMail.style.color="green";
			checkMail.innerHTML="�� ����������ȷ!";
			return true;
		}
	}
	//�����֤���Ƿ���ȷ
	function checkCode(){
		var code = document.getElementById("code");
		var codeR = document.getElementById("codeR");
		if(code.value != null){
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
				codeR.innerHTML="�� ������ȷ";
			}else{
				codeR.style.color="red";
				codeR.innerHTML="�������";
			}
		}
	}
	//����������Ϣ��д��ȷ���ܳɹ��ύ��Ϣ
	function checkAll(){
		if(!name_IsExist && checkPwd() && checkPassword() && checkNE() && checkName() && checkMail() && checkCode()){
			document.register_form.submit();
		}else{
			alert("����ȷ��д����!!");
			return;
		}
	}
	//����û���������ʾ
	function clearRN(){
		var checkName = document.getElementById("checkName");
		checkName.style.color="black";
		checkName.innerHTML="Ӣ����ĸ���»���(6-15)�ַ����";
	}
	//���������֤������ʾ
	function clearPwd(){
		var checkPwd = document.getElementById("checkPwd");
		var pwdRemind = document.getElementById("pwdRemind");
		checkPwd.style.color="black";
		checkPwd.innerHTML="��Ӣ����ĸ������(6-15)�ַ����";
		pwdRemind.innerHTML="";
	}
	//������������ʾ
	function clearMail(){
		var checkMail = document.getElementById("checkMail");
		checkMail.style.color="black";
		checkMail.innerHTML="��������ȷ�������ַ";
	}
	//ˢ����֤��
	function refreshCode(){
		var safeCode = document.getElementById("safeCode");
		safeCode.src = "code";
		location.reload();
	}