<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	if(type != null){
%>
<table><tr>
	<td>타입</td><td><strong><%= type %></strong></td>
	</tr><tr>
	<td>특징</td><td>
	<% if(type.equals("A")) { %>
		강한 내구성.
	<%	} else if(type.equals("B")){ %>
		뛰어난 대처 능력.
	<%	}	 %>
	</td></tr>
</table>
<% } %>
