package com.mall.listener;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.mall.model.Model;


public class UserLoginListener implements ServletContextListener,
				HttpSessionListener, HttpSessionAttributeListener {
	private List<String> nameList;

	private ServletContext context;
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	public void contextInitialized(ServletContextEvent e) {
		nameList = new ArrayList<String>();
		context = e.getServletContext();
		context.setAttribute("nameList", nameList);
		System.out.println("init");
	}

	public void sessionCreated(HttpSessionEvent arg0) {
		
	}

	public void sessionDestroyed(HttpSessionEvent hse) {
    	Object online=context.getAttribute("online");
		HttpSession session = hse.getSession();
		String name = (String) session.getAttribute("name");
		if(name != null) {
			nameList.remove(name);
	    	online=(Integer)online-1;
	    	context.setAttribute("online",online);
	    	context.setAttribute("nameList",nameList);
		}
//		System.out.println("移除用户后"+new Date());
//		Iterator it1 = nameList.iterator();
//        while(it1.hasNext()){
//            System.out.println(it1.next());
//        }
//		System.out.println("destroy");
//		System.out.println("当前在线用户数："+online);
	}

	public void attributeAdded(HttpSessionBindingEvent hsbe) {
		Object online=context.getAttribute("online");
		if(online==null)
    	{
    		online=new Integer(1);
    		online=0;
    	}
		HttpSession session = hsbe.getSession();
		String name = (String) session.getAttribute("name");
		if(name != null) {
			if(!nameList.contains(name)) {
				nameList.add(name);
		    	online=(Integer)online+1;
		    	context.setAttribute("nameList",nameList);
			}
		}
    	context.setAttribute("online",online);
//		Iterator it1 = nameList.iterator();
//		System.out.println("加入用户后"+new Date());
//        while(it1.hasNext()){
//            System.out.println(it1.next());
//        }
//        System.out.println("add");
//		System.out.println("当前在线用户数："+online);
	}

	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		
		
	}

	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		
		
	}
}
