package com.mall.servlet;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mall.common.MD5Util;
import com.mall.model.Model;


public class UpdatePassword extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String password = request.getParameter("password");
		password = MD5Util.string2MD5(password);
		String newPassword1 = request.getParameter("newPassword1");
		String newPassword2= request.getParameter("newPassword2");
		
		   HttpSession session =   request.getSession();
		String name = (String)session.getAttribute("name");
	       ServletContext context = session.getServletContext(); 
	       Model model = new Model();//和登录差不多，主要判断旧密码是否正确
	       Boolean fly = model.loggin(name, password);
		
		    	if(fly){//旧密码正确
	    			if(newPassword1 == null || "".equals(newPassword1)){
	    				request.setAttribute("message", "<script>alert('新密码不能为空!')</script>");
						request.getRequestDispatcher("personalPwdChange.jsp").forward(request, response);
	    			}else{
			    		if(!newPassword1.equals(newPassword2)){
			    			request.setAttribute("message", "<script>alert('两次密码输入不一致!')</script>");
							request.getRequestDispatcher("personalPwdChange.jsp").forward(request, response);
			    		}else{
			    			newPassword1 = MD5Util.string2MD5(newPassword1);
			    			Boolean bo = model.updatePassword(name, newPassword1);
			    			if(bo){
			    				request.setAttribute("message","<script>alert('密码修改成功!');</script>");
								request.getRequestDispatcher("personalInfo.jsp").forward(request, response);
			    			}
			    	   }
	    			}
			    }else{
			    	request.setAttribute("message","<script>alert('原密码错误!')</script>");
			    	request.getRequestDispatcher("personalPwdChange.jsp").forward(request, response);
			    }
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	        this.doGet(request, response);
	}

}
