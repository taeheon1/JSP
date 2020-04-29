<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.BoardDao"%>
<%@page import="board.BoardVO"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	int groupNo = Integer.parseInt(request.getParameter("groupNo"));

	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	board.setGroupNo(groupNo);

	// db에 저장
	BoardDao dao = BoardDao.getInstance();
	dao.insert(board);

	// list.jsp로 이동(Insert 작업을 수행한 이후에는 redirect로 이동)
	// -> 데이터 처리 작업(request 데이터를 저장시켰을 경우) 이후에는 redirect
	response.sendRedirect("list.jsp");
	// forword 하지 말아야 하는 이유 : 
	// forword로 넘겨주면 서버에서 서버로 응답을 요청하기 때문에
	// 데이터를 계속 가지고 있다.
	// 그러므로 list.jsp에서 browser를 refresh 시켜주면
	// 전에 요청한 DB 처리 요청이 재실행된다.
	// delete 했다면 delete가 다시 실행된다. 
	// redirect하게 되면 이러한 데이터 정보를 reset 해버리기 때문에
	// 데이터 처리 요청이 중복 실행되지 않게 방지해준다.
%>