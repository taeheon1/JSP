<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="exam.jdbc.MemberVO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {border:2px double pink; width:666px;}
td,th {border:1px pink solid; text-align:center; padding:5px;}
</style>
<script>
	function idDelete(delID){
		location.href="delete.jsp?id=" + delID;
	}
	function search(frm){
		if(frm.keyWord.value==""){
			alert("검색 단어를 입력하세요.");
			frm.keyWord.focus();
			return;
		}
		frm.submit();
	}
</script>
</head>
<body>
	<jsp:useBean id="dao" class="exam.jdbc.JDBC_memberDAO"/>
	<%
	request.setCharacterEncoding("UTF-8");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	ArrayList<MemberVO> list = 
			dao.getMemberlist(keyField,keyWord);
	%>
	<h2>Member Info</h2>
	<table>
	<tr>
	<th>아이디</th><th>이름</th><th>비밀번호</th>
	<th>나이</th><th>주소</th><th>생일</th><th>&nbsp;</th>
	</tr>
	<% for(MemberVO vo : list) { %>
	<tr>
		<td><%=vo.getId() %></td><td><%= vo.getName() %></td>
		<td><%=vo.getPwd() %></td><td><%= vo.getAge() %></td>
		<td><%=vo.getAddr() %></td><td><%= vo.getBirth() %></td>
		<td><input type="button" value="삭제" onclick="idDelete('<%= vo.getId() %>');"></td>
	</tr><% } %>
	<tr><td colspan="7"><br/>
		<form name="serach" method="post">
		<select name="keyField">
			<option value="0">----선택----</option>
			<option value="id">아이디</option>
			<option value="name">이름</option>
			<option value="addr">주소</option>
		</select>
		<input type="text" name="keyWord"/>
		<input type="button" name="검색" onclick="searchCheck(form)"/>
		</form>
	</td></tr>
	<tr>
		<td colspan="7"><p align="right"><a href="memberSelect.jsp">[전체 목록]</a>
		<a href="MemberForm.html">[회원 가입]</a></p></td>
	</tr>
	</table>
</body>
</html>