<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	Connection conn = null;
	String sql = "insert into student values(?, '홍길동')";
	try {
		Context init = new InitialContext();
		Context env = (Context) init.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		for (int i = 7; i <= 10; i++) {
			stmt.setInt(1, i);
			if (stmt.executeUpdate() != 0) {
				out.println("<h3>" + i + "번 레코드를 등록</h3>");
			}
		}
	} catch (Exception e) {
		out.println("<h3>레코드 등록에 실패</h3>");
		e.printStackTrace();
	} finally {
		conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>