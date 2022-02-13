<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!-- 라이브러리 불러올 수 있게 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="styLesheet" href="css/bootstrap.css">
<title>JSP 게시판 메인 만들기</title>
</head>
<body>
	<!-- 로그인이 된 사람의 정보를 담는다. -->
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
<%-- 	<nav class="navbar navbar-defult">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<!-- 로그인이 되어 있지 않다면 회원가입을 할 수 있게 -->
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

					</ul></li>
			</ul>
			<%
				}
			%>

		</div>
	</nav> --%>
	<div class="container">
		<div class="row">

			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">게시판
							글보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%=bbs.getBbsTitle()%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserID()%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 4)+"년"
					+ bbs.getBbsDate().substring(5, 7) + "월"
					+ bbs.getBbsDate().substring(8, 11) + "일"%></td>
					</tr>
					<tr>
						<td>내용</td> <!-- 특수문자 처리 -->
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<!-- <a href="bbs.jsp" class="btn btn-primary">목록</a> -->
			<%
			if(userID != null && userID.equals(bbs.getUserID())){ //해당아이디가 본인이라면 수정, 삭제 가능
			%>
			<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>
			<a href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">삭제</a>
			<%	
			}
			
			%>
		<!-- 	<input type="submit" class="btn btn-primary pull-right" value="글쓰기"> -->
			<button type="button" class="btn btn-primary" onclick="window.close();">닫기</button>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
<!-- 		<footer>
	<div class="footer_container">
		<div class="footA"></div>
		<div class="footB">Copyright © jm's All Rights Reserved.</div>
	</div>
	</footer> -->
</body>
</html>