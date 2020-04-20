<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쿠키 정보 삭제하기</h2>
<%
	Cookie co[] = request.getCookies();
	if(co != null) { //쿠키의 정보가 있다면
		out.print(co.length + "<br/>");
		for(int i = 0; i< co.length; i++){
			co[i].setMaxAge(0); //유효기간을 0 으로 설정하면 삭제
			co[i].setPath("/");
			response.addCookie(co[i]);
			//변경된 내용을 다시 클리언트 쪽으로 저장
		}
		out.print(co.length + "<br>");
	}
%>
<h3><a href ="cookieGet.jsp">쿠키정보 확인하기</a></h3>
</body>
</html>