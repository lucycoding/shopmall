package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mall.common.MD5Util;
import com.mall.model.Model;
import com.mall.po.Admin;

public class UpdateAdminServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");	  
		Admin admin= new Admin(); 
		System.out.println(request.getParameter("adminId")+"*******");
		int adminId= Integer.parseInt(request.getParameter("adminId"));
		String adminName=request.getParameter("adminName");
		int adminTypeId=Integer.parseInt(request.getParameter("adminTypeId"));
		String loginName=request.getParameter("loginName");
		String loginPwd=request.getParameter("loginPwd");
		loginPwd = MD5Util.string2MD5(loginPwd);
		admin.setId(adminId);
		admin.setAdminName(adminName);
		admin.setAdminType(adminTypeId);
		admin.setLoginName(loginName);
		admin.setLoginPwd(loginPwd);
		Model model= new Model();
	    if(model.updateAdmin(admin)){//修改成功
	    	request.setAttribute("message","<script>alert('修改成功!')</script>");
	    	request.getRequestDispatcher("getAdminPagerServlet").forward(request, response);
	    	
	    }else{//修改失败
	    	request.setAttribute("message","<script>alert('修改失败!')</script>");
	    	request.getRequestDispatcher("getAdminPagerServlet").forward(request, response);
	    	
	    }
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		this.doGet(request, response);
		}
	}
