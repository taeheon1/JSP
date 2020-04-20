<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<% // jsp 페이지에서 페이지를 열 때마다 리플래쉬 기능을 만들어 주는 방법
   response.setHeader("Cache-Control", "no-cache");
   response.setHeader("Pragma", "no-cache");
   response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>left</title>
<script>
   function logoutCheck() {
      if (confirm("정말 로그아웃 하겠습니까?")) {
         location.href="LogOut.jsp";
      }
   }
   
   function checkForm() {
      var id_o = document.getElementById("id");
      var pw_o = document.getElementById("pw");
      if (id_o.value == "" && pw_o.value == "") {
         alert("아이디와 패스워드가 입력되지 않았습니다.");
         id_o.focus();
      } else if(pw_o.value == "") {
         alert("패스워드가 입력되지 않았습니다.");
         pw_o.focus();
      } else {
         document.login.submit();
      }
   }
</script>
</head>
<body>
<h2>left.jsp</h2>
<%
   if(session.getAttribute("id") == null) { // 세션이 널이면
%>
<form action="LoginResult.jsp" method="post" name="login">
   I D : <input type="text" name="id" id="id"><br/>
   PWD : <input type="password" name="pw" id="pw"><br><br/>
   <input type="button" value="로그인" onclick="checkForm();"><br/>
</form>
<%
   } else { // 인증하고 온 경우
      long sTime = session.getCreationTime();
      long eTime = session.getLastAccessedTime();
      Date sd = new Date(sTime);
      Date ed = new Date(eTime);
%>
<b><%=session.getAttribute("id") %>님 로그인</b><br>
<form>
   <input type="button" value="로그아웃" onclick="logoutCheck()" />
</form>
<hr color="red">
접속 시간 : <%=new Date(session.getCreationTime()).toLocaleString() %>
<br/>
최근 접속 시간 : <%=new Date(session.getLastAccessedTime()).toLocaleString() %>
<br/>
<% } %>
</body>
</html>