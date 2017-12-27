package com.setup;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.util.DesEncrypt;

public class AccreditTimer extends TimerTask {
	
	
	private Logger logger = Logger.getLogger(AccreditTimer.class);
	
	private ServletContextEvent sce;
	
	private String sepa = java.io.File.separator;
	
	public AccreditTimer(ServletContextEvent sce) {
		this.sce = sce;
	}

	@Override
	public void run() {
		boolean doesAccredit = false;
		try {
			logger.info(" Begin to comfire accredit.");
			String filePath = (String)sce.getServletContext().getAttribute("conf.dir")+sepa+"accredit.xml";
			//File accredit = new File(filePath);
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(filePath));
			SAXReader sr = new SAXReader();
			Document doc = sr.read(bis);
			Element root = doc.getRootElement();
			String key = root.element("key").getText();
			String code = root.element("code").getText();
			DesEncrypt desEncrypt = DesEncrypt.getInstance();
			desEncrypt.setKey(key);
			String date = desEncrypt.decrypt(code);
			logger.info("授权日期至:"+date);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date shutTime = sdf.parse(date);
			if(shutTime.getTime() > new Date().getTime()){
				doesAccredit = true;
			}
		} catch (DocumentException e) {
			logger.error("Accredit-contextInitialized:"+e);
		} catch (Exception ex){
			logger.error("Accredit-contextInitialized:"+ex);
		}
		ServletContext application = sce.getServletContext();
		if(doesAccredit){
	        application.setAttribute("useable", "1");
		}else{
			application.setAttribute("useable", "0");
		}
		logger.info("Accredit:"+application.getAttribute("useable"));
	}

}
