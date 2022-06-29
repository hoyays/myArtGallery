package com.site.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Map;

import com.site.dto.MemberDto;

public interface LoginService {

	Map<String, Object> doLogin(String userId, String userPw);   //로그인 처리
	void keepLogin(String userId, String sessionId, Timestamp sessionLimit);  //로그인 상태유지 체크시
	MemberDto chkSessionWithSessionKey(String sessionId);   //세션 유효기간이 남아있는 사용자 정보 가져오기
	int idDoubleChk(String userId);    //회원가입 - 아이디 중복체크
	

}//interface
