<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306:mysql";
	Boolean connect = false;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "root", "1234");
		connect = true;
		conn.close();
	} catch (Exception e) {
		connect = false;
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
		<%
			if (connect == true) {
		%>
		연결되었습니다.
		<%
			} else {
		%>
		연결에 실패하였습니다.
		<%
			}
		%>
	</h3>
</body>
</html>