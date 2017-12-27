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
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class AdminFilter implements Filter {
	
	private Logger logger = Logger.getLogger(AdminFilter.class);

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
	    HttpSession session = req.getSession(true);
		boolean doesGoon = false;
		try {
			String admin = (String) session.getAttribute("user");
			String userNo = (String) session.getAttribute("userNo");
			if(admin!=null && !"".equals(admin)){
				if(userNo!=null && !"".equals(userNo)){
					doesGoon = true;
				}
			}
		} catch (Exception e) {
			logger.error("AdminFilter:"+e);
		}finally{
			if(doesGoon){
				chain.doFilter(req, res);
			}else{
//				String host = (String) request.getServletContext().getAttribute("host");
				res.sendRedirect("http://www.zhongyouvip.com/adminLogin.jsp");
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
