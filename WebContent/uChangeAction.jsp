<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userAddress"/>
<jsp:setProperty name="user" property="userPhone"/>
<jsp:setProperty name="user" property="userZipCode"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 로그인 기능 구현</title>
</head>

<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
		
		UserDAO userDAO = new UserDAO();
	
		int result = userDAO.userUpdate(userID, request.getParameter("userPassword"), request.getParameter("userName"), request.getParameter("userAddress"), request.getParameter("userZipCode"), request.getParameter("userEmail"), request.getParameter("userPhone"));
		
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정실패')"); 
			script.println("history.back();");
			script.println("</script>");
		}    
		else {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('회원정보 수정에 성공했습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
			}		
		
		
	%>
	
	
	
	
	
	
	
	
</body>
</html>