<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>LoginResult</title>
</head><body>
<%
   String dbId = "jsp", dbPw = "1234";
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   if ( dbId.equals(id.trim()) && dbPw.equals(pw.trim()) ) {
      session.setAttribute("id", id);
      session.setAttribute("pw", pw);
      //response.sendRedirect(index.jsp);
      out.print("<script>");
      out.print("top.location.href='index.jsp';");
      out.print("</script>");
   } else {
%>
<script>
   alert("입력하신 정보가 일치하지 않습니다.");
   top.history.back();   // 뒤로 돌아가기
</script>
<%   } %>
</body></html>