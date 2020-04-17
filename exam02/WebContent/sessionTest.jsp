<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 정보</h2>
<% session.setMaxInactiveInterval(10); %>
세션 유효시간 : <%=session.getMaxInactiveInterval() %>초<br>
세션ID : <%=session.getId() %><br>
생성 시간 :
<%
	long time = session.getCreationTime();
	Date d = new Date(time);
	out.print(d.toLocaleString());
%><br>
	isNew() : <%=session.isNew()%><br>
	최종접속시간 : <%=session.getLastAccessedTime() %> 
</body>
</html>