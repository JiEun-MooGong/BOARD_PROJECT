<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
</head>
<% 
request.setCharacterEncoding("euc-kr");

String strIdx = request.getParameter("idx");
String strTitle = request.getParameter("title");
String strContent = request.getParameter("content");

try
{	
	// DB ����
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
	out.println("db ���� ����");
	out.println("inext" + strIdx);
	out.println("content" + strContent);
	
	//�Է�
	Statement stmt = con.createStatement();
	String strSql = "";
	strSql += "UPDATE BOARD SET";
	strSql += " TITLE='" + strTitle + "',";
	strSql += " CONTENT='" + strContent + "'";
	strSql += " WHERE IDX = " + strIdx;
	stmt.executeUpdate(strSql);
	out.println("���� �Ǿ����ϴ�.");
	
	// Ŭ����
	con.close();
}
catch (Exception e)
{
	out.println("db ����!<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}
finally
{
	out.print("<script>location.href='content.jsp?idx="+ strIdx +"';</script>");
}
%>
<body>
</body>
</html>