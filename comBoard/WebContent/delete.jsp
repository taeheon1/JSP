<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDao"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));

	BoardDao dao = BoardDao.getInstance();
	dao.deleteComment(no);
	dao.delete(no);

	response.sendRedirect("list.jsp?pageNo=" + pageNo);
%>