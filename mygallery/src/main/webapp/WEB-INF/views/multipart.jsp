<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>MultiPart input Test</h1>
	<form action="/multipart" method="post" enctype="multipart/form-data">
		<input type="file" name="pic"/>
		<input type="submit"/>
	</form>
</body>
</html>