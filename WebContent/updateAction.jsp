<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 기능/title>
</head>
<body>
	<%
		//이미 로그인이 되어있스면 회원가입 페이지로 가지지 않음
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
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
		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		} else {
			//null값이나, 빈칸  유뮤
			if (request.getParameter("bbsTitle") == null
					|| request.getParameter("bbsContent") == null
					|| request.getParameter("bbsTitle").equals("")
					|| request.getParameter("bbsContent").equals("")) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 내용이 있습니다.')");
				script.println("history.back();"); //이전 페이지로 돌림
				script.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.update(bbsID,
						request.getParameter("bbsTitle"),
						request.getParameter("bbsContent"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패 했습니다.')");
					script.println("history.back();");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'"); //로그인시 메인페이지로 이동 
					script.println("</script>");
				}
			}

		}
	%>
</body>
</html>