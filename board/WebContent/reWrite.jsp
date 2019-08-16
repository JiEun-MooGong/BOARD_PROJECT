<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 무공이의 게시판 만들기 - 게시글 수정 </title>
<style>
label {
            float: left;
            clear: left;
            width: 7em;
        }
</style>
</head>
<body>
<h2>게시글</h2>
<% 
try
{
	String strIdx = request.getParameter("idx");
	
	// DB 접속
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
		
	Statement stmt = con.createStatement();
	String strSql = "";
	strSql += "SELECT * FROM BOARD WHERE IDX = " + strIdx;	
	ResultSet rs = stmt.executeQuery(strSql);
	
	while(rs.next())
	{
%>

<form method = "post" action="update.jsp?idx=<%=strIdx%>">
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
	out.print("<td> <input type=\'text\' name=\'title\' id\'title\' value=\'" + rs.getString("TITLE") + "\'></td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>내용</th>");
	out.print("<td> <textarea rows=\'10\' cols=\'40\' name=\'content\' id=\'content\''>" + rs.getString("CONTENT") + "</textarea> </td>");
	out.print("</tr>");
%>
	</table>
	<br>
	<button type="submit">확인</button>
	<%-- <a href="update.jsp?idx=<%=rs.getString("IDX")%>">확인 </a> --%> 
	</form>
	<a href="content.jsp?idx=<%=rs.getString("IDX")%>">취소 </a>
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