<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>


<!DOCTYPE html>
<html>
<head>
<title> 무공이의 게시판 만들기 </title>
<style>
    table {border-collapse: collapse;  margin-left: auto; margin-right: auto;}
      th {background-color: yellowgreen; border:1px solid black; padding: 10px;}
      td {border:1px solid black;}
      
    .btn{
      background-color: green;
      text-decoration: none;
      font-size:1rem;
      color:white;
      padding:10px 20px 10px 20px;
      margin:20px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
    }

</style>
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
		<th width = "50px">번호</th>
		<th width = "200px">제목</th>
		<th width = "100px">작성자</th>
		<th width = "100px">날짜</th>
		<th width = "100px">조회 수</th>		
	</tr>
<%
	while(rs.next())
	{
		out.print("<tr>");
		out.print("<td>" + rs.getString("IDX") + "</td>");
		out.print("<td>" + "<a href='content.jsp?idx="+ rs.getString("IDX") +"'>" + rs.getString("TITLE")+"</a>" + "</td>");
		out.print("<td>" + rs.getString("WRITER") + "</td>");
		out.print("<td>" + rs.getString("REGDATE") + "</td>");
		out.print("<td>" + rs.getString("COUNT") + "</td>");
		out.print("</tr>");
	}
%>
	</table>
	
	<a class="btn" href="Write.jsp">글쓰기</a>
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