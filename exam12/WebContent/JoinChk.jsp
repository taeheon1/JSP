<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="join" class="join.JoinBean" />
<jsp:setProperty name="join" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoinChk.jsp</title>
<style>
body {
	text-align: center;
}

table {
	border: 1px solid #333;
	border-collapse: collapse;
	width: 300px;
}

td {
	border: 1px solid #333;
	padding: 10px;
	height: 30px
}
</style>
</head>
<body>
	<table>
		<tr>
			<td>아이디</td>
			<td><jsp:getProperty property="id" name="join" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><jsp:getProperty property="pass" name="join" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><jsp:getProperty property="name" name="join" /></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><jsp:getProperty property="age" name="join" /></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><jsp:getProperty property="email" name="join" /></td>
		</tr>
	</table>
</body>
</html>