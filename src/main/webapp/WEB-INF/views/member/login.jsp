<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="../css/member/login.css" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<title>My Art Gallery</title>
	</head>
	<body>
	
		<!-- header 추가 -->
		<div>
			<%@ include file="../common/header.jsp"%>
		</div>
		
		
		<!-- Contents Area 시작 -->
		<div id="loginTitle">로그인</div>
		<div id="contentsArea">
			
			<div id="loginHeader">
			
				<div id="tableHeader">로그인</div>
				<div id="rememberArea">
					<input type="checkbox" id="rememberMe">
					<label for="rememberMe">로그인 상태 유지</label>
				</div>
			
			</div>
			
			<div id="loginTable">
				<dl>
					<dt><label for="userId">아이디</label></dt>
					<dd><input type="text" id="userId"></dd><br>
					<dt><label for="userPw">비밀번호</label></dt>
					<dd><input type="password" id="userPw"></dd>
				</dl>
			</div>
		
			<div id="loginBtn">
				<input type="button" value="로그인">
			</div>
		
			<div id="loginFooter">
				<ul id="ulStyle">
					<li><a href="/idFind">아이디찾기</a></li>
					<li>|</li>
					<li>비밀번호찾기</li>
					<li>|</li>
					<li><a href="/join">회원가입</a></li>
				</ul>
			</div>
		
		</div>
		
		<!-- footer 추가 -->
		<div>
			<%@ include file="../common/footer.jsp"%>
		</div>
	
	
	
	</body>
</html>