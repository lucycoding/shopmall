package com.mall.servlet;

import java.io.IOException;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mall.model.Model;
import com.mall.po.Admin;
import com.mall.po.Goods;
import com.mall.po.SuperType;

public class UpdateSuperTypeServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
		HttpSession session=request.getSession();
		String TypeId = request.getParameter("id");
		Integer superTypeId = Integer.parseInt(TypeId);
		String typeName = new String(request.getParameter("name").getBytes("iso8859-1"));
		 
		SuperType superType = new SuperType();
		superType.setSuperTypeId(superTypeId);
		superType.setTypeName(typeName);

	   
		Model model= new Model();
	    if(model.updateSuperType(superType)){//修改成功
	    	session.setAttribute("updateSuperTypeMessage","<script>alert('修改成功!');</script>");
	    	request.getRequestDispatcher("allowAddSuperServlet").forward(request, response);
	    }else{//修改失败
	    	session.setAttribute("updateSuperTypeMessage","<script>alert('修改失败!');</script>");
	    	request.getRequestDispatcher("allowAddSuperServlet").forward(request, response);
	    	
	    }
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		this.doGet(request, response);
		}
	}
