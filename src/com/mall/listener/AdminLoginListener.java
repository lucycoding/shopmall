package com.mall.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.mall.po.Admin;


public class AdminLoginListener implements ServletContextListener,
								HttpSessionListener, HttpSessionAttributeListener {

	private List<String> adminList;

	private ServletContext context;
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	public void contextInitialized(ServletContextEvent e) {
		adminList = new ArrayList<String>();
		context = e.getServletContext();
		context.setAttribute("adminList", adminList);
	}

	public void sessionCreated(HttpSessionEvent arg0) {
		
	}

	public void sessionDestroyed(HttpSessionEvent hse) {
		HttpSession session = hse.getSession();
		String admin = (String) session.getAttribute("adminLoginNameRet");
		if(admin != null && !"".equals(admin)) {
			adminList.remove(admin);
			context.setAttribute("adminList", adminList);
		}
		
	}

	public void attributeAdded(HttpSessionBindingEvent hsbe) {
		HttpSession session = hsbe.getSession();
		String admin = (String) session.getAttribute("adminLoginNameRet");
		if(admin!=null && !"".equals(admin)) {
			if(!adminList.contains(admin)) {
				adminList.add(admin);
				context.setAttribute("adminList", adminList);
			}
		}
	}

	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		
		
	}

	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		
		
	}

}
