<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 게시글 보기 </title>
</head>
<% 
try
{
	String strIdx = request.getParameter("idx");
	
	// DB 접속
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
	out.println("db 접속 성공");
		
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
	<table border="1">
<% 
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
%>
	</table>
	<br>
	<a href="reWrite.jsp?idx=<%=rs.getString("IDX")%>">수정 </a>
	<a href="delete.jsp?idx=<%=rs.getString("IDX")%>">삭제 </a>
	<a href="index.jsp">목록으로</a>
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