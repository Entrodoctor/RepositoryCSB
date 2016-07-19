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
	
	String adminId = request.getParameter("adminLoginId");
	String adminPw = request.getParameter("adminLoginPw");
	System.out.println(adminId + "<--adminId /adminLoginAction.jsp");
	System.out.println(adminPw + "<--adminPw /adminLoginAction.jsp");
	
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=UTF8";
	String dbUser = "root";
	String dbPw = "java0000";
	String driver = "com.mysql.jdbc.Driver";
	String sql = "SELECT * FROM admin WHERE admin_id = ? AND admin_pw = ?";
	
	try{
		
		Class.forName(driver);
		connection = DriverManager.getConnection(url, dbUser, dbPw);
		statement = connection.prepareStatement(sql);
		statement.setString(1, adminId);
		statement.setString(2, adminPw);
		
		resultSet = statement.executeQuery();
		
		if(resultSet.next()) {
			System.out.println("관리자 로그인 성공");
			// 세션에 아이디값 저장
			session.setAttribute("sessionAdminId", resultSet.getString("admin_id"));
		} else {
			System.out.println("관리자 로그인 실패");
		}
	} catch (Exception e) {
		
	} finally {
		
	}
	// 로그인 성공,실패에 상관없이 adminIndex.jsp로 이동
	response.sendRedirect(request.getContextPath() + "/admin/adminIndex.jsp");
%>
</body>
</html>