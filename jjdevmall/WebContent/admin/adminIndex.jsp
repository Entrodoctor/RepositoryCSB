<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminIndex</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#adminLoginBtn').click(function(){
			$('#adminLoginForm').submit();
		});
	});
</script>
</head>
<body>
<h1>ADMIN INDEX</h1>
<%
	String sessionAdminId = (String)session.getAttribute("sessionAdminId");
	if(sessionAdminId == null) { // 로그인이 안된 상태
%>
		<form id="adminLoginForm" action="<%=request.getContextPath()%>/admin/member/adminLoginAction.jsp">
			<div>
				<label>관리자ID : </label>
				<input type="text" id="adminLoginId" name="adminLoginId"/>
			</div>
			<div>
				<label>관리자PW : </label>
				<input type="text" id="adminLoginPw" name="adminLoginPw"/>
			</div>	
			<div>
				<input type="button" id="adminLoginBtn" value="관리자 로그인"/>
			</div>
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<%=sessionAdminId%>님 반갑습니다.
		<ol>
			<li><a href="<%=request.getContextPath()%>/admin/member/adminLogout.jsp">로그아웃</a>
			<li><a href="<%=request.getContextPath()%>/admin/item/itemList.jsp">상품관리</a></li>
			<li><a href="">주문관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/member/memberListAll.jsp">회원관리</a></li>
		</ol>
<%		
	}
%>
</body>
</html>