<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> �������� �Խ��� ����� - ȸ������ </title>
</head>
<% 
	request.setCharacterEncoding("euc-kr");
	
	try
	{
		//���� ����
		String strId =  request.getParameter("ID");
		String strPass = request.getParameter("PASSWORD");
		//String strPassCk = request.getParameter("RE_PASSWORD");
		String strName = request.getParameter("NAME");
		String strEmail = request.getParameter("EMAIL");
		
		//��ȿ�� �˻�
		if(strId==""||strId==null)
		{ out.println("ID�� �Է����ּ���.<hr>");
		  out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  return;}
		if(strPass==""||strPass==null)
		{ out.println("��й�ȣ�� �Է����ּ���.<hr>");
			out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  return;}
		if(strName==""||strName==null)
		{ out.println("�̸��� �Է����ּ���.<hr>");
			out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  return;}		
		
		// DB ����
		String strDN = "oracle.jdbc.driver.OracleDriver"; 
		String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
		Class.forName(strDN);
		Connection con = DriverManager.getConnection(url,"board","board");
		out.println("db ���� ����");
		
		//�Է�
		Statement stmt = con.createStatement();
		String strSql = "";
		strSql += "INSERT INTO BOARD_USER";
		strSql += "(USER_ID, PASSWORD, NAME, EMAIL)";
		strSql += "VALUES('"+strId+"', '"+strPass+"','"+strName+"','"+strEmail+"')";
		stmt.executeUpdate(strSql);
		out.println("db ���� �Ϸ� �Ǿ����ϴ�.");
		out.print("<script>location.href='Login.html';</script>");
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
<body>
</body>
</html>