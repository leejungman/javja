<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!--JSTL 사용 추가  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!-- 라이브러리 불러올 수 있게 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="styLesheet" href="css/bootstrap.css">
<title>JSP 게시판 메인 만들기</title>
<style type="text/css">
a, a:hover{
color:#000000;
text-decoration: none;
}



</style>
</head>
<body>
	<!-- 로그인이 된 사람의 정보를 담는다. -->
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; //기본 페이지
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request
					.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar navbar-defult">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">회원 검색 권한</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
				
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
	</div>
	</nav>
	<div class="container">
		<div class="row">
			<form method="post" name="search" action="searchUser.jsp">
				<table class="pull-right">
				<h1>회원검색</h1>
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="">선택</option>
								<option value="userID">아이디</option>
								<option value="userName">이름</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>

				</table>
				
				<div class="container">
		<div class="row" style="width:100%;cursor:pointer;">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">이름</th>
						<th style="background-color: #eeeeee; text-align: center;">이메일</th>
						<!-- <th style="background-color: #eeeeee; text-align: center;">내용</th> -->
						<th style="background-color: #eeeeee; text-align: center;">전화번호</th>
						<th style="background-color: #eeeeee; text-align: center;">계정</th>
					</tr>
				</thead>
				<%-- 	<%  getsearch DAO 작성 해야함 !!
				UserDAO userDAO = new UserDAO();
				ArrayList<User> list = userDAO.getsearch(userID, request.getParameter("userName"));
				for (int i = 0; i < list.size(); i++) {
								
				%>
				<tr>
				 <td><%=list.get(i).getUserID() %></td>
			  	 <td><%=list.get(i).getUserName() %></td>
				 <td><%=list.get(i).getUserEmail()%></td>
				 <td><%=list.get(i).getUserPhone()%></td>
				 <td><%=list.get(i).getIsAdmin() %></td>
				</tr> 
				<%
				
				}
				%> --%>
				</tbody>
					
			</table> 
				<input type="button" value="메인으로" onClick="self.location='main.jsp';"class="btn btn-primary pull-right">
			</div>
	</div>
			</form>
		</div>
	</div>

	
	
	
	
	
	
	
</body>
<footer>
<div class="footer_container">
		<div class="footA"></div>
		<div class="footB">Copyright © jm's All Rights Reserved.</div>
	</div>
	</footer>
</html>