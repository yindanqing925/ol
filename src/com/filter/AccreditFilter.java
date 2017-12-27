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

public class AccreditFilter implements Filter {
	
	private Logger logger = Logger.getLogger(AccreditFilter.class);

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
		boolean doesGoon = false;
		try {
			String useAble = (String) req.getServletContext().getAttribute("useable");
			if("1".equals(useAble)){
					doesGoon = true;
			}
		} catch (Exception e) {
			logger.error("AccreditFilter:"+e);
		}finally{
			if(doesGoon){
				chain.doFilter(req, res);
			}else{
				logger.info("授权信息过期.");
				String host = (String) request.getServletContext().getAttribute("host");
				res.sendRedirect("http://"+host+":8080/ol/Accredit.htm");
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
