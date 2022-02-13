<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userAddress"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userPhone"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 체크 과정</title>
</head>
<body>
<%
UserDAO userDAO = new UserDAO();

int result = userDAO.idCheck(user.getUserID());

if(result == 1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('중복된 아이디 입니다.')");
	script.println("history.back();"); /*뒤로 이동  */
	script.println("</script>");	
}else if(result == -1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('사용가능한 아이디 입니다.')");
	script.println("history.back();"); /*뒤로 이동  */
	script.println("</script>");
}else if(result == -2){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('데이터베이스 오류입니다')");
	script.println("history.back();"); /*뒤로 이동  */
	script.println("</script>");
}



%>

</body>
</html>