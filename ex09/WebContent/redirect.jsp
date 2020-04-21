<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
useBodyEncodingForURL="true"<br>
request 속성 값 : <%=request.getAttribute("request") %><br>
&nbsp;&nbsp;;cf. 포워딩될 때 브라우저 주소 표시줄의 URL이 변경된다.<br>
&nbsp;&nbsp;포워딩된 jsp 페이지에서는 서블릿에서 request 영역에 공유한 속성값에 접근할 수 없다. <br>
&nbsp;&nbsp;그냥 포워딩(페이지 이동)이 목적이고, 값이 공유되지 않는다.
</body>
</html>