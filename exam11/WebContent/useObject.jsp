<%@ page contentType = "text/html; charset=euc-kr" %>
<jsp:useBean id="member" scope="request"
             class="chap11.member.MemberInfo" />
<html>
<head><title>�λ縻</title></head>
<body>

<%= member.getName() %> (<%= member.getId() %>) ȸ����
�ȳ��ϼ���.

</body>
</html>
