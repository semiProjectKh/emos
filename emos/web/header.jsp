<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<%
	Member member = (Member) session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#menubar {
			border : 1px orange solid;
			position: fixed;
			top: 0px;
			height: 120px;
			width: 70%;
			background: white;
	}

	#menu li{
			list-style: none;
			float : left;
			margin: 1.5px;
	}

	#menu li a{
			text-decoration:none;
	}

	#hr {
			clear: left;
	}

	#main {
			margin-top: 125px;
	}

	body {
			width: 70%;
			left: 15%;
			position: relative;
	}
  </style>
  
</head>
<body>
<div class=header">
	<ul id="menu">
		<li><a href="/e/views/product.jsp">상품관리</a></li>
		<li><a href="/e/views/sales.jsp">매출관리</a></li> 
		<li><a href="">테이블설정</a></li> 
		<li><a href="">쿠폰/적립금</a></li>
		&nbsp; &nbsp; &nbsp;
		<li><a href="/e/rdetail?">테스트용 리뷰</a>
	</ul>
	
	<!-- ( 1 ) -->
	<!-- 
	<table align=right>
	<tr><td>아이디</td><td><input type=text size=12 name=id></td><td><input type=submit value=로그인></td></tr>
	<tr><td>비밀번호</td><td><input type=password size=12 name=pwd></td><td><a href="" >회원가입</a></td></tr>
	</table>
	 -->
	<% if(member == null){ %>
	<form action=/e/login method=post>
	<!-- ( 2 ) -->
	<table align=right>
	<tr><td>아이디</td><td><input type='text' size=11 name='id'></td><td>비밀번호</td><td><input type=password size=12 name='pwd'></td><td><input type=submit value=로그인></td><td><a href="" >회원가입</a></td></tr>
	</table>
	</form>
	<% }else{ %>
	<table align=right>
	<tr><td><%= member.getUserName() %> 님</td><td>마이페이지</td><td><a href="/e/logout">로그아웃</a></td></tr>
	</table>
	<% } %>
</div>
</body>
</html>