<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>


<!DOCTYPE html>
<html>
<head>
<title> �������� �Խ��� ����� </title>
</head>
<% 
try
{
	// DB ����
//	Context init = new InitialContext();
//  DataSource ds = (DataSource) init.lookup("jdbc/dataSourceTest");
//	Connection con =ds.getConnection();	
//	out.println("db ���� ����");
//  PreparedStatement pstmt=con.prepareStatement(strSql);
//  ResultSet rs = pstmt.executeQuery();

	// DB ����
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
	out.println("db ���� ����");
		
	Statement stmt = con.createStatement();
	String strSql = "";
	strSql += "SELECT * FROM BOARD ORDER BY IDX DESC";	
	ResultSet rs = stmt.executeQuery(strSql);
%>

<body>
<div class="center">
	<h1> �Խñ� </h1>
	<table>
	<tr>
		<th>��ȣ</th>
		<th>����</th>
		<th>�ۼ���</th>
		<th>��¥</th>
		<th>��ȸ ��</th>		
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
	
	<a href="Write.jsp">�۾���</a>
</div>

<%
	// Ŭ����
	con.close();

	}
	catch (Exception e)
	{
	out.println("db ����!<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
	}
%>
</body>
</html>