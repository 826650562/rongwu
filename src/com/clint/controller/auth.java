package com.clint.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.model.Global;
import com.clint.service.MapService;
import java.util.List;

//登录认证控制
@Controller
@RequestMapping(value = "/loginManager")
public class auth {
	@Resource(name = "mapService")
	private MapService mapService;

	// 验证是否登录
	@RequestMapping(value = "/checkLogin")
	public  void checkLogin(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String session_user=(String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
		
		if(StringUtils.isNotEmpty(session_user)){
			response.getWriter().write(Global.ALERT_LONGIN);
		}else{
			response.getWriter().write(Global.NOT_LONGIN);
		}
	}
	/*
	 * //登录
	 * 
	 * @RequestMapping(value = "/doLogin") public void
	 * doLogin(HttpServletRequest req, HttpServletResponse response) throws
	 * IOException { String session_user=(String)
	 * req.getSession().getAttribute(Global.USER_SESSION_KEY);
	 * 
	 * 
	 * }
	 */
	// 验证是否登录
	@RequestMapping(value = "/loginOut")
	public  void loginOut(HttpServletRequest req, HttpServletResponse response) throws IOException {
		req.getSession().setAttribute(Global.USER_SESSION_KEY,"");
		response.getWriter().write(Global.LOGIN_OUt);
	}
}
