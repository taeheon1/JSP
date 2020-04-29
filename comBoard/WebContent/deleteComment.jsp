<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDao, board.CommentVO"%>
<%
	int cno = Integer.parseInt(request.getParameter("cno"));
	int boardNo = Integer.parseInt(request.getParameter("no"));
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));

	BoardDao dao = BoardDao.getInstance();
	dao.deleteComment(cno);

	response.sendRedirect("detail.jsp?no=" + boardNo + "&pageNo=" + pageNo);
%>