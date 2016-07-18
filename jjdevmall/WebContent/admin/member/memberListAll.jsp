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
		<td>NO.</td>
		<td>ID</td>
		<td>PW</td>
		<td>NAME</td>
		<td>SEX</td>
		<td>AGE</td>
	</tr>

<%
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT member_no, member_id, member_pw, member_name, member_sex, member_age FROM member";
	
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=UTF8";
	String dbUser = "root";
	String dbPw = "java0000";
	String driver = "com.mysql.jdbc.Driver";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, dbUser, dbPw);	
	pstmt = conn.prepareStatement(sql);
	 
	rs = pstmt.executeQuery();
	
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getInt("member_no") %></td>
		<td><%=rs.getString("member_id") %></td>
		<td><%=rs.getString("member_pw") %></td>
		<td><%=rs.getString("member_name") %></td>
		<td><%=rs.getString("member_sex") %></td>
		<td><%=rs.getInt("member_age") %></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>