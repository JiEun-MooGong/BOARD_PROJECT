<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> ���� </title>
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
		
	//�Է�
	Statement stmt = con.createStatement();
	String strSql = "DELETE FROM BOARD WHERE IDX = " + strIdx;	
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
	out.print("<script>location.href='index.jsp';</script>");
}
%>
<body>

</body>
</html>