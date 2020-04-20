<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>cookie 정보 가져오기</h2>
<h3><%
	Cookie cookie[] = request.getCookies();
	out.print("쿠키의 개수 : " + cookie.length + "<br>");
	for( Cookie co : cookie){
		out.print(co.getName() + " = " + co.getValue() + "<br>");
	}
%></h3>
</body>
</html>