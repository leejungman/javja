<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
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
			<a class="navbar-brand" href="main.jsp">게시판</a>
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
<%-- 			<!-- 로그인이 되어 있지 않다면 회원가입을 할 수 있게 -->
			<%
				if (userID == null) {
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
			%> --%>

		</div>
	</nav>
	<div class="container">
		<div class="row" style="width:100%;cursor:pointer;">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<!-- <th style="background-color: #eeeeee; text-align: center;">내용</th> -->
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<!--<th style="background-color: #eeeeee; text-align: center;">팝업</th> -->
					</tr>
				</thead>
								
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();//게시글을 뽑을수 있게 
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber, userID); //게시글 몰록 출력
						for (int i = 0; i < list.size(); i++) {
					%>
					
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><span onclick="popup(<%= list.get(i).getBbsID() %>)"><%= list.get(i).getBbsTitle() %></span></td>
						<td><%= list.get(i).getUserID()%></td>
						<%-- <td><%= list.get(i).getBbsContent()%></td> --%>
						<td><%= list.get(i).getBbsDate().substring(0, 4)+"년"+list.get(i).getBbsDate().substring(5, 7)+"월" + list.get(i).getBbsDate().substring(8, 11)+"일"%></td>
						<!--+ list.get(i).getBbsDate().substring(8, 11)+"일"+list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" -  -->				<!-- <td><button onclick="window.open('popup.jsp','popup test','width=430,height=500,location=no,status=no,scrollbars=yes');">popup</button></td> -->
					</tr>

				 
				
					<%
						}
					%>

				</tbody>
				
			</table> 
			
			
			 		
			<!-- 페이징  -->
	<div class=container style="text-align: center">
				<%
					if (pageNumber != 1) {//이전페이지로
				%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>">◀ 이전</a>
				<%
					}
				%>
				<%
					int n = (int) (bbsDAO.getCount(userID) / 10 + 1);
					for (int i = 1; i <= n; i++) {
				%>
				<a href="bbs.jsp?pageNumber=<%=i%>">|<%=i%>|
				</a>
				<%
					}
				%>
				<%
					if (bbsDAO.nextPage(pageNumber + 1)) {//다음페이지가 존재하는ㄱ ㅏ
				%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>">다음 ▶</a>
				<%
					}
				%>
		</div> 
				
			<!-- 	<a href="bbs.jsp" class="btn btn-primary">목록</a>		 -->	
				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
				</div>
			
		</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	  function popup(_id){
         var url = "view.jsp?bbsID=" + _id;
         var name = "popup test";
         var option = "width = 550, height = 500, top = 100, left = 200, location = no"
         window.open(url, name, option);
         
      } 
	 
	 
	</script>
	<script src="js/bootstrap.js"></script>
</body>
<footer>
<div class="footer_container">
		<div class="footA"></div>
		<div class="footB">Copyright © jm's All Rights Reserved.</div>
	</div>
	</footer>
</html>