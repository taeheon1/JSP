<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.board.db.*" %>
<%
	List boardList=(List)request.getAttribute("boardlist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>
<!DOCTYPE html>
<html><head>
	<meta charset="UTF-8">
	<title>게시판</title>
</head>
<body>
<table width="80%" border="0" cellpadding="0" cellspacing="0">
<%
if(listcount > 0){
%>
	<tr>
		<th colspan="4"><h3>MVC 게시판</h3></th>
		<td align="right">글수 : ${listcount }</td>
	</tr>
	
	<tr bordercolor="#333333">
		<th style="font-family:Tahoma;font-size:11pt;" width="10%" height="25">
			번호
		</th>
		<th style="font-family:Tahoma;font-size:11pt;" width="40%">
			제목
		</th>
		<th style="font-family:Tahoma;font-size:11pt;" width="15%">
			작성자
		</th>
		<th style="font-family:Tahoma;font-size:11pt;" width="20%">
			날짜
		</th>
		<th style="font-family:Tahoma;font-size:11pt;" width="15%">
			조회수
		</th>
	</tr>
	
	<%
		for(int i=0;i<boardList.size();i++){
			BoardBean bl=(BoardBean)boardList.get(i);
	%>
	<tr bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="25" style="font-family:Tahoma;font-size:11pt;" align="center">
			<%=bl.getBOARD_NUM()%>
		</td>
		
		<td style="font-family:Tahoma;font-size:11pt;" align="left">
			<%if(bl.getBOARD_RE_LEV()!=0){ %>
				<%for(int a=0;a<=bl.getBOARD_RE_LEV()*2;a++){ %>
				&nbsp;
				<%} %>
				▶
			<%}else{ %>
				▶
			<%} %>
			<a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM()%>">
				<%=bl.getBOARD_SUBJECT()%>
			</a>
		</td>
		
		<td style="font-family:Tahoma;font-size:11pt;" align="center">
			<div align="center"><%=bl.getBOARD_NAME() %></div>
		</td>
		<td style="font-family:Tahoma;font-size:11pt;" align="center">
			<div align="center"><%=bl.getBOARD_DATE() %></div>
		</td>	
		<td style="font-family:Tahoma;font-size:11pt;" align="center">
			<div align="center"><%=bl.getBOARD_READCOUNT() %></div>
		</td>
	</tr>
	<%} %>
	<tr height="20">
		<td colspan="7" style="font-family:Tahoma;font-size:10pt;" align="center">
			<%if(nowpage<=1){ %>
			[ 이전 ]&nbsp;
			<%}else{ %>
			<a href="./BoardList.bo?page=<%=nowpage-1 %>">[ 이전 ]</a>&nbsp;
			<%} %>
			
			<%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="./BoardList.bo?page=<%=a %>">[<%=a %>]</a>&nbsp;
				<%} %>
			<%} %>
			
			<%if(nowpage>=maxpage){ %>
			[ 다음 ]
			<%}else{ %>
			<a href="./BoardList.bo?page=<%=nowpage+1 %>">[ 다음 ]</a>
			<%} %>
		</td>
	</tr>
	<%
    }
	else
	{
	%>
	<tr>
		<th colspan="4"><h3>MVC 게시판</h3></th>
		<td align="right">글수 : 0</td>
	</tr>
	<tr>
		<td colspan="5" align="center">등록된 글이 없습니다.</td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="5" align="right">
	   		<a href="./BoardWrite.bo">[ 글쓰기 ]</a>
		</td>
	</tr>
</table>
</body>
</html>