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
	<h1>r.select2.jsp</h1>
	<h2>DB에 저장되어 있는 정보 조회</h2>
	
	<hr><hr>
	<table border="1">
		<tr>
			<th>id</th>
			<th>pw</th>
			<th>name</th>
			<th>gender</th>
			<th>age</th>
			<th>jumin</th>
		</tr>
		
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
	
	//sql작성 & pstmt객체
	String sql = "select * from itwill_member order by id desc";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//sql 실행
	ResultSet rs = pstmt.executeQuery();
	System.out.println(" SQL구문 실행 완료! ");

	// 데이터처리
	while(rs.next()){
	String id = rs.getString("id");
	String pw = rs.getString("pw");
	String name = rs.getString("name");
	String gender = rs.getString("gender");
	int age = rs.getInt("age");
	String jumin = rs.getString("jumin");
	
	%>	
		
	<tr>
		<td><%=id %></td>
		<td><%=pw %></td>
		<td><%=name %></td>
		<td><%=gender %></td>
		<td><%=age %></td>
		<td><%=jumin %></td>
	</tr>
	<%
	}
	%>
	</table>
	

</body>
</html>
