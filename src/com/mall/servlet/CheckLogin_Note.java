package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.po.User;

public class CheckLogin_Note extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//乱码处理
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	
		User user = (User)request.getSession().getAttribute("user");
		if(user!= null){//已经登录，可以留言了
			String title = request.getParameter("ly_title");
			String content=request.getParameter("ly_content");
			if("".equals(title) || title == null || "".equals(content) || content == null){
				String message = "<script>alert('标题或内容不能为空！')</script>";
				request.setAttribute("message", message);
				request.getRequestDispatcher("pageNoteServlet").forward(request, response);
			}else{
				request.setAttribute("title", title);
				request.setAttribute("content", content);
				request.setAttribute("author", user.getName());
				request.getRequestDispatcher("addNoteServlet").forward(request, response);
			}
		}else {//还没有登录，跳转到登录页面
			String message = "<script>alert('请先登录，再发表帖子！')</script>";
			request.setAttribute("message", message);
			request.getRequestDispatcher("pageNoteServlet").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
