<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<link href="../css/common/header.css" rel="stylesheet">
			<div id="topMenu">
				<div id="homeBtn"><a href="/">HOME</a></div>
				<div id="memberBtn">
					<ul class="memberUlStyle">
						<c:choose>
							<c:when test="${session_flag eq 'YES'}">
								<li><a href="/logout">로그아웃</a></li>
								<li><a href="/">${session_userNm}(${session_userId})님</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/login">로그인</a></li>
								<li><a href="/join">회원가입</a></li>
							</c:otherwise>
						
						</c:choose>
					
					
					
						
						
						
						
						
						
					</ul>
				</div>
			</div>
			
			<div id="mainTitleArea">
				<!-- Main Title 들어가는 자리 -->
				<h1>Main Title</h1>
				<!-- <h1>My Art Gallery</h1> -->
			</div>
			
			<div id="mainCategoryArea">
				<!-- Main Category 들어가는 자리 -->
				<div id="continent_list">
					<ul class="ulStyle">
						<li>Europe</li>
						<li>|</li>
						<li>Asia</li>
						<li>|</li>
						<li>N.America</li>
						<li>|</li>
						<li>S.America</li>
						<li>|</li>
						<li>Africa</li>
						<li>|</li>
						<li>Oceania</li>
					</ul>
				</div>
			</div>
