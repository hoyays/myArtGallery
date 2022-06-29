package com.site.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {

	private String userId;
	private String userPw;
	private String userNm;
	private String userMobile;
	private String userEmail;
	private String sessionId;
	private Timestamp sessionLimit;
	
	
}//class
