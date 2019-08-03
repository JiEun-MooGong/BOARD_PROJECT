<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
	제목 : <input type ="text" name ="title"/><br>
	작성자 : <input type ="text" name ="writer"/><br>
	내용 : <input type ="text" name ="content"/><br>
    <input type ="submit" name ="submit"/>
	</form>
</body>
</html>