<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
	out.print("<script>");
	out.print("top.location.href='index.jsp';");
	out.print("</script>");
%>
</body>
</html>