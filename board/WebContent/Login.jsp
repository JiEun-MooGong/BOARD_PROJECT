<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 로그인 </title>
  </head>
  <% 
	request.setCharacterEncoding("euc-kr");
	
	try
	{
		//변수 선언
		String strId =  request.getParameter("ID");
		String strPass = request.getParameter("PASSWORD");
		String strName = request.getParameter("NAME");
		
		//유효성 검사
		if(strId==""||strId==null)
		{ out.println("ID을 입력해주세요.<hr>");
		  out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  return;}
		if(strPass==""||strPass==null)
		{ out.println("비밀번호를 입력해주세요.<hr>");
			out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  return;}		
		
		// DB 접속
		String strDN = "oracle.jdbc.driver.OracleDriver"; 
		String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
		Class.forName(strDN);
		Connection con = DriverManager.getConnection(url,"board","board");
		out.println("db 접속 성공");
		
		//입력
		Statement stmt = con.createStatement();
		String strSql = "";
		strSql += "SELECT * FROM BOARD_USER WHERE USER_ID ='" + strId + "' AND PASSWORD = '" + strPass + "'";		
		ResultSet rs = stmt.executeQuery(strSql);

		while(rs.next())
		{
			strName = rs.getString("NAME");
		}
		
		if(strName==""||strName==null)
		{ out.println("사용자 정보가 없습니다.<hr>");
		  out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
		  }	
		else
		{
			out.println(strName + "님 환영합니다.<hr>");
			session.setAttribute("userid",strId);
			response.sendRedirect("list.jsp");
			//out.print("<input type=\"button\" value=\"OK\" onClick=\"location.href='list.jsp'\">");
		}
		
		// 클로즈
		con.close();
	}
	catch (Exception e)
	{
		out.println("db 에러!<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
  <body> 
 
</body>
</html>