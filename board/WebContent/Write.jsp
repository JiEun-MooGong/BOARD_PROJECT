<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 게시글 작성 </title>
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
	<label for="title">제목 </label>
	<input type ="text" name ="title" id ="title"/><br>
	<label for="writer">작성자 </label>
	<input type ="text" name ="writer" id ="writer"/><br>
	<label for="content">내용 </label>
	<textarea rows="10" cols="40" name="content" id="content"></textarea>	
	<br><br>
    <input type ="submit" name ="submit"/>    
	</form>
</body>
</html>