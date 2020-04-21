<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>표현식</th>
			<th>값</th>
		</tr>
		<tr>
			<td>\${2+5 }</td>
			<td>${2+5 }</td>
		</tr>
		<tr>
			<td>\${4/5 }</td>
			<td>${4/5 }</td>
		</tr>
		<tr>
			<td>\${5 %7 }</td>
			<td>${5%7 }</td>
		</tr>
		<tr>
			<td>\${5 mod 7 }</td>
			<td>${5 mod 7 }</td>
		</tr>
		<tr>
			<td>\${2 > 3 }</td>
			<td>${2 > 3 }</td>
		</tr>
		<tr>
			<td>\${2 gt 3 }</td>
			<td>${2 gt 3 }</td>
		</tr>
		<tr>
			<td>\${3.1 le 3.2 }</td>
			<td>${3.1 le 3.2 }</td>
		</tr>
		<tr>
			<td>\${(5>3)? true:false }</td>
			<td>${(5>3)? true:false }</td>
		</tr>
		<tr>
			<td>\${header["host"] }</td>
			<td>${header["host"] }</td>
		</tr>
		<tr>
			<td>\${"user-agent"}</td>
			<td>${"user-agent"}</td>
	</table>
</body>
</html>