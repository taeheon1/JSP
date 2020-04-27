<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, test.*" %>
<% List<Emp> list = SimpleExample.list(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>mybatis</title>
	</head>
	<body>
		<table style="margin: auto; width: 50%">
			<caption><h3>모든 사원정보 출력</h3></caption>
			<tr>
				<th>사 번</th>
				<th>이 름</th>
				<th>입사일</th>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
					Emp e = (Emp) list.get(i);
			%>
			<tr>
				<td><%=e.getEno() %></td>
				<td><%=e.getEname() %></td>
				<td><%=e.getHiredate() %></td>
			</tr>
			<%} %>
		</table>
	</body>
</html>