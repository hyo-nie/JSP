<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>r.deletePro.jsp</h1>
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");

	// 전달정보 저장
	String id = request.getParameter("id");
	String jumin = request.getParameter("jumin");

	// 디비연결정보 (상수)
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	//드라이버 로드
	Class.forName(DRIVER);
	
	//디비 연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	//sql작성 & pstmt
	String sql = "select jumin from itwill_member where id = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,id);
	
	//sql 실행
	ResultSet rs = pstmt.executeQuery();
	
	//데이터 처리
	if(rs.next()){
		if(jumin.equals(rs.getString("jumin"))){
			sql = "delete from itwill_member where jumin=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, jumin);
			
			pstmt.executeUpdate();
		}else{
			System.out.println("주민번호 오류");
		}
			System.out.println("비회원인데요");
	}
	
	
	%>
	alert("delete 완료!")
	
<!-- 	<a href="r.select.jsp"> -->
</body>
</html>
