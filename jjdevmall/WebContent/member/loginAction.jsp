<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	String memberId = request.getParameter("member_id");
	String memberPw = request.getParameter("member_pw");
	System.out.println(memberId + "<-- memberId / loginAction.jsp");
	System.out.println(memberPw + "<-- memberPw / loginAction.jsp");
	
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=UTF8";
	String dbUser = "root";
	String dbPw = "java0000";
	String driver = "com.mysql.jdbc.Driver";
	String sql = "SELECT * FROM member WHERE member_id = ? AND member_pw = ?";
		
	try{
		
		Class.forName(driver);
		connection = DriverManager.getConnection(url, dbUser, dbPw);
		statement = connection.prepareStatement(sql);
		statement.setString(1, memberId);
		statement.setString(2, memberPw);
		
		resultSet = statement.executeQuery();
		
		if(resultSet.next()) {
			System.out.println("로그인 성공");
			// 세션에 아이디값 저장
			session.setAttribute("sessionMemberId", resultSet.getString("member_id"));
		} else {
			System.out.println("로그인 실패");
		}
		
	} catch (Exception e) {

	} finally {
		
	}
	// 로그인 성공,실패에 상관없이 index.jsp로 이동
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
</body>
</html>