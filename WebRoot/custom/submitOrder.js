
$(document).ready(function() {
		$("select").selectBox();
	});

$(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })

//��֤�ջ�����������Ϊ��
	function checkRN(){
		var recvName = document.getElementById("recvName");
		if(recvName.value==""){
			var remindRN = document.getElementById("remindRN");
			remindRN.style.color="red";
			remindRN.innerHTML="�ջ��˲���Ϊ��";
			return false;
		}else{
			var remindRN = document.getElementById("remindRN");
			remindRN.style.color="green";
			remindRN.innerHTML="�� ������ȷ����";
			return true;
		}
	}
	
	//��֤�ջ��˵�ַ����Ϊ��
	function checkAddr(){
		var address = document.getElementById("address");
		if(address.value==""){
			var remindAddr = document.getElementById("remindAddr");
			remindAddr.style.color="red";
			remindAddr.innerHTML="��ַ����Ϊ�ա�";
			return false;
		}else{
			var remindAddr = document.getElementById("remindAddr");
			remindAddr.style.color="green";
			remindAddr.innerHTML="�� ������ȷ����";
			return true;
		}
	}
	//У����������,��������λ���֣��ҵ�һλ����Ϊ0
	function isPostalCode()
	{
	var postCode = document.getElementById("postcode");
	var remindPostCode = document.getElementById("remindPostCode");
	var patrn=/^[1-9]{1}(\d){5}$/;
	if (!patrn.exec(postCode.value)){
		remindPostCode.style.color="red";
		remindPostCode.innerHTML="�ʱ���������";
		return false;
	}else{
		remindPostCode.style.color="green";
		remindPostCode.innerHTML="�� ������ȷ����";
		return true
	}
	}
	//У���ƶ��绰����
	function checkMPhone(){
		var phone = document.getElementById("mphone");
		var checkMphone = document.getElementById("checkMphone");
		var patrn=/^1[356]\d{9}|01[356]\d{9}$/;
		if (!patrn.exec(phone.value)){
			checkMphone.style.color="red";
			checkMphone.innerHTML="�ֻ���ʽ����ȷ";
			return false;
		}else{
			checkMphone.style.color="green";
			checkMphone.innerHTML="�� ������ȷ";
			return true;
		}
	}
	
	//������Ϣ��ȷ�ſ����ύ
	function checkAll(){
		if(checkRN()&& checkAddr() && isPostalCode() && checkMPhone()){
			document.submitOrder_form.submit();
		}else{
			alert("����ȷ��д�ջ�����Ϣ!!");
			return;
		}
	}