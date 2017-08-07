<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" method="post">
<table>
<!-- no는 시퀀스로 처리 -->
<tr><td>핸드폰번호</td><td></td></tr>
<tr><td>이 름</td><td></td></tr>
<tr><td>비밀번호</td><td></td></tr>
<tr><td>비밀번호확인</td><td></td></tr>
<tr><td>생 일</td><td></td></tr>
<tr><td>성 별</td><td></td></tr>
<tr><td>회원구분</td><td><input type="radio" name="type" value="1"> 일반회원 <input type="radio" name="type" value="2"> 기업회원</td></tr>
<!-- 경고(verse)는 일반회원에게 선택권한 없음 -->
<%-- <% if(type == 2){ %>
<tr><td>상호명</td><td></td></tr>
<tr><td>매장연락처</td><td></td></tr>
<tr><td>대표자명</td><td></td></tr>
<tr><td>매장주소</td><td></td></tr>
<tr><td>QR코드</td><td></td></tr>
<% } %> --%>
</table>
</form>
</body>
</html>