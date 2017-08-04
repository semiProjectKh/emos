<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%
	Member member = (Member) session.getAttribute("member");
%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>eMos 내 정보수정</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../../css/style.css">
<script type="text/javascript">
    function logout(){
    	location.href="/emos/elogout";
    }
    

</script>
</head>

<body>
<header id="header02">
		<a href="../../index.jsp"> <img id="logo2"
			src="../../image/logo/logo.png"></a> <label id="location"></label>
		<div class="w3-display-right" style="margin-right: 20px">
			<button class="w3-button"
				style="color: white; border: solid 1px white; border-radius: 3px"
				onclick="logout();">로그아웃</button>
		</div>
	</header>

<form action="/emos/eupdate" method="post">
<table width="600" cellspacing="5" bgcolor="#3399ff">
<tr><td width="150">아이디</td>
	<td width="450"><input type="text" name="userid" value="<%= member.getUserId() %>" readonly></td></tr>
<tr><td>이 름</td><td><input type="text" name="name" value="<%= member.getUserName() %>" readonly></td></tr>
<% if(member.getGender().equals("m")){%>
<tr><td>생년월일 /성별</td><td><input type="text" name="birth" value="<%= member.getBirth()%> (남)" readonly></td></tr>
<%} else {%>
<tr><td>생년월일/성별 </td><td><input type="text" name="birth" value="<%= member.getBirth()%> (여)" readonly></td>
<%} %>
</tr>

<tr><td>암 호</td><td><input type="password" name="userpwd" id="userpwd"></td></tr>
<tr><td>암호확인</td><td><input type="password" name="userpwd2" id="userpwd2"></td></tr>
<tr><td>이메일</td><td><input type="email" name="email" value=<%= member.getEmail() %>></td></tr>
<tr><td>전화번호</td><td><input type="tel" name="phone" value=<%= member.getPhone() %>></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" class="btn btn-default" value="수정하기"> &nbsp;
	<a href="/emos/edelete?userid=<%= member.getUserId() %>" class="btn btn-default">탈퇴하기</a>
</td>
</tr>
</table>
</form>

</body>
</html>