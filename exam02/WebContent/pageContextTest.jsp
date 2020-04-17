<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	pageContext.forward("pageContextTest2.jsp");
%>
<h3>포워딩된 pageContextTest2.jsp 페이지로<br>
	request와 response에 대한 제어권이 같이 넘어간다.<br>
	포워딩된 후 다시 현재의 페이지로 제어권이 넘어오지 않는다.</h3>