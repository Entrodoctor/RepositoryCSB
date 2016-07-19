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
			<td>상품명</td>
			<td>정가</td>
			<td>할인률</td>
		</tr>

<%
	request.setCharacterEncoding("UTF-8");
	
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=UTF8";
	String dbUser = "root";
	String dbPw = "java0000";
	String driver = "com.mysql.jdbc.Driver";
	String sql = "SELECT * FROM item";
	
	try{
		
		Class.forName(driver);
		connection = DriverManager.getConnection(url, dbUser, dbPw);
		statement = connection.prepareStatement(sql);
		
		resultSet = statement.executeQuery();
		
		while(resultSet.next()){
%>
			<tr>
				<td><%=resultSet.getInt("item_no") %></td>
				<td><%=resultSet.getString("item_name") %></td>
				<td><%=resultSet.getInt("item_price") %></td>
				<td><%=resultSet.getDouble("item_rate") %></td>
				<td><a href="<%=request.getContextPath()%>/orders/ordersAddForm.jsp?send_no=<%=resultSet.getInt("item_no")%>">주문</a></td>
			</tr>

<%
		}
				
	}catch (Exception e){

	}finally{
	
	}
%>			
</table>
</body>
</html>