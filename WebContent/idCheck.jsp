<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="user" class="user.User" scope="page"/>




<!DOCTYPE html>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 로그인 기능 구현</title>
<script>





</script>
</head>

<body>
	<h3>"아이디 체크"</h3>
	<div>
		<form name ="checkform" action="idCheckAction.jsp">
			<input type ="text" name="userID" value= ""/>
			<input type = "submit" value ="검색"/><br>
	<button type="button" class="btn btn-primary" onclick="window.close();">닫기</button>
		</form>
	</div>


	<%-- <%
	//이미 로그인이 되어있스면 회원가입 페이지로 가지지 않음
  	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	} 
		
	 if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	} 
	if(user.getUserID()== null || user.getUserPassword() == null || user.getUserName()== null
	   || user.getUserEmail()== null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 내용이 있습니다.')");
		script.println("history.back();"); //이전 페이지로 돌림
		script.println("</script>");
	 } else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')"); 
			script.println("history.back();");
			script.println("</script>");
		}    
		else {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'"); //로그인시 메인페이지로 이동 
			script.println("</script>");
			}		
		
	 }
	%> --%>
</body>
</html>