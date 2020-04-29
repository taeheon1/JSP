<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDao, board.CommentVO"%>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");

	CommentVO comment = new CommentVO();
	comment.setBoardNo(boardNo);
	comment.setWriter(writer);
	comment.setContent(content);

	BoardDao dao = BoardDao.getInstance();
	dao.addComment(comment);

	response.sendRedirect("detail.jsp?no=" + boardNo + "&pageNo=" + pageNo);
%>