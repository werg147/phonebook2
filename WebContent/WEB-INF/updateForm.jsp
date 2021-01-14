<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>전화번호 수정화면</h1>
	
	<p>
		수정화면 입니다. <br>
		아래 항목을 수정하고 "수정" 버튼을 클릭하세요.
	</p>

	<!-- request.getAttribute("personVO"); -->
	<form action="/phonebook2/pbc" method="get">
		이름(name): <input type="text" name="name" value="${personVO.name}"> <br>
		핸드폰(hp): <input type="text" name="hp" value="${personVO.hp}"> <br>
		회사(company): <input type="text" name="company" value="${personVO.company}"> <br>
		<input type="hidden" name="personId" value="${personVO.company}"> <br>
		<input type="hidden" name="action" value="update"> <br>
		<button type="submit">수정</button>
	</form>
</body>
</html>