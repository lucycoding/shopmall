
$(document).ready(function() {
		$("select").selectBox();
	});

$(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })

//�������,ֻ����Ӣ����ĸ���������
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
