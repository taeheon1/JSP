<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 파일이름을 재정의 해주는것 이름정책 -->
<%@ page import="java.util.*" %>
<%
	String uploadPath= (String)request.getRealPath("/upload"); 
	int size = 10 * 1024 * 1024; //10MB
	String name = "";	String subject = "";
	String filename1= ""; String filename2 = "";
	String origfilename1 = ""; String origfilename2 = "";
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy()); /* 순서맞춰야함 */
		name = multi.getParameter("subject");
		Enumeration files = multi.getFileNames();
		String file1 = (String)files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		origfilename1 = multi.getOriginalFileName(file1);
		String file2 = (String) files.nextElement();
		filename2 = multi.getFilesystemName(file2);
		origfilename2 = multi.getOriginalFileName(file2);
	}catch (Exception e){
		e.printStackTrace();
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="filecheck" action="fileCheck.jsp" method="post">
<input type="text" name="name" value="<%=name%>">
<input type="text" name="subject" value="<%=subject%>">
<input type="text" name="filename1" value="<%=filename1%>">
<input type="text" name="filename2" value="<%=filename2%>">
<input type="text" name="origfilename1" value="<%=origfilename1%>">
<input type="text" name="origfilename2" value="<%=origfilename2%>">
</form>
<a href="#" onclick="javascript:filecheck.submit()">
업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>