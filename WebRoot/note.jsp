<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>商城论坛</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
 
  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js"></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>

  <script>
	$(document).ready(function() {
		$("select").selectBox();
	});
  </script>
  <script>
       $(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
       })
       
  </script> 
</head>
<body>
<%@include file="header.jsp" %>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<center><h1 class="page_title" style="color: #0093A4;font-weight: bold;">商城论坛</h1</b></center>
		</div><!-- .grid_12 -->
		
		<div class="grid_12">
		
		<c:choose>
			<c:when test="${empty page.pageList}">
				<h1>
					<font color="red">${NoMessageException}</font>
				</h1>
			</c:when>
			<c:otherwise>
				<c:forEach var="note" items="${page.pageList}">
					<article class="post">
						<h2 class="title_article">${note.title}</h2>
						<div class="content_article">
							<p>${note.content}</p>
						</div><!-- .content_article -->
						<div class="footer_article">
							<span>时间：${note.ly_time}</span>  |  <span>用户：${note.author }</span>
						</div>
					</article>
				</c:forEach>
			<div>帖子总条数：${page.totalNum}条 </div>
			<div class="pagination">
			     <ul>
					<pg:pager items="${page.totalNum}" url="pageNoteServlet" maxPageItems="4" maxIndexPages="5">
						<pg:first>
							<li><a href="${pageUrl}">首页</a></li>
						</pg:first>
						<pg:prev>
							<li><a href="${pageUrl}">上一页</a></li>
						</pg:prev>
						<pg:pages>
							<li><a href="${pageUrl}">${pageNumber}</a></li>
						</pg:pages>
						<pg:next>
							<li><a href="${pageUrl}">下一页</a></li>
						</pg:next>
						<pg:last>
							<li><a href="${pageUrl}">末页</a></li>
						</pg:last>
					</pg:pager> 
			     </ul>
		    </div><!-- .pagination -->			
			</c:otherwise>
		</c:choose>
      <br/><br/>
			<div style="color:#a53d17;">
				<form action="checkLogin_Note" method="post" name="ly_form">
					<div>
		                 <label class="contact"><strong>帖子标题:</strong></label>
		                 <input type="text" name="ly_title"/>
	                </div><br/><br/>
	                <div>
	                     <div>
		                 <label class="contact"><strong>帖子内容:</strong></label>
		                 <textarea rows="5" cols="40" name="ly_content" class="contact_input"></textarea> 
	                   	</div><br/><br/>
	                   	<div style="margin-left: 40%">
                    		<input type="submit" class="register" value="发表帖子" />  
	                   	</div>
	                </div>
	             </form>
			</div><!-- end of messageDiv -->
         </div><!-- .grid_6 -->
       </div><!-- #content -->
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  </section><!-- #main -->
  
  <div class="clear"></div>
    
<%@include file="footer.jsp" %>
 
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
${message }

<%
request.setAttribute("message","");
 %>