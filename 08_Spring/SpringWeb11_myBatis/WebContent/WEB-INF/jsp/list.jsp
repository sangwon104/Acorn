<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css'></c:url>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<c:url value='/resources/js/main.js'></c:url>"></script>
<!-- jstl을 사용해서 경로를 입력하면 프로젝트 명이 변경되도 자동으로 변경되어 url에 적용된다. -->

</head>
<body>
	<table>
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>부서위치</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.deptno }</td>
				<td>${vo.dname }</td>
				<td>${vo.loc }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3">
				<input type="button" value="부서추가" />
			</td>
		</tr>
	</table>

</body>
</html>