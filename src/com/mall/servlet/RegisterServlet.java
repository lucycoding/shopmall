package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.common.MD5Util;
import com.mall.model.Model;
import com.mall.po.User;


public class RegisterServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取数据乱码处理
		request.setCharacterEncoding("utf-8");
		//获取客户端发送过来的信息
		String name = request.getParameter("name");
		String password=request.getParameter("password");
		password = MD5Util.string2MD5(password);
		String email = request.getParameter("email");
		String trueName=request.getParameter("trueName");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
			User user = new User();
			user.setName(name);
			user.setPassword(password);
			user.setEmail(email);
			user.setTrueName(trueName);
			user.setQuestion(question);
			user.setAnswer(answer);	
			Model model = new Model();
			if(model.addUser(user)){
				//注册成功
				request.setAttribute("pleseLoggin", "<script>alert('注册成功！请登录！')</script>");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}else {
				//注册失败
				request.setAttribute("pleseLoggin", "<script>alert('注册失败！')</script>");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
