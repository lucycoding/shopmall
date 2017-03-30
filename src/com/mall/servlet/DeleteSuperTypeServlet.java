package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mall.model.Model;

public class DeleteSuperTypeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //获得 id集合
		String types_str = request.getParameter("typeIds");
		HttpSession session =request.getSession();
		String[] ids_str = null;
		if(types_str != "") {
			ids_str = types_str.split(",");
		}
		int[] ids = new int[ids_str.length];
		for(int i=0;i<ids_str.length;i++) {
			ids[i] = Integer.parseInt(ids_str[i]);
		}
		Model model = new Model();
		if(model.deleteSuperType(ids)) {
			request.getRequestDispatcher("allowAddSuperServlet").forward(request, response);
		}else{
	    	session.setAttribute("updateSuperTypeMessage","<script>bootbox.alert('删除失败!请先删除分类下所包含的所有商品！');</script>");
			request.getRequestDispatcher("allowAddSuperServlet").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
