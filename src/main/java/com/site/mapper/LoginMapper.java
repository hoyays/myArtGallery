package com.site.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.site.dto.MemberDto;

@Mapper
public interface LoginMapper {

	MemberDto selectLogin(String userId, String userPw);

}//interface
