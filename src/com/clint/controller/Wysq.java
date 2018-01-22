package com.clint.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Administrator 我要申请页面
 */
@Controller
@RequestMapping(value = "/wysq")
public class Wysq {
	@RequestMapping(value = "/index")
	public String index() {
		//返回申请页面
		return "wysq";
	}
	
	@RequestMapping(value = "/userinfo")
	public String userinfo() {
		//返回申请页面
		
		
		return "wysq";
	}
	
	
	@RequestMapping(value = "/checkUserLogin")
	public String checkUserLogin(HttpServletRequest req, HttpServletResponse response) {
		//检查用户
		String havahose = (String) req.getParameter("sjh");//有车
		String havacar = (String) req.getParameter("havacar");
		String havasb = (String) req.getParameter("havasb");//有社保
		String havagz = (String) req.getParameter("havagz");//上班族
		
		
 		return "wysq";
	}
	
  
}
