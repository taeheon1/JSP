<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default</title>
</head>
<body>
<%
	String bookTitle = "JSP 프로그래밍";
	String author = "홍길동";
%>
<b><%= bookTitle %></b> (<%= author %>)입니다.
</body>
</html>