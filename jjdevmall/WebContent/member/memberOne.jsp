<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>성별</td>
		<td>나이</td>
	</tr>
<%
	request.setCharacterEncoding("UTF-8");

	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	String sendId = request.getParameter("send_id");
	System.out.println(sendId + "<--sendId / memberOne.jsp");
	
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=UTF8";
	String dbUser = "root";
	String dbPw = "java0000";
	String driver = "com.mysql.jdbc.Driver";
	
	String sql = "SELECT * FROM member WHERE member_id = ?";
	
	Class.forName(driver);
	connection = DriverManager.getConnection(url, dbUser, dbPw);
	statement = connection.prepareStatement(sql);
	statement.setString(1, sendId);
	
	resultSet = statement.executeQuery();
	
	while(resultSet.next()){
%>
	<tr>
		<td><%=resultSet.getInt("member_no") %></td>
		<td><%=resultSet.getString("member_id") %></td>
		<td><%=resultSet.getString("member_pw") %></td>
		<td><%=resultSet.getString("member_name") %></td>
		<td><%=resultSet.getString("member_sex") %></td>
		<td><%=resultSet.getString("member_age") %></td>
	</tr>
<%
	}
%>	
</table>
</body>
</html>