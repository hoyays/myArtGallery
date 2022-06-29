<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%
	session.invalidate();
%>
 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>LogOut</title>
	</head>
	<body>
		<c:choose>
			<c:when test="${session_flag eq 'NO' || session_flag == null}">
				<script type="text/javascript">
					location.href="/"
				</script>
			</c:when>
		</c:choose>
	</body>
</html>