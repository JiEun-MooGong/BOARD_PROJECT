<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 무공이의 게시판 만들기 - 게시글 삭제 </title>
</head>
<script type="text/javascript">
if(confirm("삭제 하시겠습니까?"))
{	
}
esle
{
	location.href=history.go(-1);
	return;
}
</script>
<% 
try
{	
	String strIdx = request.getParameter("idx");
	
	// DB 접속
	String strDN = "oracle.jdbc.driver.OracleDriver"; 
	String url ="jdbc:oracle:thin:board@//localhost:1521/xe";
	Class.forName(strDN);
	Connection con = DriverManager.getConnection(url,"board","board");
		
	//입력
	Statement stmt = con.createStatement();
	String strSql = "DELETE FROM BOARD WHERE IDX = " + strIdx;	
	stmt.executeUpdate(strSql);
	out.println("삭제 되었습니다.");
	
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
<body>

</body>
</html>