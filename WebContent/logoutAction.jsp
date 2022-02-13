<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 로그아웃 페이지</title>
</head>
<body>
	<%
		session.invalidate(); //세션을 날림
	%>
	<script>
	location.href = 'login.jsp'; /*login.jsp로 이동*/	
	</script>
</body>
</html>