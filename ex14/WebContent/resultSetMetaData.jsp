<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	Connection conn = null;
	String sql = "select * from student order by num";
	try {
		Context init = new InitialContext();
		Context env = (Context) init.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();
		out.println("컬럼 수: "  + rsmd.getColumnCount()+"<br>");
		for(int i = 1; i<=rsmd.getColumnCount(); i++){
			out.println(i + "번째 컬럼의 이름 : "
					+rsmd.getColumnName(i) + "<br>");
			out.println(i + "번째 컬럼 타입이름 : "
					+rsmd.getColumnTypeName(i) + "<br>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
%>
