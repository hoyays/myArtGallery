<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="../css/common/main.css" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<title>My Art Gallery</title>
	</head>
	<body>
		<!-- header 추가 -->
		<div>
			<%@ include file="./header.jsp"%>
		</div>
		
		
		<!-- Contents Area 시작 -->
		<div id="contentsArea">
			Welcome!<br>
			<c:choose>
				<c:when test="${session_flag eq 'YES'}">
					<%=session_userId%>
				</c:when>
			</c:choose>
		</div>
		
		
		<!-- footer 추가 -->
		<div>
			<%@ include file="./footer.jsp"%>
		</div>
		
		
		
	</body>
</html>