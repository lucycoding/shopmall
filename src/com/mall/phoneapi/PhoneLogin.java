package com.mall.phoneapi;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.exception.ErrPwdException;
import com.mall.exception.NameNotFoundException;
import com.mall.model.Model;
import com.mall.po.User;

public class PhoneLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("username");
		String password=request.getParameter("password");
		int status = 0;
		Model model = new Model();
		try {
			User user = model.userLogin(name, password);
			user.setName(name);
//			ServletContext context = this.getServletContext();
//			List nameList = (List) context.getAttribute("nameList");
//			if(!nameList.contains(name)) {
			status = 1;// 返回登录成功1
//			} else {
//				request.getSession().setAttribute("userName", name);
//				request.getSession().setAttribute("user", user);
//				request.setAttribute("loginMessage","<script>alert('该账号已经在其他设备登录！')</script>");
//				request.getRequestDispatcher("login.jsp").forward(request, response);
//			}

		}catch (NameNotFoundException e) {
			//status = 0; // 返回用户名不存在2
		}catch(ErrPwdException e){
			//status = 0; // 返回用户名不存在3
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		String jsonStr = "{\"status\":"+status+",\"token\":\""+new Date().getTime()+"\"}";
		PrintWriter out = null;
		try {
		    out = response.getWriter();
		    out.write(jsonStr);
		    out.flush();
		} catch (IOException e) {
		    e.printStackTrace();
		} finally {
		    if (out != null) {
		        out.close();
		    }
		}
		return;
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		doPost(request, response);
	}
}
