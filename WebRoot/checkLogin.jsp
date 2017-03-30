<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String name=(String)session.getAttribute("name"); 
	if(name == null || "".equals(name)){
		request.setAttribute("pleseLoggin","<script>alert('请先登录！')</script>");
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}
%>