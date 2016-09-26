<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>BoardList</h1>
	<table class="table table-striped">
		<tr>
			<th>boardArticleNo</th>
			<th>boardArticleTitle</th>
		</tr>

		<c:forEach var="list" items="${boardArticleList}">
			<tr>
				<td>${list.boardArticleNo}</td>
				<td><a href="/boardDetail?boardArticleNo=${list.boardArticleNo}">${list.boardArticleTitle}</a></td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${page>=1}">
			<c:choose>
				<c:when test="${page == startPage}">
				
				</c:when>
				<c:when test="${page>=1}">
					<a href="/?page=${page-10}">이전</a>
				</c:when>								
			</c:choose>
		</c:if>
		
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<a href="/?page=${i}">${i}</a>
		</c:forEach>
		
		<c:if test="${lastPage > endPage}">
			<c:choose>
				<c:when test="${page == lastPage}">
					
				</c:when>
				<c:when test="${lastPage > endPage}">
					<a href="/?page=${page+10}">다음</a>
				</c:when>		
			</c:choose>
		</c:if>
	</div>
</body>
</html>