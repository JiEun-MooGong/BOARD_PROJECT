<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> �������� �Խ��� ����� - �Խñ� ��� </title>
<% 

	request.setCharacterEncoding("euc-kr");

	//���� ����
	int idx = 1;
	String strTitle = request.getParameter("title");
	String strWriter = request.getParameter("writer");
	String strContent = request.getParameter("content");
	int iCnt = 31;
	
	//��ȿ�� �˻�
	if(strTitle==""||strTitle==null)
	{ out.println("������ �Է����ּ���.<hr>");
	  out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
	  return;}
	if(strWriter==""||strWriter==null)
	{ out.println("�ۼ��ڸ� �Է����ּ���.<hr>");
		out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
	  return;}
	if(strContent==""||strContent==null)
	{ out.println("������ �Է����ּ���.<hr>");
		out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
	  return;}
	
	try
	{
		// DB ����
		String strDN = "oracle.jdbc.driver.OracleDriver"; 
		String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
		Class.forName(strDN);
		Connection con = DriverManager.getConnection(url,"board","board");
		
		//�Է�
		Statement stmt = con.createStatement();
		String strSql = "";
		strSql += "INSERT INTO BOARD";
		strSql += "(IDX, TITLE,WRITER,REGDATE,COUNT,CONTENT)";
		strSql += "VALUES(BOARD_SEQ.NEXTVAL, '"+strTitle+"','"+strWriter+"',(SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL),1,'"+strContent+"')";
		stmt.executeUpdate(strSql);
		out.println("�� ��� �Ϸ�.");
		
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
		out.print("<script>location.href='list.jsp';</script>");
	}
%>
</head>
<body>
</body>
</html>