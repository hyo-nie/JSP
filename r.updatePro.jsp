<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>r.updatePro.jsp</h1>
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// 수정할 데이터 전달
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String id = request.getParameter("id");
	
	%>
	수정할 이름 : <%=name %>, 수정할 성별 : <%=gender %> <hr>
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
	System.out.println(" 디비연결 성공! ");
	//sql 실행 & pstmt
	// ckgydnjs22 유저 존재하는지
	String sql= "select * from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//???
	pstmt.setString(1, id);
	
	//sql 실행
	ResultSet rs = pstmt.executeQuery();
	
	//데이터처리
	if(rs.next()){
	sql = "update itwill_member set name=?, gender=? where id=?";
	pstmt = con.prepareStatement(sql);
	
	//???
	pstmt.setString(1, name);
	pstmt.setString(2, gender);
	pstmt.setString(3, id);
	
	// sql실행
	pstmt.executeUpdate();
	}else{
		System.out.println("비회원임");
	}
	
	%>
</body>
</html>
