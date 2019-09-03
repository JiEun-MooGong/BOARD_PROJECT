<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 무공이의 게시판 만들기 - 댓글 저장 </title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	//변수 선언
	String strIdx = request.getParameter("idx");
	String strContent = request.getParameter("content");
	String strUserId = (String)session.getAttribute("userid");
	int iSeq = 0;	
	
	//유효성 검사
	if(strContent==""||strContent==null)
	{ out.println("내용을 입력해주세요.<hr>");
		out.print("<input type=\"button\" value=\"BACK\" onClick=\"history.go(-1)\">");
	  return;
	  }
	
	try
	{
		// DB 접속
		String strDN = "oracle.jdbc.driver.OracleDriver"; 
		String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
		Class.forName(strDN);
		Connection con = DriverManager.getConnection(url,"board","board");
		
		//입력
		Statement stmt = con.createStatement();
		String strSql = "";
		strSql = "SELECT SEQ FROM BOARD_COMMENT WHERE LV = 1 AND ID = '" + strUserId + "' AND IDX = " + strIdx;	
		ResultSet rs = stmt.executeQuery(strSql);
		out.println(strSql);
		while(rs.next())
		{	
			iSeq = Integer.parseInt(rs.getString("SEQ"));
		}
		
		iSeq = iSeq + 1;
		
		strSql = "";
		strSql += "INSERT INTO BOARD_COMMENT";
		strSql += "(LV, SEQ, ID, COMMENTS, IDX)";
		strSql += "VALUES(1, " + iSeq + ",'" + strUserId + "','" + strContent + "'," + strIdx + ")";
		out.println(strSql);
		stmt.executeUpdate(strSql);
		out.println("글 등록 완료.");
		
		// 클로즈
		con.close();
	}
	catch (Exception e)
	{
		out.println("db 에러!<hr>");
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