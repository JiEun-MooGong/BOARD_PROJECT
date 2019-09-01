<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 무공이의 게시판 만들기 - 게시글 등록 </title>
<% 

	request.setCharacterEncoding("euc-kr");

	//변수 선언
	int idx = 1;
	String strTitle = request.getParameter("title");
	String strWriter = request.getParameter("writer");
	String strContent = request.getParameter("content");
	int iCnt = 31;
	
	//유효성 검사
	if(strTitle==""||strTitle==null)
	{ out.println("제목을 입력해주세요.<hr>");
	  out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
	  return;}
	if(strWriter==""||strWriter==null)
	{ out.println("작성자를 입력해주세요.<hr>");
		out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
	  return;}
	if(strContent==""||strContent==null)
	{ out.println("내용을 입력해주세요.<hr>");
		out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
	  return;}
	
	try
	{
		// DB 접속
		String strDN = "oracle.jdbc.driver.OracleDriver"; 
		String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
		Class.forName(strDN);
		Connection con = DriverManager.getConnection(url,"board","board");
		
		//입력
		Statement stmt = con.createStatement();
		String strSql = "";
		strSql += "INSERT INTO BOARD";
		strSql += "(IDX, TITLE,WRITER,REGDATE,COUNT,CONTENT)";
		strSql += "VALUES(BOARD_SEQ.NEXTVAL, '"+strTitle+"','"+strWriter+"',(SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL),1,'"+strContent+"')";
		stmt.executeUpdate(strSql);
		out.println("글 등록 완료.");
		
		// 클로즈
		con.close();
	}
	catch (Exception e)
	{
		out.println("db 에러!<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	finally
	{
		out.print("<script>location.href='list.jsp';</script>");
	}
%>
</head>
<body>
</body>
</html>