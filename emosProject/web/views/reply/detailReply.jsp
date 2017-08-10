<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member, reply.model.vo.Reply, java.util.*"%>
<%
	ArrayList<Reply> reply = (ArrayList<Reply>)request.getAttribute("detailList");
%>

<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">내 댓글 목록</div>

  <!-- Table -->
  <table class="table">
   <tr><th>내용</th><th>작성일</th><th>좋아요</th></tr>
   <% for(Reply r : reply) {%>
	<tr><td><%= r.getContent() %></td><td><%= r.getReplyDate() %></td><td><%= r.getGood() %></td></tr>
	<%} %>
  </table>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>