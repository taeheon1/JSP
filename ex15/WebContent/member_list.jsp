<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
   String id = null;
   if ((session.getAttribute("id") == null) ||
   ( !((String)session.getAttribute("id")).equals("admin"))) {
      out.println("<script>");
      out.println("location.href='loginForm.jsp'");
      out.println("</script>");
   }
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   try {
      Context init = new InitialContext();
      Context env = (Context)init.lookup("java:comp/env");
      DataSource ds = (DataSource)env.lookup("jdbc/OracleDB");
      conn = ds.getConnection();
      pstmt = conn.prepareStatement("SELECT * FROM member");
      rs = pstmt.executeQuery();
   } catch (Exception e) { e.printStackTrace(); }
%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>member list</title>
</head><body>
<div style="text-align:center"><table border="1" width="300">
   <tr><td colspan="2" align="center">회원목록</td></tr>
   <% while(rs.next()) { %>
   <tr><td align="center">
      <a href="member_info.jsp?id=<%=rs.getString("id") %>">
      <%=rs.getString("id") %></a></td>
      <td align="center">
      <a href="member_delete.jsp?id=<%=rs.getString("id") %>">
      삭제</a></td>
   </tr>
   <%   } %>
</table></div></body></html>