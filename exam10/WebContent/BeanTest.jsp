<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page"/>
<%-- <jsp:setProperty name="beantest" property="name" value="BeanTest!"/> --%>
<%-- <jsp:setProperty name="beantest" property="name" param="name"/> --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>자바빈 사용 예제</b>
<h3><%=beantest.getName()%></h3>
<%-- <h3><jsp:getProperty property="name" name="beantest"/></h3> --%>
</body>
</html>