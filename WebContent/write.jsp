<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 라이브러리 불러올 수 있게 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="styLesheet" href="css/bootstrap.css">
<title>JSP 게시판 메인 만들기</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js">

function writeform_check() {
	 var bbsTitle = document.getElementById("bbsTitle");
	 var bbsContent = document.getElementById("bbsContent");
	 var agree = document.getElementById("agree");

	 if (bbsTitle.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
		    alert("제목을 입력하세요.");
		    bbsTitle.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
		  };
		  
		  var titleCheck = /{1,50}$/;

		  if (!titleCheck.test(bbsTitle.value)) {
		    alert(" 4~10자리를 입력하여야 합니다..");
		    bbsTitle.focus();
		    return false;
		  };




</script>
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
		</div>
	</nav> 
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 2px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" 
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목은 '최대 50자' 입니다." name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>		
							<td><textarea class="form-control"
									placeholder="글 내용은 '최대 300자' 입니다." name="bbsContent" maxlength="300"
									style="height: 300px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="button" value="취소" onClick="self.location='bbs.jsp';"class="btn btn-primary pull-right">
				<input type="submit" class="btn btn-primary pull-right" onclick="writeform_check();" value="글쓰기">
				
			</form>
		</div>
	</div>
	
	<script src="js/bootstrap.js"></script>
		<footer>
	<div class="footer_container">
		<div class="footA"></div>
		<div class="footB">Copyright © jm's All Rights Reserved.</div>
	</div>
	</footer>
</body>
</html>