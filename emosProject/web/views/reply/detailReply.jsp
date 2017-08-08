<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member, reply.model.vo.Reply, java.util.*"%>
<%
	Member member = (Member) session.getAttribute("member");
	ArrayList<Reply> reply = (ArrayList<Reply>)request.getAttribute("detailList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<h1>내 댓글 상세보기</h1>
	<ul>
	<% for(Reply r : reply) {%>
	<li><%= r.getContent() %> <%= r.getGood() %> <%= r.getReplyDate() %><%= r.getPoint() %></li>
	<%} %>
	</ul>
</body>
</html>