<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>r.insertForm.jsp</h1>
	<h2> 정보입력 페이지 </h2>
	
	<form action="r.insertPro2.jsp">
	아이디 : <input type = "text" name="id"><br>
	비밀번호 : <input type = "password" name="pw"><br>
	이름: <input type="text" name="name"><br>
	성별: <input type="text" name="gender"><br>
	나이: <input type="text" name="age"><br>
	주민번호: <input type="text" name="jumin"><br>
	
	<input type="submit" value="디비에 저장하기"> 
	
	</form>
</body>
</html>
