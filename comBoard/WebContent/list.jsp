<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.BoardDao, board.BoardVO"%>
<%
	// list.jsp?pageNo=1과 같은 형식으로 호출
	String tempNo = request.getParameter("pageNo");

	int pageNo = 1;
	try {
		pageNo = Integer.parseInt(tempNo);
	} catch (Exception e) {
		// null 이거나, 문자를 숫자로 바꾸려 해서 에러가 나거나 무조건 pageNo=1
	}

	final int ROW_PER_PAGE = 5; // 페이지당 레코드 출력 갯수
	int begin = (pageNo - 1) * ROW_PER_PAGE + 1;
	int end = pageNo * ROW_PER_PAGE;
	BoardDao dao = BoardDao.getInstance();
	ArrayList<BoardVO> list = dao.list(begin, end);
	// 시작 페이지와 끝 페이지를 조건으로 리스트 가져오기
	int totalRows = dao.count(); // 전체 게시물 갯수
	int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
	// 전체 페이지 갯수

	final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
	int totalRanges = (int) Math.ceil((double) totalPages
			/ PAGE_PER_PAGE); // 전체 Range 갯수
	int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE);
	//요청된 pageNo의 현재 range
	int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
	int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
	if (currentRange == totalRanges)
		endPage = totalPages; // currentRange가 맨 마지막 range인 경우

	int prevPage = 0;
	if (currentRange != 1)
		prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
	int nextPage = 0;
	if (currentRange != totalRanges)
		nextPage = currentRange * PAGE_PER_PAGE + 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>리스트 페이지</h1>
	<p>현재 페이지 : <%=pageNo%> page</p>
	<table>
		<tr>
			<td style="width: 50px;">번호</td>
			<td style="width: 300px;">제목</td>
			<td style="width: 100px;">등록일</td>
		</tr>
		<%
			int loop = list.size();
			for (int index = 0; index < loop; index++) {
				BoardVO board = list.get(index);
				String detailURL = "detail.jsp?no=" + board.getNo()
						+ "&pageNo=" + pageNo;
		%>
		<tr>
			<td><%=board.getNo()%></td>
			<td>
				<%
					if (board.getNo() != board.getGroupNo()) {
				%> ┗ <%
					}
				%> <a href="<%=detailURL%>"><%=board.getTitle() %></a>
			</td>
			<td><%=board.getRegdate()%></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="3" align="center">
				<%
					if (prevPage != 0) {
				%> <a href="list.jsp?pageNo=<%=prevPage%>">&lt;</a> <%
 					}
				%>
				<%
					for (int i = beginPage; i <= endPage; i++) {
				%> <a href="list.jsp?pageNo=<%=i%>"><%=i%></a>
				<%
					}
				%>
				<%
			 		if (nextPage != 0) {
				%> <a href="list.jsp?pageNo=<%=nextPage%>">&gt;</a>
				<%
					}
				%>
			</td>
		</tr>
	</table>
	<p><a href="form.jsp">새글</a></p>
</body>
</html>