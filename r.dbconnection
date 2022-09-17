<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<h1>r.dbConnection.jsp</h1>
	
	<h2>JDBC( Java DataBase Connectivity ) : 자바와 DB(Mysql)를 연결하는 API(라이브러리)</h2>

	<%
	// 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로드 성공!");
	
	// 디비 연결
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	System.out.println(" 디비 연결 성공! ");
	
	// sql 작성
	
	
	%>	
</body>
</html>
