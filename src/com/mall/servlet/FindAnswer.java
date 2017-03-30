package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.po.User;

public class FindAnswer extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
		 User user= (User) request.getSession().getAttribute("findPassUser");
		   String name=(String)user.getAnswer();
	       String answer=request.getParameter("answer");
	       if(name.equals(answer))
	       {
	    	   response.sendRedirect("updatePwd.jsp");
	       }
	       else
	       {
	    	 response.sendRedirect("answerFail.jsp"); 
	       }
	}

}
