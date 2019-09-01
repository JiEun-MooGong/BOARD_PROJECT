<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 무공이의 게시판 만들기 - 회원가입 </title>
</head>
<% 
	request.setCharacterEncoding("euc-kr");
	
	try
	{
		//변수 선언
		String strId =  request.getParameter("ID");
		String strPass = request.getParameter("PASSWORD");
		//String strPassCk = request.getParameter("RE_PASSWORD");
		String strName = request.getParameter("NAME");
		String strEmail = request.getParameter("EMAIL");
		
		//유효성 검사
		if(strId==""||strId==null)
		{ out.println("ID을 입력해주세요.<hr>");
		  out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  return;}
		if(strPass==""||strPass==null)
		{ out.println("비밀번호를 입력해주세요.<hr>");
			out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  return;}
		if(strName==""||strName==null)
		{ out.println("이름을 입력해주세요.<hr>");
			out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  return;}		
		
		// DB 접속
		String strDN = "oracle.jdbc.driver.OracleDriver"; 
		String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
		Class.forName(strDN);
		Connection con = DriverManager.getConnection(url,"board","board");
		out.println("db 접속 성공");
		
		//입력
		Statement stmt = con.createStatement();
		String strSql = "";
		strSql += "INSERT INTO BOARD_USER";
		strSql += "(USER_ID, PASSWORD, NAME, EMAIL)";
		strSql += "VALUES('"+strId+"', '"+strPass+"','"+strName+"','"+strEmail+"')";
		stmt.executeUpdate(strSql);
		out.println("db 저장 완료 되었습니다.");
		out.print("<script>location.href='Login.html';</script>");
		// 클로즈
		con.close();
	}
	catch (Exception e)
	{
		out.println("db 에러!<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
<body>
</body>
</html>