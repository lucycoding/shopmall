package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.InformPager;

public class GetInformPagerServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String pageOffset_str = request.getParameter("pager.offset");
			String pageSize_str = request.getParameter("pageSize");
			int pageOffset = 0;
			int pageSize = 6;
			int pagecurrentPageNo = 0;
			if(pageOffset_str != null && pageSize_str != null) {
				pageOffset = Integer.parseInt(pageOffset_str);
				pageSize = Integer.parseInt(pageSize_str);
			}
			Model model = new Model();
			InformPager informPager = model.getInformPager(pageOffset, pageSize);
			if(informPager.getImformMap().size() == 0 && pageOffset != 0) {
				pageOffset -= pageSize;
				informPager = model.getInformPager(pageOffset, pageSize);
			}
			if(pageOffset%pageSize == 0 || pageOffset/pageSize >0) {
				pagecurrentPageNo = pageOffset/pageSize + 1;
			}
			informPager.setPageOffset(pageOffset);
			informPager.setPageSize(pageSize);
			informPager.setPagecurrentPageNo(pagecurrentPageNo);
			request.setAttribute("informPager", informPager);
			request.setAttribute("informList", informPager.getImformMap().values());
			request.getRequestDispatcher("Admin/pages/manageInform.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
