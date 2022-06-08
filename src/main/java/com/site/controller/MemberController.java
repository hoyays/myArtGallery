package com.site.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.dto.MemberDto;
import com.site.service.LoginService;

@Controller
public class MemberController {
	
	@Autowired
	LoginService loginService;

	
	/***************************************************************************
	 * 
	 ******************** LOGIN ************************************************
	 * 
	 ***************************************************************************/
	//Login Page Loading
	@RequestMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	//doLogin
	@RequestMapping("/doLogin")
	public String doLogin(@RequestParam String userId, @RequestParam String userPw, HttpServletRequest request) {
		
		
		//Valuables
		HttpSession session = request.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		String destination = "";
		
		
		map = loginService.doLogin(userId, userPw);
		
		int loginCheck = (int) map.get("loginCheck");
		
		if(loginCheck == 1) {
			session.setAttribute("session_flag", "YES");
			session.setAttribute("session_userId", ((MemberDto)map.get("memberDto")).getUserId());
			session.setAttribute("session_userNm", ((MemberDto)map.get("memberDto")).getUserNm());
			
			destination = "/common/main";
		}else {
			session.setAttribute("session_flag", "NO");
			
			destination = "/member/loginDenied";
		}//if
		
		return destination;
	}
	
	
	
	
	
	
	
	
	/***************************************************************************
	 * 
	 ******************** LOGOUT ***********************************************
	 * 
	 ***************************************************************************/
	//Logout Page Loading
		@RequestMapping("/logout")
		public String logout() {
			return "/member/logout";
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
