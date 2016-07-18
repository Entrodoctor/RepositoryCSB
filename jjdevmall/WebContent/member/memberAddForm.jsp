<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#id').focus();
		$('#btn').click(function(){
			if($('#id').val() == ""){
				$('#idSpan').text('ID를 입력해주세요');
			}else if($('#pw').val() == ""){
				$('#pwSpan').text('PW를 입력해주세요');
			}else if($('#name').val() == ""){
				$('#nameSpan').text('이름을 입력해주세요');
			}else if($('.sex').val() == null){
				$('#sexSpan').text('성별을 선택해주세요');
			}else if($('#age').val() == ""){
				$('#ageSpan').text('나이를 입력해주세요');
			}else if($('#addr').val() == ""){
				$('#addrSpan').text('주소를 입력해주세요');
			}else{
				$('#addForm').submit();
			}
		});
	});
</script>
</head>
<body>
<form id="addForm" action="./memberAddAction.jsp" method="post">
<table>
	<tr>
		<td><label>ID : </label></td>
		<td><input type="text" id="id" name="id"></td>
		<td><span id="idSpan"></span></td>
	</tr>
	<tr>
		<td><label>PW : </label></td>
		<td><input type="password" id="pw" name="pw"></td>
		<td><span id="pwSpan"></span></td>
	</tr>
	<tr>
		<td><label>NAME : </label></td>
		<td><input type="text" id="name" name="name"></td>
		<td><span id="nameSpan"></span></td>
	</tr>
	<tr>
		<td><label>SEX : </label></td>
		<td><input type="radio" class="sex" name="sex" value="male"> 남
			<input type="radio" class="sex" name="sex" value="female"> 여</td>
		<td><span id="sexSpan"></span></td>
	</tr>
	<tr>
		<td><label>AGE : </label></td>
		<td><input type="text" id="age" name="age"></td>
		<td><span id="ageSpan"></span></td>
	</tr>
	<tr>
		<td><label>ADDR : </label></td>
		<td><input type="text" id="addr" name="addr"></td>
		<td><span id="addrSpan"></span></td>
	</tr>
	<tr>
		<td><input type="button" id="btn" name="btn" value="입력"></td>
		<td><span id="btnSpan"></span></td>
	</tr>
</table>			
</form>
</body>
</html>