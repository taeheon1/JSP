<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*"%>
<%
	MemberBean member=(MemberBean)request.getAttribute("member");
%>
<!DOCTYPE html>
<html><head>
	<meta charset="UTF-8">
	<title>관리자모드 회원정보</title>
</head>
<body>
<table border="1" width="300">
	<tr align=center>
		<td>아이디 : </td>
		<td><%=member.getMEMBER_ID() %></td>
	</tr>
	<tr align=center>
		<td>비밀번호 : </td>
		<td><%=member.getMEMBER_PW() %></td>
	</tr>
	<tr align=center>
		<td>이름 : </td>
		<td><%=member.getMEMBER_NAME() %></td>
	</tr>
	<tr align=center>
		<td>나이 : </td>
		<td><%=member.getMEMBER_AGE() %></td>
	</tr>
	<tr align=center>
		<td>성별 : </td>
		<td><%=member.getMEMBER_GENDER() %></td>
	</tr>
	<tr align=center>
		<td>이메일 주소 : </td>
		<td><%=member.getMEMBER_EMAIL() %></td>
	</tr>
	<tr align=center>
		<td colspan=2>
			<a href="MemberListAction.me">리스트로 돌아가기</a>
		</td>
	</tr>
</table>
</body>
</html>