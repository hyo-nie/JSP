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
	<h1>r.insertPro2.jsp</h1>
	
	<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String jumin = request.getParameter("jumin");
	int age = Integer.parseInt(request.getParameter("age"));
	%>
	
	아이디 : <%=id %><br>
	비밀번호 : <%=pw %><br>
	이름 : <%=name %><br>
	성별 : <%=gender %><br>
	주민번호 : <%=jumin %><br>
	나이 : <%=age %><br>
	
	<h2>전달받은 정보를 DB에 저장</h2>
	<%
	   // 디비연결정보 (상수)
	   final String DRIVER = "com.mysql.cj.jdbc.Driver";
	   final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	   final String DBID = "root";
	   final String DBPW = "1234";
	   
	   // 드라이버 로드 
	   Class.forName(DRIVER);
	   System.out.println("드라이버 로드 성공!");
	   // 디비 연결
	   Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	   System.out.println(" 디비 연결 성공! ");
	   System.out.println(" con : "+con);
	   //sql작성 & pstmt
	   String sql = "insert into itwill_member(id,pw,name,age,gender,jumin) values(?,?,?,?,?,?)";
	   System.out.println(" SQL 구문 작성완료! ");
	   PreparedStatement pstmt = con.prepareStatement(sql);
	   System.out.println(" pstmt 객체 생성 완료! ");
	   
	   //???
			   
	   pstmt.setString(1, id);
	   pstmt.setString(2,pw);
	   pstmt.setString(3, name);
	   pstmt.setInt(4, age);
	   pstmt.setString(5, gender);
	   pstmt.setString(6, jumin);
	   
	   pstmt.executeUpdate();
	   System.out.println(" SQL 실행 완료! ");
	   
	   response.sendRedirect("r.select2.jsp");
	
	%>
	
</body>
</html>
