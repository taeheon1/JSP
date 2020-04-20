<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
%>
세션ID: <%= session.getId() %><br>
<% time.setTime(session.getCreationTime()); %>
세션생성시간: <%= formatter.format(time) %><br>
<% time.setTime(session.getLastAccessedTime()); %>
최근접근시간: <%= formatter.format(time) %><br>
<input type="button" onclick="location.href='sessionTest.jsp'" value="돌아가기">