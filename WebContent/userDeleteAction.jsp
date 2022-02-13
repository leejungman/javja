w<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
	
			UserDAO userDAO=new UserDAO();//하나의 인스턴스
			int result=userDAO.delete(userID);
			/* System.out.println(result); //삭제로그 확인  */
			if(result == -1){//데이터 베이스 오류가 날 때
				System.out.println("userID");
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('회원탈퇴에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(result == 0){ //해당 아이디가 DB에 없을 때
				session.invalidate();
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('해당아이디가 DB에 없습니다.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
			else{
				
				session.invalidate();
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('회원탈퇴에 성공했습니다.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
	%>
</body>
</html>