<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> �Խñ� �ۼ� </title>
<style>
label {
            float: left;
            clear: left;
            width: 7em;
        }
</style>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
	<label for="title">���� </label>
	<input type ="text" name ="title" id ="title"/><br>
	<label for="writer">�ۼ��� </label>
	<input type ="text" name ="writer" id ="writer"/><br>
	<label for="content">���� </label>
	<textarea rows="10" cols="40" name="content" id="content"></textarea>	
	<br><br>
    <input type ="submit" name ="submit"/>    
	</form>
</body>
</html>