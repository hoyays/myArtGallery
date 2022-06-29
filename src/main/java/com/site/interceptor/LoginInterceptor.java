package com.site.interceptor;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.site.dto.MemberDto;
import com.site.service.LoginService;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Autowired
	LoginService loginService;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//Executed before Controller

		
		//변수
		HttpSession session = request.getSession();
		String session_flag = (String) session.getAttribute("session_flag");
		Object obj = session.getAttribute("login");
		
		//콘솔확인
		System.out.println("LoginInterceptor || preHandle");
		System.out.println("uri : "+request.getRequestURI());
		System.out.println("session_flag : "+session_flag);   

		
		//test 시작
//		if(obj == null) {
//			System.out.println("로그인된 세션이 없는 경우");
//			
//			//로그인 상태유지 체크 시 저장해 놓은 쿠키를 꺼내온다.
//			Cookie loginCookie = WebUtils.getCookie(request, "stayLoginCookie");
//			System.out.println("쿠키 존재 : "+loginCookie);
//			
//			//쿠키가 존재하는 경우
//			if(loginCookie != null) {
//				String sessionId = loginCookie.getValue();
//				MemberDto memberDto = loginService.chkSessionWithSessionKey(sessionId);
//				
//				//쿠키가 존재하면서, 세션 유효기간이 남아있을 경우
//				if(memberDto != null) {
//					session.setAttribute("login", memberDto);
//					session.setAttribute("session_flag", "YES");
//					
//					return true;
//				}//if
//				
//				
//			}//if
//			
//		}//if
		
		//test 끝
		
		
		
		
		if(session_flag != null && session_flag.equals("YES")) {
			//로그인 성공하여 session에 값이 저장되어 있을 때 바로 메인으로 이동
			response.sendRedirect("/");
			return false;
		}else {
			//로그인 안된 상태, 즉 session에 값이 저장되어 있지 않음 
			return true;
		}//if
		
		
		
	}//preHandle
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//Executed after Controller and before showing View Page 
		System.out.println("LoginInterceptor || postHandle");
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}//postHandle
	
	
	


}//class
