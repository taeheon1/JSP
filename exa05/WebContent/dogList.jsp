<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, vo.Dog, java.util.List, java.sql.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>dogList</title>
	</head>
	<body>
		<%
			List<Dog> dogs = (List<Dog>) request.getAttribute("dogs");
			int num = 1;
		%>
		<h1 align="center">강아지 목록</h1>
		<table align="center">
			<%if (dogs != null) { %>
			<tr><%for (int i = 0; i < dogs.size(); i++) {
				Dog dog = dogs.get(i);%>
				<td><a href="dogView.dog?id=<%=dog.getId() %>">
				<img src='<%=dog.getImage() + ".jpg" %>' style="height: 100px; width:100px;" /></a><br>
				상품명 : <%=dog.getKind() %><br>
				가격 : <%=dog.getPrice() %>원</td>
				<%if (i == 0 || i % 4 != 0) {
					continue;
					} else { %>
				</tr><tr>
			<% }
			} %></tr>
			<%} %>
		</table><br><br>
		<h1 align="center">오늘 본 개 상품</h1>
		<table align="center" width="600">
			<tr><% ArrayList<String> images = (ArrayList<String>) request.getAttribute("images");
					if (images != null & images.size() > 0) {
						for (int i = 0; i < images.size(); i++) {
				%>
				<td align="center"><img src="<%=images.get(i) + ".jpg" %>" style="height: 200px; width: 200px" /></td>
				<%}
				}%>
			</tr>
		</table>
	</body>
</html>