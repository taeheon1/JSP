<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
%>
<!DOCTYPE html>
<html><head>
	<meta charset="UTF-8">
	<title>게시판</title>
</head>

<body>
<form name="deleteForm" action="./BoardDeleteAction.bo?num=<%=num %>" 
	method="post">
<table border="1">
<tr>
	<td>게시글 비밀번호 :</td>
	<td><input name="BOARD_PASS" type="password"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<a href="javascript:deleteForm.submit()">삭제</a>
		&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">돌아가기</a>
	</td>
</tr>
</table>
</form>

</body>

</html>