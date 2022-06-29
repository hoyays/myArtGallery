package com.site.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.site.interceptor.LoginInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	//로그인한 사람만 게시판 페이지 이동 가능하도록 처리할 때!!
	//addPath 반드시 수정할 것!!
	//addPath에는 글쓰기 페이지 진입하기 전, 이 회원이 로그인 상태 여부를 체크할 때 활용 ex)/list, /write 등등
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor())
				.order(1)
				.addPathPatterns("/login", "/join")
				.excludePathPatterns("/css/**", "/img/**", "/*.ico", "/error");
	}
	
	
	@Bean
	public LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	
	
	
}//class
