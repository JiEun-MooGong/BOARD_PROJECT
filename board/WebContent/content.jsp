<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 무공이의 게시판 만들기 - 게시글 보기 </title>
</head>
<% 
try
{
	String strIdx = request.getParameter("idx");
	String strUserId = (String)session.getAttribute("userid");
	
	// DB 접속
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
		
	Statement stmt = con.createStatement();
	String strSql = "";
	//조회수  UP
	strSql = "UPDATE BOARD SET COUNT = COUNT + 1 WHERE IDX = " + strIdx;	
	ResultSet rs = stmt.executeQuery(strSql);
	
	strSql = "SELECT * FROM BOARD WHERE IDX = " + strIdx;	
	rs = stmt.executeQuery(strSql);
	
	while(rs.next())
	{
%>
<body>
<h1>게시글</h1>
<% 
	out.print("<table border=\"1\">");
	out.print("<tr>");
	out.print("<th>번호</th>");
	out.print("<td>" + rs.getString("IDX") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>작성자</th>");
	out.print("<td>" + rs.getString("WRITER") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>날짜</th>");
	out.print("<td>" + rs.getString("REGDATE") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>조회수</th>");
	out.print("<td>" + rs.getString("COUNT") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>제목</th>");
	out.print("<td>" + rs.getString("TITLE") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>내용</th>");
	out.print("<td>" + rs.getString("CONTENT") + "</td>");
	out.print("</tr>");
	out.print("</table>");
	out.print("<br>");
	
	String strWriter = rs.getString("WRITER");
	
	if(strWriter.equals(strUserId))
	{
		out.print("<a href=\"reWrite.jsp?idx=" + rs.getString("IDX") + "\">수정 </a>");
		out.print("<a href=\"delete.jsp?idx=" + rs.getString("IDX") + "\">삭제 </a>");
	}
%>
	<a href="list.jsp">목록으로</a>
	</body>
<%
	}

	con.close();

	}
	catch (Exception e)
	{
	out.println("db 에러!<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
	}
%>
</html>