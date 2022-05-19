<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="../css/member/join.css" rel="stylesheet">
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
		<div id="joinTitle">회원가입</div>
		<div id="contentsArea">
		
			<div id="joinHeader">
				<div id="tableHeader">회원가입</div>
				
				<div id="required">
					<img alt="필수" src="../img/check_icon.png">&nbsp;
					<label>필수입력</label>
				</div>
				
			</div>
		
			 
			 <div id="joinTable">
			 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userId">아이디</label><br>
			 	<input type="text" id="userId">
			 	<input type="button" value="중복확인"><br><br>
			 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userPw">비밀번호</label><br>
			 	<input type="password" id="userPw"><br><br>
			 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userPwChk">비밀번호확인</label><br>
			 	<input type="password" id="userPwChk"><br><br>
			 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userNm">이름</label><br>
			 	<input type="text" id="userNm"><br><br>
			 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="userMobile">휴대폰</label><br>
			 	<input type="text" id="userMobile">&nbsp;-없이 입력<br><br>
			 	<img alt="필수" src="../img/check_icon.png">&nbsp;<label for="email1">이메일</label><br>
			 	<input type="text" id="email1">&nbsp;@&nbsp;
			 	<input type="text" id="email2">
			 	<select name="domainList">
			 		<option value="" selected="selected">직접입력</option>
			 		<option value="naver.com">naver.com</option>
			 		<option value="kakao.com">kakao.com</option>
			 		<option value="daum.net">daum.net</option>
			 		<option value="hanmil.net">hanmil.net</option>
			 		<option value="gmail.com">gmail.com</option>
			 	</select><br>
			 </div>
			 
			<div id="reCAPTCHA">
				Google reCAPTCHA
			</div>			 
			 
			 
		
			<div id="joinBtn">
				<input type="button" value="회원가입">
			</div>		
		
		
			<div id="joinFooter">
				<ul id="ulStyle">
					<li><a href="/idFind">아이디찾기</a></li>
					<li>|</li>
					<li>비밀번호찾기</li>
					<li>|</li>
					<li><a href="/login">로그인</a></li>
				</ul>
			</div>
		
		
		
		
		
		
		
		
		
		
		</div>
		
		
		<!-- footer 추가 -->
		<div>
			<%@ include file="../common/footer.jsp"%>
		</div>
		
		
		
	
	</body>
</html>