<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>


<!DOCTYPE html>
<html>
<head>
<title> 무공이의 게시판 만들기 - 게시글 </title>
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

	String strSelKey = request.getParameter("SelKey");
	String strSelVal = request.getParameter("SelVal");
	String strUserId = (String)session.getAttribute("userid");
	
	out.println(strUserId + " ");
	out.print("<input type=\"button\" value=\"로그아웃\" onClick=\"location.href='Login.html'\">");
	out.println("<hr>");
	
	// DB 접속
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
		
	Statement stmt = con.createStatement();
	String strSql = "";
	strSql += "SELECT * FROM BOARD";

	if(strSelKey == null)
		strSql += " ";
	else if(strSelKey.equals("1"))
		strSql += " WHERE TITLE LIKE '"+ strSelVal +"%'"; 
	else if(strSelKey.equals("2"))
		strSql += " WHERE WRITER LIKE '"+ strSelVal +"%'";
	else
		strSql += " ";
	
	strSql += " ORDER BY IDX DESC";	
	ResultSet rs = stmt.executeQuery(strSql);
%>

<body>
<div class="center">
	<h2> 게시글 목록 </h2>
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
		out.print("<td>" + "<a href='content.jsp?idx="+ rs.getString("IDX") + "'>" + rs.getString("TITLE")+"</a>" + "</td>");
		out.print("<td>" + rs.getString("WRITER") + "</td>");
		out.print("<td>" + rs.getString("REGDATE") + "</td>");
		out.print("<td>" + rs.getString("COUNT") + "</td>");
		out.print("</tr>");
	}
%>
	</table>
	<br>
	<form action="list.jsp" method="post">
	<select name ="SelKey">
		<option value="0"></option>
		<option value="1">제목</option>
		<option value="2">작성자</option>
	</select>
	<input type="text" name="SelVal" value=<%=strSelVal%>>
	<input type="submit" value="검색">	
	</form>
	
	<a class="btn" href="Write.jsp">글쓰기</a>
</div>

<%
	// 클로즈
	con.close();

	}
	catch (Exception e)
	{
		out.println("오류 : " + e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>