package com.clint.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/sqdk")
public class sqdk {
	@RequestMapping(value = "/index")
	public String sfzrz() {
		return "sqdk";
	}
}
