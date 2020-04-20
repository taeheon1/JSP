<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinForm.jsp</title>
<style>
body {
	text-align: center;
}

table {
	border: 1px solid #333;
	border-collapse: collapse;
}

td {
	padding: 10px;
	height: 30px;
}

td.left {
	width: 80px;
	text-align: right;
}

td.foot {
	text-align: center;
	border-top: 1px solid #333;
}
</style>
</head>
<body>
	<form action="JoinChk.jsp" method="post">
		<table>
			<tr>
				<td class="left">아이디 :</td>
				<td class="right"><input type="text" name="id"></td>
			</tr>
			<tr>
				<td class="left">암호 :</td>
				<td class="right"><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td class="left">이름 :</td>
				<td class="right"><input type="text" name="name"></td>
			</tr>
			<tr>
				<td class="left">성별 :</td>
				<td class="right"><input type="radio" name="sex" value="1"
					checked>남 <input type="radio" name="sex" value="2">여</td>
			</tr>
			<tr>
				<td class="left">나이 :</td>
				<td class="right"><input type="text" name="age"></td>
			</tr>
			<tr>
				<td class="left">이메일 :</td>
				<td class="right"><input type="email" name="email"></td>
			</tr>
			<tr>
				<td class="foot" colspan="2"><input type="submit" value="가입">
					<input type="reset" value="다시 작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>