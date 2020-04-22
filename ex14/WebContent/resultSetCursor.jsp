<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	Connection conn = null;
	String sql = "select * from student order by num";
	try {
		Context init = new InitialContext(); //context.xml 읽을 준비
		Context env = (Context) init.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		PreparedStatement pstmt = 
				conn.prepareStatement(sql,
						ResultSet.TYPE_SCROLL_SENSITIVE,
						ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = pstmt.executeQuery();
		rs.last();
		out.println(rs.getInt(1)+","+rs.getString(2)+"<br>");
		rs.first();
		out.println(rs.getInt(1)+","+rs.getString(2)+"<br>");
		rs.absolute(3);
		out.println(rs.getInt(1)+","+rs.getString(2)+"<br>");
	} catch (Exception e) {
		out.println("<h3>데이터 가져오기 실패</h3>");
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