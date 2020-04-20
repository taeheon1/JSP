<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% session.setAttribute("uid", request.getParameter("uid")); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><%=(String)session.getAttribute("uid") %>님 로그인 되었습니다.</h3>
<a href="sessionLogout.jsp">로그아웃</a><br>
</body>
</html>
