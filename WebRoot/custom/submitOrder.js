
$(document).ready(function() {
		$("select").selectBox();
	});

$(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })

//验证收货人姓名不能为空
	function checkRN(){
		var recvName = document.getElementById("recvName");
		if(recvName.value==""){
			var remindRN = document.getElementById("remindRN");
			remindRN.style.color="red";
			remindRN.innerHTML="收货人不能为空";
			return false;
		}else{
			var remindRN = document.getElementById("remindRN");
			remindRN.style.color="green";
			remindRN.innerHTML="√ 输入正确　　";
			return true;
		}
	}
	
	//验证收货人地址不能为空
	function checkAddr(){
		var address = document.getElementById("address");
		if(address.value==""){
			var remindAddr = document.getElementById("remindAddr");
			remindAddr.style.color="red";
			remindAddr.innerHTML="地址不能为空　";
			return false;
		}else{
			var remindAddr = document.getElementById("remindAddr");
			remindAddr.style.color="green";
			remindAddr.innerHTML="√ 输入正确　　";
			return true;
		}
	}
	//校验邮政编码,必须是六位数字，且第一位不能为0
	function isPostalCode()
	{
	var postCode = document.getElementById("postcode");
	var remindPostCode = document.getElementById("remindPostCode");
	var patrn=/^[1-9]{1}(\d){5}$/;
	if (!patrn.exec(postCode.value)){
		remindPostCode.style.color="red";
		remindPostCode.innerHTML="邮编输入有误　";
		return false;
	}else{
		remindPostCode.style.color="green";
		remindPostCode.innerHTML="√ 输入正确　　";
		return true
	}
	}
	//校验移动电话号码
	function checkMPhone(){
		var phone = document.getElementById("mphone");
		var checkMphone = document.getElementById("checkMphone");
		var patrn=/^1[356]\d{9}|01[356]\d{9}$/;
		if (!patrn.exec(phone.value)){
			checkMphone.style.color="red";
			checkMphone.innerHTML="手机格式不正确";
			return false;
		}else{
			checkMphone.style.color="green";
			checkMphone.innerHTML="√ 输入正确";
			return true;
		}
	}
	
	//所有信息正确才可以提交
	function checkAll(){
		if(checkRN()&& checkAddr() && isPostalCode() && checkMPhone()){
			document.submitOrder_form.submit();
		}else{
			alert("请正确填写收货人信息!!");
			return;
		}
	}