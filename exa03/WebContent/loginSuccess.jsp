<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.User"%>
<% User user = (User) session.getAttribute("user"); %>
<%= user.getName() %>님 로그인 성공<br><br>
<a href="logout">로그아웃</a>