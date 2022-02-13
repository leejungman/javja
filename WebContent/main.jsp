<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %><!-- 라이브러리 불러올 수 있게 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="styLesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<!-- 로그인이 된 사람의 정보를 담는다. -->
	<% 
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	Integer isAdmin = null;
	if (session.getAttribute("isAdmin") != null){
		isAdmin = (Integer)session.getAttribute("isAdmin");
	}
	System.out.println(userID);
	System.out.println(isAdmin);
	%>
	<nav class="navbar navbar-defult">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">메인</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			<%
				if(userID == null){
			%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
				
			<%		
				} else if(userID != null && isAdmin == 0) {
			%>
			<li><a href="logoutAction.jsp">로그아웃</a></li>
						<li><a href="uChange.jsp">회원수정</a></li>
						<li><a href="uDelete.jsp">회원탈퇴</a></li>
						<li><a href="usearch.jsp">회원검색</a></li>
			<%	
				}
			%>	
				
				
				
				
				
			</ul>
		</div>	
<%-- 			<!-- 로그인이 되어 있지 않다면 회원가입을 할 수 있게 -->
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%		
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						<li><a href="uChange.jsp">회원수정</a></li>
						<li><a href="uDelete.jsp">회원탈퇴</a></li>
					</ul></li>
			</ul>
			<%	
				}
			%>
	
		</div> --%>
		
		<div>
		
		
		<img src="image/background.png" width="1300" height="500"/>
		
		
		
		</div>
		
		
		
		
		
		
	</nav>
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