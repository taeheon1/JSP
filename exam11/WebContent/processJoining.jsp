<%@ page contentType = "text/html; charset=euc-kr" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memberInfo" class="chap11.member.MemberInfo" />
<jsp:setProperty name="memberInfo" property="*" />
<jsp:setProperty name="memberInfo" property="password"
				 value="<%= memberInfo.getId() %>" />
<html>
<head><title>����</title></head>
<body>

<table width="400" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td>���̵�</td>
	<td><jsp:getProperty name="memberInfo" property="id" /></td>
	<td>��ȣ</td>
	<td><jsp:getProperty name="memberInfo" property="password" /></td>
</tr>
<tr>
	<td>�̸�</td>
	<td><jsp:getProperty name="memberInfo" property="name" /></td>
	<td>�̸���</td>
	<td><jsp:getProperty name="memberInfo" property="email" /></td>
</tr>
<tr>
	<td>�ּ�</td>
	<td colspan="3">
	<jsp:getProperty name="memberInfo" property="address" />
	</td>
</tr>
</table>

</body>
</html>
