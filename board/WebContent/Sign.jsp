<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> ȸ������ </title>
<style>
      table {border-collapse: collapse; }
      th {background-color: yellowgreen; border:1px solid black; padding: 10px; width: 150px;}
      td {border:1px solid black; padding: 10px; width: 400px;}
    </style>
  </head>

  <body>
	<form action="userInsert.jsp" method="post">
      <h2> ȸ������ </h2>
      <br>
      <table>
        <thead>
        </thead>
        <tbody>
          <tr>
            <th> ID </th>
            <td> <input type="text" id="txtUserId" placeholder="USER ID" name="ID" /> </td>
          </tr>
          <tr>
            <th> PASSWORD </th>
            <td> <input type="password" id="txtPass" placeholder="PASSWORD" name="PASSWORD" /> </td>
          </tr>
          <!-- 
          <tr>          
            <th> PASSWORD Ȯ�� </th>
            <td> <input type="password" id="txtPassCk" placeholder="PASSWORD�� �ٽ� �Է����ּ���" onchange="txtPassCk_Change()" name="RE_PASSWORD" />
              <span id = "pnPassCk"></span>
            </td>
          </tr> 
           -->
          <tr>
            <th> �̸� </th>
            <td> <input type="text" id="txtName" name="NAME" /> </td>
          </tr>
          <tr>
            <th> E-mail </th>
            <td> <input type="text" id="txtEmail" name="EMAIL" /> </td>
          </tr>
        </tbody>
      </table>
      <br>
	<button type="submit">Ȯ��</button>
	<input type="button" value="BACK" onClick="history.go(-1)">
    </form>
  </body>

</html>