
	$(document).ready(function() {
		$("select").selectBox();
	});


       $(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })

function getSM(){
  		var searchMethod = document.getElementById("searchMethod").value;
  		if(searchMethod=="noChoice"){
  			alert("��ѡ���ѯ��ʽ");
  		}
}

function checkDetails(){
		var superType = document.getElementById("superType");
		var searchMethod = document.getElementById("searchMethod");
		var content = document.getElementById("key");
		if(superType.value != "noChoice" && searchMethod.value != "noChoice" && content.value!=null && content.value!=""){
				document.detailSearch.submit();
		}else {
			alert(superType.value+" "+searchMethod.value+" "+content.value+"��ѡ�����Ĳ�ѯ�������ѯ�������Ϊ�գ�");
		}
}