<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	
	//단위테스트 코드
	System.out.println(id + "<-- id / memberAddAction.jsp");
	System.out.println(pw + "<-- pw / memberAddAction.jsp");
	System.out.println(name + "<-- name / memberAddAction.jsp");
	System.out.println(sex + "<-- sex / memberAddAction.jsp");
	System.out.println(age + "<-- age / memberAddAction.jsp");
	System.out.println(addr + "<-- addr / memberAddAction.jsp");
	
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=UTF8";
	String dbUser = "root";
	String dbPw = "java0000";
	String driver = "com.mysql.jdbc.Driver";
	
	try{
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, dbUser, dbPw);
		conn.setAutoCommit(false);
		
		String sql1 = "INSERT INTO member (member_id, member_pw, member_name, member_sex, member_age) VALUES (?, ?, ?, ?, ?)";
		pstmt1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
		pstmt1.setString(1, id);
		pstmt1.setString(2, pw);
		pstmt1.setString(3, name);
		pstmt1.setString(4, sex);
		pstmt1.setInt(5, age);
		
		pstmt1.executeUpdate();
		
		rs = pstmt1.getGeneratedKeys();
		int lastKey = 0;
		if(rs.next()){
			lastKey = rs.getInt(1);
			System.out.println(lastKey);	
		}
		String sql2 = "INSERT INTO address (member_no, member_addr) VALUES (?, ?)";
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setInt(1, lastKey);	
		pstmt2.setString(2, addr);
		pstmt2.executeUpdate();
		
		conn.commit();

	}catch(Exception e){
		conn.rollback();
		e.printStackTrace();
	}finally{
		rs.close();
		pstmt1.close();
		pstmt2.close();
		conn.close();
	}
		
%>
</body>
</html>