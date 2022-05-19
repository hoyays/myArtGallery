package com.site.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping("/header")
	public String header() {
		return "/common/header";
	}
	
	@RequestMapping("/footer")
	public String footer() {
		return "/common/footer";
	}
	
	@RequestMapping("/")
	public String main() {
		return "/common/main";
	}
	
}//class
