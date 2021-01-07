<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.List" %>
<%@ page import = "com.javaex.dao.PhoneDao" %>
<%@ page import = "com.javaex.vo.PersonVo" %>

<%
	//Attribute!! ("이름",값) 이름이 "이름"인 속성의 값을 value로 지정
	//1명의 정보만 가져온다
	PersonVo personVo = (PersonVo)request.getAttribute("personVO");

%>


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

	<form action="/phonebook2/pbc" method="get">
		이름(name): <input type="text" name="name" value="<%=personVo.getName() %>"> <br>
		핸드폰(hp): <input type="text" name="hp" value="<%=personVo.getHp()%>"> <br>
		회사(company): <input type="text" name="company" value="<%=personVo.getCompany()%>"> <br>
		<input type="hidden" name="personId" value="<%=personVo.getPersonId() %>"> <br>
		<input type="hidden" name="action" value="update"> <br>
		<button type="submit">수정</button>
	</form>
</body>
</html>