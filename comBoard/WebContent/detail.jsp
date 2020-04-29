<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@page import="board.BoardVO"%>
<%@page import="board.CommentVO"%>
<%
	//detail.jsp?no=23&pageNo=2
	String temNo = request.getParameter("no");
	int no = 0;
	try {
		no = Integer.parseInt(temNo);
	} catch (Exception e) {
		response.sendRedirect("list.jsp");
	}

	String temPageNo = request.getParameter("pageNo");
	int pageNo = 1;
	try {
		pageNo = Integer.parseInt(temPageNo);
	} catch (Exception e) {
	}

	BoardDao dao = BoardDao.getInstance();
	// 원글 / 답글 정보 조회
	BoardVO board = dao.detail(no);

	// 댓글 정보 조회
	ArrayList<CommentVO> commentList = dao.getCommentList(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상세 페이지</h1>
	<table border="1">
		<%
			if (board != null) {
		%>
		<tr>
			<td>번호</td>
			<td><%=board.getNo()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=board.getTitle()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=board.getWriter()%></td>
		</tr>
		<tr>
			<td>등록일</td>
			<td><%=board.getRegdate()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="60"><%=board.getContent()%></textarea></td>
		</tr>
		<%
			} else {
		%>
		<tr>
			<td>게시글 정보가 존재하지 않습니다.</td>
		</tr>
		<%
			}
		%>
	</table>
	<p>
		<a href="modifyform.jsp?no=<%=no%>&pageNo=<%=pageNo%>">수정</a>
		<%--
		//1.원글인 경우 - 답글이 없는 경우에만 삭제가능
		//2.답글인 경우 - 삭제 가능
		--%>
		<%
			if (board.getNo() == board.getGroupNo()) { // 원글인 경우
				if (!dao.hasReply(no)) { // 답글이 없는 경우
		%>
		<a href="delete.jsp?no=<%=no%>&pageNo=<%=pageNo%>">삭제</a>
		<%
			}
			} else { // 답글인 경우
		%>
		<a href="delete.jsp?no=<%=no%>&pageNo=<%=pageNo%>">삭제</a>
		<%
			}
		%>
		<%
			if (board.getNo() == board.getGroupNo()) {
		%>
		<a href="form.jsp?groupNo=<%=board.getGroupNo()%>">답글</a>
		<%
			}
		%>
		<a href="list.jsp?pageNo=<%=pageNo%>">목록</a>
	</p>

	<form action="addComment.jsp" method="post">
		<input type="hidden" name="boardNo" value="<%=no%>" /> <input type="hidden"
			name="pageNo" value="<%=pageNo%>" /> <input type="text" name="writer" /> <input
			type="text" name="content" /> <input type="submit" value="등록">
	</form>

	<table width="500">
		<tr>
			<td>작성자</td>
			<td>내용</td>
			<td>등록일</td>
			<td>삭제</td>
		</tr>
		<%
			int loop = commentList.size();
			for (int i = 0; i < loop; i++) {
				CommentVO comment = commentList.get(i);
				String commentDeleteUrl = "deleteComment.jsp?cno="
						+ comment.getNo() + "&no=" + no + "&pageNo=" + pageNo;
		%>
		<tr>
			<td><%=comment.getWriter()%></td>
			<td><%=comment.getContent()%></td>
			<td><%=comment.getRegdate()%></td>
			<td><a href="<%=commentDeleteUrl%>">삭제</a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>