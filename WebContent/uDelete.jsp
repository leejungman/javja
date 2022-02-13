<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter"%>
	<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="styLesheet" href="css/bootstrap.css">
<title>JSP 회원 가입 화면</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js">
	
	 
</script>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID =(String)session.getAttribute("userID");
	}
	User user =new UserDAO().getUser(userID);
	
	%>

	<nav class="navbar navbar-defult">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp"> 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			<%
				if(userID == null){
			%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
				
			<%		
				} else {
			%>
			<li><a href="logoutAction.jsp">로그아웃</a></li>
						<li><a href="uChange.jsp">회원수정</a></li>
						<li><a href="uDelete.jsp">회원탈퇴</a></li>
			<%	
				}
			%>			
			</ul>
<!-- 			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul> -->
		</div>
	</nav>
<form method="post" action="userDeleteAction.jsp" >
	<h3>회원 삭제</h3>
					<div>
					<input type="submit" class="" value="삭제하기">
					</div>
					<div>
					<input type="button" value="취소" onClick="self.location='main.jsp';"class="">	
					</div>
					</form>
		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
		<footer>
	<div class="footer_container">
		<div class="footA"></div>
		<div class="footB">Copyright © jm's All Rights Reserved.</div>
	</div>
	</footer>
</body>
</html>