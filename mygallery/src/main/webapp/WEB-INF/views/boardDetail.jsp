<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#delLink').click(function(){
			submit();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<tr>
			<td>title</td>
			<td>${map["boardArticle"].boardArticleTitle}</td>
		</tr>
		<tr>
			<td>content</td>
			<td>${map["boardArticle"].boardArticleContent}</td>
		</tr>
		<c:if test='${map["boardFiles"].size() > 0}'>
			<c:forEach var="img" items='${map["boardFiles"]}'>
				<tr>
					<td>image</td>
					<td><img src="/upload/${img.boardFileName}.${img.boardFileExt}"></td>
				</tr>
			</c:forEach>
		</c:if>
		<tr>
			<td><a href='/boardDel?boardArticleNo=${map["boardArticle"].boardArticleNo}'>삭제</a></td>
		</tr>
	</table>
</body>
</html>