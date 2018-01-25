package com.clint.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.untils.Sjm;

@Controller
@RequestMapping(value = "/sqdk")
public class sqdk {
	@RequestMapping(value = "/index")
	public String sqdk() {
		return "/sqdk";
	}
 
	
	
	
}
