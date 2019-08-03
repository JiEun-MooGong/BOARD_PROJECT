<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<% 

	request.setCharacterEncoding("euc-kr");

	//변수 선언
	int idx = 1;
	String strTitle = request.getParameter("title");
	String strWriter = request.getParameter("writer");
	String strContent = request.getParameter("content");
	int iCnt = 31;
	
	//유효성 검사
	if(strTitle==""||strTitle==null)
	{ out.println("제목을 입력해주세요.");}
	if(strWriter==""||strWriter==null)
	{ out.println("작성자를 입력해주세요.");}
	if(strContent==""||strContent==null)
	{ out.println("내용을 입력해주세요.");}
	
	try
	{
		// DB 접속
		String strDN = "oracle.jdbc.driver.OracleDriver"; 
		String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
		Class.forName(strDN);
		Connection con = DriverManager.getConnection(url,"board","board");
		out.println("db 접속 성공");
		
		//입력
		Statement stmt = con.createStatement();
		String strSql = "";
		strSql += "INSERT INTO BOARD";
		strSql += "(IDX, TITLE,WRITER,REGDATE,COUNT,CONTENT)";
		strSql += "VALUES(BOARD_SEQ.NEXTVAL, '"+strTitle+"','"+strWriter+"',(SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL),1,'"+strContent+"')";
		stmt.executeUpdate(strSql);
		out.println("db 저장 완료 되었습니다.");
		
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
		out.print("<script>location.href='index.jsp';</script>");
	}
%>




</head>
<body>

</body>
</html>