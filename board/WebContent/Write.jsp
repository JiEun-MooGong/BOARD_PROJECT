<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
	���� : <input type ="text" name ="title"/><br>
	�ۼ��� : <input type ="text" name ="writer"/><br>
	���� : <input type ="text" name ="content"/><br>
    <input type ="submit" name ="submit"/>
	</form>
</body>
</html>