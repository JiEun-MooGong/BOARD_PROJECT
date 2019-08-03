<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>


<!DOCTYPE html>
<html>
<head>
<title> 무공이의 게시판 만들기 </title>
</head>
<% 
try
{
	// DB 접속
//	Context init = new InitialContext();
//  DataSource ds = (DataSource) init.lookup("jdbc/dataSourceTest");
//	Connection con =ds.getConnection();	
//	out.println("db 접속 성공");
//  PreparedStatement pstmt=con.prepareStatement(strSql);
//  ResultSet rs = pstmt.executeQuery();

	// DB 접속
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
	out.println("db 접속 성공");
		
	Statement stmt = con.createStatement();
	String strSql = "";
	strSql += "SELECT * FROM BOARD ORDER BY IDX DESC";	
	ResultSet rs = stmt.executeQuery(strSql);
%>

<body>
<div class="center">
	<h1> 게시글 </h1>
	<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회 수</th>		
	</tr>
<%
	while(rs.next())
	{
		out.print("<tr>");
		out.print("<td>" + rs.getString(1) + "</td>");
		out.print("<td>" + rs.getString(2) + "</td>");
		out.print("<td>" + rs.getString(3) + "</td>");
		out.print("<td>" + rs.getString(4) + "</td>");
		out.print("<td>" + rs.getString(5) + "</td>");
		out.print("</tr>");
	}
%>
	</table>
	
	<a href="Write.jsp">글쓰기</a>
</div>

<%
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
</body>
</html>