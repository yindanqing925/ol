package com.setup;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

public class ApplicationValues implements ServletContextListener {
	
	Logger logger = Logger.getLogger(ApplicationValues.class);
	
	private String sepa = java.io.File.separator;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
        InetAddress address = null;
        try {
            address = InetAddress.getLocalHost();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        String hostAddress = address.getHostAddress();
        ServletContext application = sce.getServletContext();
        logger.info("启动注入");
        application.setAttribute("host", hostAddress);
        logger.info("服务器地址:" + hostAddress);
        application.setAttribute("base", "/ol");
        logger.info("base:" + application.getAttribute("base"));
        String webHome = application.getRealPath(sepa);
        application.setAttribute("home.dir", webHome);
        logger.info("home.dir:"+webHome);
        String confHome = webHome + sepa + "WEB-INF"+sepa+"conf";
        application.setAttribute("conf.dir", confHome);
        logger.info("conf.dir:"+confHome);
	}
}
