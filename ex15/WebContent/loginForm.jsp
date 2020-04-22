<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name = "loginform" action="loginProcess.jsp" method="post">
<div style="text-align: center;">
<table border="1">

<tr><td colspan="2" align="center"><h3>로그인 페이지</h3>
</td></tr>
<tr><td>아이디 : </td><td><input type="text" name="id"/>
</td></tr>
<tr><td>비밀번호 : </td>
<td><input type="password" name="pass"/></td></tr>
<tr><td colspan="2" align="center">
<a href="javascript:loginform.submit()">로그인</a>
&nbsp;&nbsp;<a href="joinForm.jsp">회원가입</a></td></tr>
</table></div></form></body></html>