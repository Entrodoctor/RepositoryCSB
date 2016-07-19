<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#orderAddBtn').click(function(){
			$('#orderAddForm').submit();
		});
		$('#ordersSelect').change(function(){
			$('#totalSpan').text(($(Number('#realPrice')).text())*$('#ordersSelect').val()); //수정중
		});
	});
</script>	
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=UTF8";
	String dbUser = "root";
	String dbPw = "java0000";
	String driver = "com.mysql.jdbc.Driver";
	String sql = "SELECT * FROM item where item_no = ?";

	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	int itemNo = Integer.parseInt(request.getParameter("send_no"));
	System.out.println(sessionMemberId);
	System.out.println(itemNo);
	
	if(sessionMemberId == null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	} else {	
		// SELECT JDBC 코드
		Class.forName(driver);
		connection = DriverManager.getConnection(url, dbUser, dbPw);
		statement = connection.prepareStatement(sql);
		statement.setInt(1, itemNo);
		
		resultSet = statement.executeQuery();
		while(resultSet.next()){
			
			int itemPrice = resultSet.getInt("item_price");
			double itemRate = resultSet.getDouble("item_rate");
			double realPrice = itemPrice*(1-itemRate);
			System.out.println(itemPrice);
			System.out.println(itemRate);
%>
		<form id="orderAddForm" action="<%=request.getContextPath()%>/orders/ordersAddAction.jsp">
			<div>
				itemNo : 
				<input type="text" value="<%=itemNo%>" readonly="readonly"/>
			</div>
			<div>
				itemPrice :
				<del><span id="itemPrice"><%=itemPrice%>원</span></del> 
				->
				<span id="realPrice"><%=realPrice%>원</span>
				<span id="itemRate">(할인율:<%=itemRate%>)</span>
			</div>		
			<div>
				ordersQuantity :
				<select id="ordersSelect">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<div>
				total :<span id = "totalSpan"></span>
			</div>
			<div>
				<input type="button" id="orderAddBtn" value="주문"/>
			</div>
		</form>
<%
		}
	}
%>
</body>
</html>