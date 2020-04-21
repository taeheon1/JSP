<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String pagefile = request.getParameter("page");
    if(pagefile==null) pagefile="login";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
<td width="200"><jsp:include page="menu.jsp" /></td>
<td width="500"><jsp:include page='<%=pagefile+".jsp" %>' /></td>
</tr>
</table>
</body>
</html>