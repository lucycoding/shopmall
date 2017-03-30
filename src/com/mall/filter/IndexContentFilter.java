package com.mall.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mall.model.Model;


public class IndexContentFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
		HttpServletRequest httpreq = (HttpServletRequest)request;
		HttpServletResponse httpresp = (HttpServletResponse)response;
		HttpSession session = httpreq.getSession();
		Model model = new Model();
		List hostList = model.showGoods(1,1);
		
		if(hostList.size() > 12) {
			//最多显示10个商品，热卖
			while(hostList.size()>12) {
				hostList.remove(hostList.size()-1);
			}
		}
		if(session.getAttribute("hostList") == null){
			session.setAttribute("hostList",hostList);
		}
		
		List newList = model.showGoods(2, 1);
		//最多显示10个商品，新品
		while(newList.size()>12) {
			newList.remove(newList.size()-1);
		}
		if(session.getAttribute("newList") == null){
			session.setAttribute("newList", newList);
		}
		
		List specialList = model.showGoods(4, 1);
		//最多显示10个商品，推荐
		while(specialList.size()>12) {
			specialList.remove(specialList.size()-1);
		}
		if(session.getAttribute("specialList") == null){
			session.setAttribute("specialList", specialList);
		}
		
		//特价
		List saleList=model.showGoods(3, 1);
		//最多显示10个商品，特价
		while(saleList.size()>12) {
			saleList.remove(saleList.size()-1);
		}
		if(session.getAttribute("saleList") == null){
			session.setAttribute("saleList", saleList);
		}
		
		//公告
		List informList = model.getAllInform();
		if(session.getAttribute("informList") == null){	
			session.setAttribute("informList", informList);
		}
			
		//商品分类
		List supertypes = model.showAllSuperType();
		//分类
		if(session.getAttribute("clsList") == null){	
			session.setAttribute("clsList", supertypes);
		}
		
		chain.doFilter(httpreq, httpresp);

	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
