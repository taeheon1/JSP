<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	Boolean connect = false;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "lion","1234");
		connect = true;	conn.close();
	}catch(Exception e){
		connect = false;	e.printStackTrace();
	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
<h3><% if(connect == true) { %>연결되었습니다.
	<%}else{ %>연결에 실패하였습니다. <% } %></h3>
</body>
</html>