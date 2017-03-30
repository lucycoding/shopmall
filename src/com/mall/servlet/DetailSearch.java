package com.mall.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.exception.NoRelativeGoodsException;
import com.mall.model.Model;
import com.mall.po.Page;

public class DetailSearch extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String superTypeId_str = null;
		String searchMethod = null;
		String content = null;

		superTypeId_str = request.getParameter("superType");
		searchMethod = request.getParameter("searchMethod");
		content = request.getParameter("content");
		//用变量将参数保存
		int superTypeId = Integer.parseInt(superTypeId_str);
		Model model = new Model();
		String str = null;
		str =searchMethod+"="+content;
		if(content!=null){
			request.setAttribute("sendUrl", "detailSearch");
			try{
				Page page = model.doPageByConditons(superTypeId,str);
				request.setAttribute("page", page);
				request.getRequestDispatcher("searchOut.jsp").forward(request, response);
				}catch(NoRelativeGoodsException e){
					request.setAttribute("NoRelativeGoodsException", e.getMessage());
					request.getRequestDispatcher("searchOut.jsp").forward(request, response);
				}
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
