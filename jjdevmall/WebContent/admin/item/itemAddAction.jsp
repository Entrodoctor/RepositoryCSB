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
	PreparedStatement pstmt = null;

	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	double rate = Double.parseDouble(request.getParameter("rate"));
	
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=UTF8";
	String dbUser = "root";
	String dbPw = "java0000";
	String driver = "com.mysql.jdbc.Driver";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	
	String sql = "INSERT INTO item (item_name, item_price, item_rate) VALUES (?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, price);
	pstmt.setDouble(3, rate);
	
	pstmt.executeUpdate();
%>
</body>
</html>