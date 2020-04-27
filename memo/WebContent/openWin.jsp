<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a:link{text-decoration: none; color:#87aaec;}
a:visited {text-decoration: none; color:#87aaec;}
a:hover {text-decoration: underline; color:orange;}
dt{ float: left; width :60px; text-align: right;}
dd{ font-size: 10pt; color : gray; margin : 10px;}
.tt1 {font-size: 10pt; font-weight: bold; color:white; }
.tt2 {font-size: 10pt;}
.tt3 {font-size: 10pt; font-weight: bold; }
</style><script language="JavaScript">
function send(ff) {
	if (ff.name.value =="" ){
		alert("이름을 입력하세요."); ff.name.focus();
		return;
	}
	if(ff.memo.value == ""){
		alert("내용을 입력하세요."); ff.memo.focus();
		return;
	}
	ff.submit();
}</script>
</head>
<body>
<p><img src="images/memo.gif"></p>
<form name="f" method="post" action="addMemo.jsp">
<fieldset><dl>
<dt>Name &nbsp;</dt>
<dd><input type="text" name="name"></dd>
<dt>내용 &nbsp;</dt>
<dd><input type="text" name="memo" size="40" maxlength="20"></dd>
<dd style="margin-left: 60px;">
<img src="images/sp.gif">&nbsp;
<label class="tt3">20자 이내로 쓰세요.</label></dd>
<dd align="center">
<input type="button" value="메모 남기기" onclick="send(this.form)" class="tt3">
&nbsp;&nbsp;&nbsp;
<input type="reset" value="다시 쓰기" class="tt3"></dd>
</dl></fieldset><dl>
<dd align="right">
<input type="text" value="<%=request.getRemoteAddr() %>" name="ip" size="15" class="tt2" readOnly></dd>
</dl></form></body>
</html>