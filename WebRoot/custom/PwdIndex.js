$(document).ready(function() {
		$("select").selectBox();
	});
$(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })

//����û����Ƿ�Ϸ�,ֻ����Ӣ����ĸ�����ֺ��»�����ɣ��ҿ�ͷ����Ϊ����
	function checkName(){
		var name = document.getElementById("name");
		var checkName = document.getElementById("checkName");
		var patrn=/^[a-zA-Z_]{1}\w{5,16}$/; 
		if (!patrn.exec(name.value)){
			 checkName.style.color="red";
			 checkName.innerHTML="�û�����������!";
			 return false;
		}else{	
			 checkName.style.color="green";
			 checkName.innerHTML="�� ������ȷ";
			 document.f1.submit();
			 return true;
		}
	}
			//����û����Ƿ����
	var req;
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
			if(user[0].getElementsByTagName("name")[0].firstChild.data=="exist"){//�û����Ѿ�����
				window.open("findAnswer.jsp","fail","width=180,height=120,left=200,top=180");
			}else{
				window.open("notExist.jsp","success","width=180,height=120,left=200,top=180");
			}
		}
	}