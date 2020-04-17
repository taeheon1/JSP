<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/view.jsp">
	<label for="code1">페이지 선택: </label>
	<select name="code" id="code1">
		<option value="A">A 페이지</option>
		<option value="B">B 페이지</option>
		<option value="C">C 페이지</option>		
	</select>
	<input type="submit" value="이동">
</form>
</body></html>