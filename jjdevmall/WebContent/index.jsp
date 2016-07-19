<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#loginBtn').click(function(){
			$('#loginForm').submit();
		});
	});
</script>
</head>
<body>
<h1>INDEX</h1>
<%
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	if(sessionMemberId == null) { // 로그인이 안된 상태
%>
		<form id="loginForm" action="<%=request.getContextPath()%>/member/loginAction.jsp">
			<!-- 로그인 폼 구현 -->
			<div>
				<label>ID : </label>
				<input type="text" id="member_id" name="member_id"/>
			</div>
			<div>
				<label>PW : </label>
				<input type="text" id="member_pw" name="member_pw"/>
			</div>	
			<div>
				<input type="button" id="loginBtn" value="로그인"/>
			</div>			
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<%=sessionMemberId%>님 반갑습니다.
		
		<a href="<%=request.getContextPath()%>/member/memberOne.jsp?send_id=<%=sessionMemberId%>">[회원정보]</a>
		<a href="<%=request.getContextPath()%>/member/memberLogout.jsp">[로그아웃]</a>
		<a href="<%=request.getContextPath()%>/item/itemList.jsp">[상품정보]</a>
<%		
	}
%>
</body>
</html>