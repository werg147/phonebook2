<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>전화번호 리스트</h1>
	
	<p>
		입력한 전화번호 내역입니다.
	</p>
	
	<!-- request.getAttribute("pList"); -->
	<c:forEach items="${pList}" var="pList">
		<table border="1">
			<tr>
				<td>이름(name)</td>
				<td>${pList.name}</td>
			</tr>
			<tr>
				<td>핸드폰(hp)</td>
				<td>${pList.hp}</td>
			</tr>
			<tr>
				<td>회사(company)</td>
				<td>${pList.company}</td>
			</tr>
			<tr>
				<td><a href="/phonebook2/pbc?action=upform&personId=${pList.personId}">수정</a></td>
				<td><a href="/phonebook2/pbc?action=delete&personId=${pList.personId}">삭제</a></td>
				<!-- !!!!id값 넘기는걸 깜빡했었다..(컨트롤러 오류창에 값이 null로 뜸/값을 보내는 페이지에서 문제있던것) 주의할것 !!!!-->
			</tr>
		</table>
		<br>
	</c:forEach>
	
	<a href="/phonebook2/pbc?action=wform">추가번호 등록</a>


</body>
</html>