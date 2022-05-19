package com.site.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.TestMapper;

@Service
public class TestServiceImplement implements TestService {

	@Autowired
	TestMapper testMapper;
	
	@Override
	public String readData() {
		
		String result = testMapper.selectString();
		System.out.println("Service 결과 : "+result);
		
		return result;
	}

	
	
	
	
}//class
