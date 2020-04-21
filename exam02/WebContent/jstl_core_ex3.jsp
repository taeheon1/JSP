<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="date" class="java.util.Date"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
	<fmt:formatNumber value="50000" type="currency"/><br>
	<fmt:formatNumber value="0.15" type="percent"/><br>
	<fmt:formatNumber value="500567300" pattern="###,###,###"/>
	</p><p>
	<fmt:formatDate value="${date }" type="date"/><br>
	<fmt:formatDate value="${date }" type="time"/><br>
	<fmt:formatDate value="${date }" type="both"/><br>
	<fmt:formatDate value="${date }" type="both"
	timeStyle="short" dateStyle="short"/><br>
	<fmt:formatDate value="${date }" type="both"
	timeStyle="long" dateStyle="long"/></p>
</body>
</html>