<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLEncoder" %>
<% 
	String value ="자바";
	String encodedValue = URLEncoder.encode(value,"UTF-8");
	response.sendRedirect("/exam/default.jsp?name="
			+ encodedValue);
%>