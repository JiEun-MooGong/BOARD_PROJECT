<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> �Խñ� ���� </title>
</head>
<% 
try
{
	String strIdx = request.getParameter("idx");
	
	// DB ����
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
	out.println("db ���� ����");
		
	Statement stmt = con.createStatement();
	String strSql = "";
	//��ȸ��  UP
	strSql = "UPDATE BOARD SET COUNT = COUNT + 1 WHERE IDX = " + strIdx;	
	ResultSet rs = stmt.executeQuery(strSql);
	
	strSql = "SELECT * FROM BOARD WHERE IDX = " + strIdx;	
	rs = stmt.executeQuery(strSql);
	
	while(rs.next())
	{
%>
<body>
<h1>�Խñ�</h1>
	<table border="1">
<% 
	out.print("<tr>");
	out.print("<th>��ȣ</th>");
	out.print("<td>" + rs.getString("IDX") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>�ۼ���</th>");
	out.print("<td>" + rs.getString("WRITER") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>��¥</th>");
	out.print("<td>" + rs.getString("REGDATE") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>��ȸ��</th>");
	out.print("<td>" + rs.getString("COUNT") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>����</th>");
	out.print("<td>" + rs.getString("TITLE") + "</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>����</th>");
	out.print("<td>" + rs.getString("CONTENT") + "</td>");
	out.print("</tr>");
%>
	</table>
	<br>
	<a href="reWrite.jsp?idx=<%=rs.getString("IDX")%>">���� </a>
	<a href="delete.jsp?idx=<%=rs.getString("IDX")%>">���� </a>
	<a href="index.jsp">�������</a>
	</body>
<%
	}

	con.close();

	}
	catch (Exception e)
	{
	out.println("db ����!<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
	}
%>
</html>