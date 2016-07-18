<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, td { border: 1px solid black; }
</style>
</head>
<body>
<table>
	<tr>
		<td>주소</td>
	</tr>
<%
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from address where member_no = ?";
	int send_no = Integer.parseInt(request.getParameter("send_no"));
	System.out.println(send_no);
	
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=UTF8";
	String dbUser = "root";
	String dbPw = "java0000";
	String driver = "com.mysql.jdbc.Driver";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, dbUser, dbPw);	
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, send_no);
	 
	rs = pstmt.executeQuery();
	
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("member_addr") %></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>