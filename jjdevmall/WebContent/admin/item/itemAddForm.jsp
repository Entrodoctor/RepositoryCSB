<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			if($('#name').val() == ""){
				$('#nameSpan').text('이름을 제대로 입력해주세요');
			}else if($('#price').val() == "" || isNaN($('#price').val())){
				$('#priceSpan').text('가격을 제대로 입력해주세요');
				$('#nameSpan').text('');
			}else if($('#rate').val() == "" || isNaN($('#rate').val()) || $('#rate').val() > 1){
				$('#rateSpan').text('할인율을 제대로 입력해주세요');
				$('#priceSpan').text('');
			}else{
				$('#addForm').submit();
				$('#rateSpan').text('');
			}
		});
	});
</script>
</head>
<body>
<h1>상품등록화면</h1>
<form id="addForm" action="./itemAddAction.jsp" method="post">
<table>
	<tr>
		<td><label>NAME : </label></td>
		<td><input type="text" id="name" name="name"></td>
		<td><span id="nameSpan"></span></td>
	</tr>
	<tr>
		<td><label>PRICE : </label></td>
		<td><input type="text" id="price" name="price"></td>
		<td><span id="priceSpan"></span></td>
	</tr>
	<tr>
		<td><label>RATE : </label></td>
		<td><input type="text" id="rate" name="rate"></td>
		<td><span id="rateSpan"></span></td>
	</tr>
	<tr>
		<td><input type="button" id="btn" name="btn" value="입력"></td>
		<td><span id="btnSpan"></span></td>
	</tr>
</table>	
</form>
</body>
</html>