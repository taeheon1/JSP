<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="exam.jdbc.MemberVO" />
<jsp:setProperty property="*" name="vo" />
<jsp:useBean id="dao" class="exam.jdbc.JDBC_memberDAO"/>
<%
	if(dao.memberInsert(vo) > 0){
		out.print("<script>");
		out.print("alert('가입을 축하드립니다.');");
		out.print("location.href='memberSelect.jsp';");
		out.print("</script>");
	} else {
		out.print("<script>");
		out.print("alert('정상적으로 완료되지 않았습니다.');");
		out.print("history.back();");
		out.print("</script>");
	}
%>
</body>
</html>