<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Iterator" %>
<%@ page import="mybatis.vo.MemoVO" %>
<%@ page import="mybatis.dao.MemoDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link{text-decoration: none; color:#87aaec;}
a:visited {text-decoration: none; color:#87aaec;}
a:hover {text-decoration: underline; color:orange;}
table {border: 0; width: 400px; margin: auto;}
td{font-size: 11pt; color:#333;}
table thead tr th{font-size: 11pt; font-weight: bold; color: white; background-color: #A3D4F7;}
.t1 {width:5%;} .t2 {width:45%;}
.t3 {width:20%;} .t4 {width:30%;}
.line {background: #A3D4F7; height: 1px;}
.bar {height: 5px;} .ccc{display: inline;} 
</style><script language="JavaScript">
	function openWin(){
		window.open("openWin.jsp","","width=450, height=300, top=200, left=300");
	}
</script>
</head>
<body>
<table summary="메모장 리스트"><caption>메모 목록</caption>
<thead><tr>
<th class="t1">NO</th><th class="t2">내 용</th>
<th class="t3">글쓴이</th><th class="t4">날짜</th>
</tr></thead><tfoot><tr>
<td colspan="4" align="center">
<input type="button" value="메모 남기기" onclick="openWin();"></td>
</tr></tfoot><tbody><%
List<MemoVO> list = MemoDAO.searchAll();
Iterator<MemoVO> it = list.iterator();
int cnt = 0;
int no = list.size();
while(it.hasNext()){
	cnt++;	MemoVO mvo = it.next();
%><tr align="center">
<td><%=no %></td>
<td align="left"><%=mvo.getContent() %></td>
<td><%=mvo.getWriter() %></td>
<td><%=mvo.getReg_date() %></td>
</tr><tr>
<td colspan="4" class="line"></td>
</tr><%
	no--;
}
if(cnt == 0){
%><tr align="center" style="height: 50px;">
<td colspan="4">현재 등록된 메모가 없습니다.</td>
</tr><%} %><tr>
<td colspan="4" class="bar"></td>
</tr></tbody></table>
</body></html>