<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%   // statementTest 
   Connection conn = null;
   String sql = "insert into student values(6, '추가자')";
   try {
      Context init = new InitialContext();
      Context env = (Context)init.lookup("java:comp/env");
      DataSource ds = (DataSource)env.lookup("jdbc/OracleDB");
      conn = ds.getConnection();
      Statement stmt = conn.createStatement();
      int result = stmt.executeUpdate(sql);
      if(result >= 1) {
         out.println("<h3>레코드가 등록되었습니다.</h3>");
      }
   } catch (Exception e) {
      out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
      e.printStackTrace();
   }finally{
	   conn.close();
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>statementTest</title>
</head>
<body>

</body>
</html>