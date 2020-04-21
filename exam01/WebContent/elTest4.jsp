<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page isELIgnored="true" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>표현언어</h3>
	<%
		request.setAttribute("name", "Jsp");
		int num1 = 5;
		int num2 = 20;
	%>
	<p>
		연산자 사용<br />${ num1<= num2 }</p>
	<p>
		파라메터 값 얻기<br>파라메터 값 : ${ param.name }<br> ${empty param.name }
	</p>
	<p>
		쿠키 값 얻기<br>세션 ID : ${cookie.JSESSIONID.value }
	</p>
	<p>
		requestScope 값 얻기<br> NAME : \${ requestScope.name } :
		${requestScope.name }<br> NAME : \${ requestScope["name"]} :
		${requestScope["name"] }
	</p>
	<p>확인 : ${name }</p>
	<!-- EL을 이용한 객체 탐색
name 변수 앞에 스코프가 지정되어 있지 않으면
page > request > session > application 순으로 탐색
 -->
</body>
</html>