package com.site.mapper;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.apache.ibatis.annotations.Mapper;

import com.site.dto.MemberDto;

@Mapper
public interface LoginMapper {

	MemberDto selectLogin(String userId, String userPw);    //로그인처리
	void updateSessionInfo(String userId, String sessionId, Timestamp sessionLimit);   //로그인 상태유지 체크시 
	MemberDto selectUsersWithinSessionLimit(String sessionId);   //세션 유효기간이 남아있는 사용자 정보 가져오기
	int selectIdDoubleChk(String userId);    //회원가입 - 아이디 중복체크

}//interface
