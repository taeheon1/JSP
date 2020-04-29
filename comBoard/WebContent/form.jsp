<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 새글인 경우 : form.jsp
	// 답글인 경우 : form.jsp?groupNo=23 형태
	String tempGString = request.getParameter("groupNo");
	int groupNo = 0;
	try {
		groupNo = Integer.parseInt(tempGString);
	} catch (Exception e) {
		// 새글인 경우 groupNo = 0;
		// 답글인 경우 groupNo는 쿼리스트링으로 전달받은 값
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="add.jsp" method="post">
		<input type="hidden" name="groupNo" value="<%=groupNo%>">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>

</body>
</html>