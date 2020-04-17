<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {border-collapse: collapse; width: 100%; }
	table, tr, td {border: 1px solid #666;}
</style>
</head>
<body>
<table><tr>
	<td>제품번호</td><td>XXXX</td>
	</tr><tr>
	<td>가격</td> <td>10,000원</td>
	</tr></table><hr>
	<jsp:include page="infoSub.jsp">
		<jsp:param name="type" value="A" />
		</jsp:include>
</body>
</html>