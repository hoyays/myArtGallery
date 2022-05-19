package com.site.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;

	@RequestMapping("/test")
	public String test(Model model) {

		
		String result = testService.readData();
		System.out.println("Controller 결과 : "+result);
		model.addAttribute("name", result);
		
		
		return "/test";
	}
	
	
	
}//class
