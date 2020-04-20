<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>right</title>
</head>
<body>
<h2>right.jsp</h2>
<%
   if (session.getAttribute("id") == null) { // 세션이 널이면
      out.print("<h2>로그인 되어 있지 않은 상태입니다.</h2>");
   } else {
      out.print("<img src='img04.jpg'><br/>");
      out.print("<h2>접속 중입니다.</h2>");
   }
%>
</body>
</html>