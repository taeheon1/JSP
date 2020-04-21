<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dispatcher</title>
</head>
<body>
request 속성 값 : <%=request.getAttribute("request") %><br>
&nbsp;&nbsp;cf. 포워딩이 되더라도 URL 주소가 변경되지 않는다.<br>
&nbsp;&nbsp;(같은 request 영역을 공유하게 됨)
</body>
</html>