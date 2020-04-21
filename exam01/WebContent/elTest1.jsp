<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% session.setAttribute("test", "Session Test"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="elTest2.jsp">
<table border="1"><tr>
	<td>이름 : </td>
	<td><input type="text" name="name" value="홍길동"></td>
</tr><tr>
<td colspan="2" align="center">
<input type="submit" value="입력"></td></tr>
</table>
</form>
</body>
</html>