<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.*" %>
<%-- jsp comment element --%>    
<!-- html comment tag -->
<%
	Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>

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
</body>
</html>