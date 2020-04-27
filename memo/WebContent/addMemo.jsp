<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.dao.MemoDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>  
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
	String ip = request.getParameter("ip");
	boolean commit = MemoDAO.addMemo(name, memo, ip);
	try{
		if(commit){
	
%><script type = "text/javascript">
	opener.location.href = "memoList.jsp"; // 다시 갱신(로드)
	self.close(); //현재 창 닫기
</script><% } else { %>
<script type = "text/javascript">alert("저장 실패!");</script>
<% }
} catch(Exception e) {} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>