<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Dog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>dogView</title>
	</head>
	<body>
		<%Dog dog = (Dog) request.getAttribute("dog"); %>
		<h1 align="center"><%=dog.getKind() %>의 정보</h1>
		<table align="center" width="600">
			<tr bgcolor="orange">
				<td align="right">조회수 : <%=dog.getReadcount() %>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="dogCartAdd.dog?id=<%=dog.getId() %>">Cart 담기</a>
				</td>
			</tr>
		</table>
		<table align="center" width="600">
			<tr>
				<td rowspan="7"><img src="<%=dog.getImage() %>.jpg" /></td>
				<td>종류 : <%=dog.getKind() %></td>
			</tr>
			<tr>
				<td>출생지 : <%=dog.getCountry() %></td>
			</tr>
			<tr>
				<td>가격 : <%=dog.getPrice() %></td>
			</tr>
			<tr>
				<td>평균신장 : <%=dog.getHeight() %></td>
			</tr>
			<tr>
				<td>평균몸무게 : <%=dog.getWeight() %></td>
			</tr>
			<tr>
				<td>특징 : <%=dog.getContent() %></td>
			</tr>
			<tr>
				<td colspan="2" algin="center"><a href="dogList.dog">목록</a></td>
			</tr>
		</table>
	</body>
</html>