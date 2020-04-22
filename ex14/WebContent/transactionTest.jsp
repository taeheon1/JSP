<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	// transactionTest
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "INSERT INTO student (num, name) " + " Values (11, '홍길동')";
	String sql2 = "SELECT * FROM student WHERE num = 13";
	try {
		Context init = new InitialContext();
		Context env = (Context) init.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery();
		if (!rs.next()) {
			conn.rollback();
			out.println("<h3>데이터 삽입에 문제가 발생하여 롤백</h3>");
		} else {
			conn.commit();
			out.println("<h3>데이터 삽입 모두 완료</h3>");
		}
		pstmt.close();
		conn.setAutoCommit(true);
	} catch (Exception e) {
		out.println("<h3>데이터 삽입 실패</h3>");
		e.printStackTrace();
	}
%>