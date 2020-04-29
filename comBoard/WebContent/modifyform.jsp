<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDao, board.BoardVO"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));

	BoardDao dao = BoardDao.getInstance();
	//상세정보 조회
	BoardVO board = dao.detail(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>수정 페이지</h1>
	<form action="modify.jsp" method="post">
		<input type="hidden" name="no" value="<%=board.getNo()%>" /> <input
			type="hidden" name="pageNo" value="<%=pageNo%>" />
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="<%=board.getTitle()%>" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" value="<%=board.getWriter()%>" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="60" name="content"><%=board.getContent()%></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>

</body>
</html>