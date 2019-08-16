<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>  무공이의 게시판 만들기 - 게시글 작성 </title>
<style>
label {
            float: left;
            clear: left;
            width: 7em;
        }
</style>
</head>
<%
    String strUserId = (String)session.getAttribute("userid");
%>
<body>
<h2> 게시글 쓰기 </h2>
	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
	<label for="title">제목 </label>
	<input type ="text" name ="title" id ="title"/><br>
	<label for="writer">작성자 </label>
	<input type ="text" name ="writer" id ="writer" value="<%=strUserId%>" readonly /><br>
	<label for="content">내용 </label>
	<textarea rows="10" cols="40" name="content" id="content"></textarea>	
	<br><br>
    <input type ="submit" name ="submit"/>
    <input type="button" value="BACK" onClick="history.go(-1)">        
	</form>
</body>
</html>