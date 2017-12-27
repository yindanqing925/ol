package com.setup;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Accredit implements ServletContextListener  {
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		Calendar c = Calendar.getInstance();
		c.set(c.HOUR, 0);
		c.set(c.MINUTE, 0);
		c.set(c.SECOND, 0);
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new AccreditTimer(sce), new Date(c.getTimeInMillis()), 24*60*60*1000);
	}
	
}
