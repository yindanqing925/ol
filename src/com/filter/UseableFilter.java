package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class UseableFilter implements Filter {
	
	private Logger logger = Logger.getLogger(UseableFilter.class);
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		boolean doesGoon = false;
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
		try {
//			Users user = (Users) request.getSession().getAttribute("user");
//			if(user!=null && user.getId()!=0){
//					doesGoon = true;
//			}
		} catch (Exception e) {
			logger.error("AdminFilter:"+e);
		}finally{
			if(doesGoon){
				chain.doFilter(req, res);
			}else{
//				String host = (String) request.getServletContext().getAttribute("host");
				response.sendRedirect("http://www.zhongyouvip.com");
			}
		}
	}

	@Override
	public void init(FilterConfig filter) throws ServletException {
	}

}
