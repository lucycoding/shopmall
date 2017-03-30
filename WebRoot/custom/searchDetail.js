
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
  			alert("请选择查询方式");
  		}
}

function checkDetails(){
		var superType = document.getElementById("superType");
		var searchMethod = document.getElementById("searchMethod");
		var content = document.getElementById("key");
		if(superType.value != "noChoice" && searchMethod.value != "noChoice" && content.value!=null && content.value!=""){
				document.detailSearch.submit();
		}else {
			alert(superType.value+" "+searchMethod.value+" "+content.value+"请选择好你的查询条件或查询输入框不能为空！");
		}
}