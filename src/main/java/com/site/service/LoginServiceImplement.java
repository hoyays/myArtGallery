package com.site.service;

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

	@Override
	public Map<String, Object> doLogin(String userId, String userPw) {
		
		
		// Valuables
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

	
	
}//class
