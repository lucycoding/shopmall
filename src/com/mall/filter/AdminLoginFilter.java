package com.mall.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminLoginFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
		HttpServletRequest httpreq = (HttpServletRequest)request;
		HttpServletResponse httpresp = (HttpServletResponse)response;
		String admin = (String) httpreq.getSession().getAttribute("adminLoginNameRet");
		if(httpreq.getSession().getAttribute("admin") == null) {
			String message="<script>parent.location.href='Admin/login/adminLogin.jsp'</script>";
			request.setAttribute("message", message);
			request.getRequestDispatcher("Admin/pages/adminLoginError.jsp").forward(request, response);
		} else {
			chain.doFilter(httpreq, httpresp);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
