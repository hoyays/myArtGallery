package com.site.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

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
	//로그인 페이지 로딩
	@RequestMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	
	//로그인 처리
	@RequestMapping("/doLogin")
	public String doLogin(@RequestParam String userId, 
						  @RequestParam String userPw, 
						  @RequestParam String stayLoginValue, 
						  HttpServletRequest request,
						  HttpServletResponse response) {
		
		System.out.println("ENTER doLogin");
		System.out.println("stayLoginValue : "+stayLoginValue);
		
		//변수
		HttpSession session = request.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		String destination = "";
		
		//기존 세션에 저장된 '로그인 관련 값' 삭제처리
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
			session.removeAttribute("session_flag");
		}
		
		map = loginService.doLogin(userId, userPw);
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		int loginCheck = (int) map.get("loginCheck");

		
		//참고 https://rongscodinghistory.tistory.com/3
		if(loginCheck == 1) {
			//로그인 성공
			session.setAttribute("login", map.get("memberDto"));
			session.setAttribute("session_flag", "YES");
			
			if(stayLoginValue.equals("true")) {
				//로그인 상태유지 클릭 O
				//로그인 성공 후 현재 저장된 session의 sessionId를 쿠키에 저장한다.
				Cookie cookie = new Cookie("stayLoginCookie", session.getId());
				//System.out.println("로그인 유지, 세션아이디 : "+session.getId());
				cookie.setPath("/");
				int amout = 60*60;  //로그인 상태 유지 시간 - 1시간 설정      
				cookie.setMaxAge(amout);     //단위는 초
				response.addCookie(cookie);  //쿠키를 적용해 준다.
				
				//현재 날짜+시간 구한 후 로그인상태유지 시간(초)만큼 더하기
				LocalDateTime currentDateTime = LocalDateTime.now();
				LocalDateTime LDT_sessionLimit = currentDateTime.plusSeconds(amout);
				
				//LocalDateTime ==> Timestamp로 변경
				Timestamp sessionLimit = Timestamp.valueOf(LDT_sessionLimit);
				
				
				//sessionId와 유효시간(로그인 상태유지)을 DB에 저장한다.
				loginService.keepLogin(memberDto.getUserId(), session.getId(), sessionLimit);
			}
			
			//Forward와 Redirect의 차이(참고 https://mangkyu.tistory.com/51)
			//destination = "/common/main";   //이렇게 하면 URL에 /doLogin이 표시된다.
			destination = "redirect:/";       //이렇게 하면 URL에 /doLogin이 표시되지 않는다.
			
		}else {
			//로그인 실패
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
	//로그아웃 처리
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		// 변수
		Cookie cookie = WebUtils.getCookie(request, "stayLoginCookie");
		MemberDto memberDto = (MemberDto) session.getAttribute("login");

		if (cookie != null) {
			cookie.setPath("/");
			cookie.setMaxAge(0); // 쿠키를 없앨 때에는 '0'으로 설정해야 함! invalidate 같은 거 없음
			response.addCookie(cookie);

			LocalDateTime currentDateTime = LocalDateTime.now();
			// LocalDateTime ==> Timestamp로 변경
			Timestamp sessionLimit = Timestamp.valueOf(currentDateTime);

			// 사용자 테이블에도 유효기간을 현재시간으로 다시 세팅해야함
			loginService.keepLogin(memberDto.getUserId(), session.getId(), sessionLimit);
		} // if

		
		session.invalidate();

		return "/member/logout";
	}
	
	
	
	
	
	
	
	/***************************************************************************
	 * 
	 ******************** JOIN *************************************************
	 * 
	 ***************************************************************************/
	
	//회원가입 페이지 로딩
	@RequestMapping("/join")
	public String join() {
		return "/member/join";
	}
	
	
	
	//아이디 중복체크 ajax
	@RequestMapping("/join/doIdDoubleChk")
	@ResponseBody
	public int doIdDoubleChk(String userId) {
		int resultCnt = loginService.idDoubleChk(userId);
		return resultCnt;
	}
	
	
	
	
	
	
	
	
	//IdFind Page Loading
	@RequestMapping("/idFind")
	public String idFind() {
		return "/member/idFind";
	}
	
	
	
	
	
	
	
}//class
