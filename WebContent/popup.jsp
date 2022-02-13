<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
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
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>" >
						<%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID()%></td>
						<%-- <td><%= list.get(i).getBbsContent()%></td> --%>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
						
						
					</tr>

				 

			
					<%
						}
					%>

				</tbody>
				
			</table> 
			
			
			
			
		</div>
	</div>
	
	<!-- <button onclick="closePop()">종료</button> -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	/* 팝업창 종료 */
	/*  function closePop() {
		 window.close();
		 }
 */
	
	 
	</script>
	<script src="js/bootstrap.js"></script>
</body>
</html>