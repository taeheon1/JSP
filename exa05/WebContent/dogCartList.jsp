<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Cart, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>dogCartList</title>
	</head>
	<body>
		<%
			ArrayList<Cart> cartList = (ArrayList<Cart>) request.getAttribute("cartList");
			int totalMoney = (Integer) request.getAttribute("totalMoney");
		%>
		<h2 align="center">장바구니</h2>
		<table width="600" algin="center">
			<tr>
				<td align="right"><a href="dogList.dog">쇼핑 계속하기</a></td>
			</tr>
		</table>
		<%if (cartList.size() == 0) { %>
			<h1 align="center">상품이 존재하지 않습니다.</h1>
		<%} else { %>
		<form action="dogCartRemove.dog" method="post" name="myForm">
			<table align="center" width="600" border="1">
				<tr>
					<th>번호</th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th align="center"><input type="submit" name="delete" value="삭제" /></th>
				</tr>
				<%int num = 1;
				for (int i = 0; i < cartList.size(); i++) {%>
				<tr align="center">
					<td><%=num++ %></td>
					<td><img src="<%=cartList.get(i).getImage() %>.jpg" width="70" height="70" /></td>
					<td><%=cartList.get(i).getKind() %></td>
					<td><%=cartList.get(i).getPrice() %></td>
					<td><%=cartList.get(i).getQty() %></td>
					<td align="center"><input type="checkbox" name="delete" value="<%=cartList.get(i).getKind() %>" /></td>
				</tr><%} %>
			</table>
		</form>
		<table align="center" width="600" border="0">
			<tr algin="center" bgcolor="yellow">
				<td align="right" colspan="6"><h4>총 결제금액 : <%=totalMoney %>원</h4></td>
			</tr>
		</table>
		<%} %>
	</body>
</html>