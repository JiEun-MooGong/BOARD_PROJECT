<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> �α��� </title>
  </head>
  <% 
	request.setCharacterEncoding("euc-kr");
	
	try
	{
		//���� ����
		String strId =  request.getParameter("ID");
		String strPass = request.getParameter("PASSWORD");
		String strName = request.getParameter("NAME");
		
		//��ȿ�� �˻�
		if(strId==""||strId==null)
		{ out.println("ID�� �Է����ּ���.<hr>");
		  out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  return;}
		if(strPass==""||strPass==null)
		{ out.println("��й�ȣ�� �Է����ּ���.<hr>");
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
		strSql += "SELECT * FROM BOARD_USER WHERE USER_ID ='" + strId + "' AND PASSWORD = '" + strPass + "'";		
		ResultSet rs = stmt.executeQuery(strSql);

		while(rs.next())
		{
			strName = rs.getString("NAME");
		}
		
		if(strName==""||strName==null)
		{ out.println("����� ������ �����ϴ�.<hr>");
		  out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  }	
		else
		{
			out.println(strName + "�� ȯ���մϴ�.<hr>");
			session.setAttribute("userid",strId);
			response.sendRedirect("list.jsp");
			//out.print("<input type=\"button\" value=\"OK\" onClick=\"location.href='list.jsp'\">");
		}
		
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