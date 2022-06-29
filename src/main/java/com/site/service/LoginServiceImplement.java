package com.site.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.dto.MemberDto;
import com.site.mapper.LoginMapper;

@Service
public class LoginServiceImplement implements LoginService {
	
	@Autowired
	LoginMapper loginMapper;

	
	/***************************************************************************
	 * 
	 ******************** LOGIN ************************************************
	 * 
	 ***************************************************************************/
	//로그인 처리
	@Override
	public Map<String, Object> doLogin(String userId, String userPw) {
		
		//변수
		Map<String, Object> map = new HashMap<String, Object>();
		int loginCheck = -1;
		String message = "ID/PW가 일치하지 않습니다.";
		
		
		MemberDto memberDto = loginMapper.selectLogin(userId, userPw);
		if(memberDto != null) {
			loginCheck = 1;
			message = "ID/PW가 일치합니다.";
		}
		
		map.put("memberDto", memberDto);
		map.put("loginCheck", loginCheck);
		map.put("message", message);
		
		return map;
	}//doLogin()

	
	
	
	//로그인 상태유지 체크 시 
	@Override
	public void keepLogin(String userId, String sessionId, Timestamp sessionLimit) {
		
		loginMapper.updateSessionInfo(userId, sessionId, sessionLimit);
		
	}//keepLogin



	//세션 유효기간이 남아있는 사용자 정보 가져오기
	@Override
	public MemberDto chkSessionWithSessionKey(String sessionId) {
		
		MemberDto memberDto = loginMapper.selectUsersWithinSessionLimit(sessionId);
		
		return memberDto;
	}//chkSessionWithSessionKey




	
	/***************************************************************************
	 * 
	 ******************** JOIN *************************************************
	 * 
	 ***************************************************************************/
	//회원가입 - 아이디 중복체크
	@Override
	public int idDoubleChk(String userId) {
		
		int resultCnt = loginMapper.selectIdDoubleChk(userId);
		
		return resultCnt;
	}

	
	
}//class
