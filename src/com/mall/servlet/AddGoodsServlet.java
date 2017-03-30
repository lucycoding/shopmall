package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.Goods;

public class AddGoodsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("gbk");
		String filePath=(String)request.getSession().getAttribute("filePath");
		if(filePath == null || filePath.equals("")){
			request.setAttribute("imgErr", "请先上传商品图片！");
			request.getRequestDispatcher("Admin/pages/addGoods.jsp").forward(request, response);
		}
		else{
			String str_superTypeId = request.getParameter("superTypeId");
			String GoodsName = request.getParameter("GoodsName");
			String ISBN = request.getParameter("ISBN");
			String introduce = request.getParameter("introduce");
			String pages_str = request.getParameter("pages"); 
			String publisher = request.getParameter("publisher");
			String author = request.getParameter("author");
			String str_price = request.getParameter("price");
			String str_nowPrice = request.getParameter("nowPrice");
			String str_GoodsNum = request.getParameter("GoodsNum");        
			String str_newGoods = request.getParameter("newGoods");      
			String str_saleGoods = request.getParameter("saleGoods");
			String str_hostGoods = request.getParameter("hotGoods");
			String str_specialGoods = request.getParameter("specialGoods");
			int superTypeId = Integer.parseInt(str_superTypeId);
			float price = Float.parseFloat(str_price);
			float nowPrice = Float.parseFloat(str_nowPrice);
			int GoodsNum = Integer.parseInt(str_GoodsNum);
			int newGoods = 0;
			int saleGoods = 0;
			int hostGoods = 0;
			int specialGoods = 0;
			
			if(str_newGoods != null)
				newGoods = Integer.parseInt(str_newGoods);
			if(str_saleGoods != null)
				saleGoods = Integer.parseInt(str_saleGoods);
			if(str_hostGoods != null)
				hostGoods = Integer.parseInt(str_hostGoods);
			if(str_specialGoods != null)
				specialGoods = Integer.parseInt(str_specialGoods);
			
			Model model = new Model();
			Goods Goods = new Goods();
			Goods.setSuperTypeId(superTypeId);
			Goods.setGoodsName(GoodsName);
			Goods.setISBN(ISBN);
			Goods.setIntroduce(introduce);
			Goods.setProduceDate(pages_str);
			Goods.setPublisher(publisher);
			Goods.setAuthor(author);
			Goods.setPrice(price);
			Goods.setNowPrice(nowPrice);
			Goods.setPicture(filePath);
			
			Goods.setNewGoods(newGoods);
			Goods.setSaleGoods(saleGoods);
			Goods.setHostGoods(hostGoods);
			Goods.setSpecialGoods(specialGoods);
			Goods.setGoodsNum(GoodsNum);
			if(model.addGoods(Goods)) {
				request.setAttribute("message", "<script>bootbox.alert('添加成功!');location.href='getGoodsPagerServlet';</script>");
			} else {
				request.setAttribute("message", "<script>bootbox.alert('添加失败!');</script>");
			}
			request.getRequestDispatcher("Admin/pages/addGoods.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
