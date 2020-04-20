<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Cookie 정보 저장하기</h2>
<%
	Cookie co = new Cookie("id","javaking");
	Cookie co2 = new Cookie("age", "22");
	co.setMaxAge(60 * 60 * 24); //1일
	co2.setMaxAge(60 * 60 * 24 * 365); //365일
	co.setPath("/"); //모든 문서(디렉토리) 에서 쿠키 사용가능
	co2.setPath("/");
	response.addCookie(co);
	response.addCookie(co2);
%>
<h3><a href="cookieGet.jsp">쿠키정보 확인</a></h3>
</body>
</html>