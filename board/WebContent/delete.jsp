<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 무공이의 게시판 만들기 - 게시글 삭제 </title>
</head>
<% 
try
{	
	request.setCharacterEncoding("utf-8");
	String strIdx = request.getParameter("idx");
	
	// DB 접속
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
		
	//입력
	Statement stmt = con.createStatement();
	String strSql = "DELETE FROM BOARD WHERE IDX = " + strIdx;	
	stmt.executeUpdate(strSql);
	out.println("삭제 되었습니다.");
	
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
<body>

</body>
</html>