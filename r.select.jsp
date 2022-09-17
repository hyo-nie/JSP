<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>r.select.jsp</h1>
	
	<h2>DB에 저장되어 있는 정보 조회</h2>
	
	<%
	// 디비연결정보 (상수)
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	// 드라이버 로드
	Class.forName(DRIVER);
	System.out.println(" 드라이버 로드 성공! ");
	// 디비 연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println(" 디비 연결 성공! ");
	System.out.println(" con : "+con);
	// sql작성 & pstmt객체
	String sql = "select * from itwill_member order by id desc";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	System.out.println(" SQL구문 실행 완료! ");
	
	while(rs.next()){
		String id = rs.getString("id");
		String pw = rs.getString("pw");
		String name = rs.getString("name");
		String gender = rs.getString("gender");
		int age = rs.getInt("age");
		String jumin = rs.getString("jumin");
		
		out.println("id : "+id+"<br>");
		out.println("pw : "+pw+"<br>");
		out.println("name: "+name+"<br>");
		out.println("gender: "+gender+"<br>");
		out.println("age: "+age+"<br>");
		out.println("jumin: "+jumin+"<hr>");
	}
	
	
	%>
</body>
</html>
