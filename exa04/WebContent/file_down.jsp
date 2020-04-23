<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.ServletUtils" %>
<%
	String fileName = request.getParameter("file_name");
	String savePath = "/upload";
	ServletContext context = getServletContext(); 
	String sDownloaadPath = context.getRealPath(savePath);
	String sFilePath = sDownloaadPath + "\\" + fileName; /* 자바에서 통일시켜서 /로 가능하다  */
	byte b[] = new byte[4096]; /* 4kb 씩 끊어서 처리 */ 
	File oFile = new File(sFilePath); /* 파일 정보 */
	FileInputStream in = new FileInputStream(sFilePath);  
	String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType>>>"+ sMimeType);
	// octet-stream은 8비트로 된 일련의 데이터를 뜻함
	// 지정되지 않은 파일 형식을 의미
	if(sMimeType==null)
		sMimeType = "application/octet-stream";
	response.setContentType(sMimeType);
	//한글 업로드 (이부분이 한글 파일명이 깨지는 것을 방지)
	String sEncoding = new String(fileName.getBytes("utf-8"),"8859_1");
	response.setHeader("Content-Disposition","attachment; filename= " + sEncoding);
	ServletOutputStream out2 = response.getOutputStream();
	int numRead;
	//바이트 배열 b의 0번부터 numRead번 까지 브라우저로 출력
	while((numRead = in.read(b,0,b.length)) != -1){
		out2.write(b,0,numRead);
	}
	out2.flush(); out2.close(); in.close();
%>    
