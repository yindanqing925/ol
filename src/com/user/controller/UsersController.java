package com.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.user.service.UserinfoService;

@RequestMapping("/user")
@Controller
public class UsersController {

	@Autowired
	private UserinfoService userinfoService;
	
	@RequestMapping( value = "/login", method = RequestMethod.POST)
	public ModelAndView login(String telephone,String passwords,HttpServletRequest  request){
		return null;
	}

}
