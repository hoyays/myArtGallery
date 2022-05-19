package com.site.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	//Login Page Loading
	@RequestMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	//Join Page Loading
	@RequestMapping("/join")
	public String join() {
		return "/member/join";
	}
	
	//IdFind Page Loading
	@RequestMapping("/idFind")
	public String idFind() {
		return "/member/idFind";
	}
	
	
	
	
	
	
	
}//class
