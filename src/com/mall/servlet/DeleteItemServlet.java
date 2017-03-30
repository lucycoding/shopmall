package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.vo.Cart;

public class DeleteItemServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int GoodsId = 0;
		String flag ="";
		String str_GoodsId = request.getParameter("GoodsId");
		if(request.getParameter("flag")!=null){
			flag = request.getParameter("flag");
		}
		if(str_GoodsId != null){
			GoodsId = Integer.parseInt(str_GoodsId);
		}
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		cart.deleteItem(GoodsId);
		if(flag.equals("cart")){
			response.sendRedirect("cart.jsp");
		}else{
			response.sendRedirect(request.getHeader("Referer"));
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
