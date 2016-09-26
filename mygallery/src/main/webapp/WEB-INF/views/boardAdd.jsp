<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$('#boardAdd').click(function(){
			$('.boardImg').each(function(item, index){
				if($(this).val() == ""){
					$(this).remove();
				}
			});
			$('#boardAddForm').submit();
		});
		
		$('#fileAdd').click(function(){
			var flag = true;
			$('.boardImg').each(function(item, index){
				if($(this).val() == ""){
					flag = false;
				}
			});
			if(flag) {
				$('#fileSection').append('<div><input class="boardImg" multiple="multiple" type="file" class="form-control" name="boardImage"/></div>')	
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1>BOARD ADD</h1>
	<form id="boardAddForm" action="/boardAdd" method="post" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
				<td>TITLE</td>
				<td><input type="text" class="form-control" name="boardTitle" value="${boardRequest.boardTitle}"/></td>
			</tr>
			<tr>
				<td>CONTENT</td>
				<td><input type="text" class="form-control" name="boardContent" value="${boardRequest.boardContent}"/></td>
			</tr>
			<tr>
				<td>IMAGE</td>				
				<td>
					<input type="button" value="입력" id="fileAdd"/>
					<span>${msg}</span>
					<div id="fileSection">									
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="button" value="입력" id="boardAdd"/></td>
			</tr>			
		</table>
	</form>
	</div>
</body>
</html>