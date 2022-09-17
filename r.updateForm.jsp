<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>r.updateForm.jsp</h1>
	<h2>정보수정 페이지</h2>
	
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");

	// 디비연결정보 (상수)
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	//드라이버로드
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!");
	// 디비연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
    System.out.println(" 디비 연결 성공! "+con);
	// sql 작성 &pstmt
	String sql = "select * from itwill_member where id='ckgydnjs11'"; 
	PreparedStatement pstmt = con.prepareStatement(sql);
	// sql 실행
	ResultSet rs = pstmt.executeQuery();
	
	String name = "";
	String gender = "";
	// 데이터처리
	if(rs.next()){
		name = rs.getString("name");
		gender = rs.getString("gender");
	}
	%>
	
	<form action = "r.updatePro.jsp" method="post">
		<input type="hidden" name="id" value="ckgydnjs11"><br>
		이름 : <input type="text" name="name" value="<%=name %>"><br>
		성별 : <input type= "text" name="gender" value="<%=gender %>"><br>
	
		<input type="submit" value="디비에 수정하기">
	</form>
</body>
</html>
