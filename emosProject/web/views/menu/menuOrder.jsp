<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="menu.model.vo.Menu, java.util.ArrayList" %>

<%
	ArrayList listType = (ArrayList) request.getAttribute("listType");
	ArrayList<Menu> list = (ArrayList<Menu>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>메뉴판</title>

</head>
<body>
	<div>
		<h1 align="center">메뉴</h1>
	</div>

	<div class="container">
		<h3>Tabs</h3>
		<ul class="nav nav-tabs">
			<% for (int i=0; i<listType.size(); i++) { %>
				<li class="active"><a href="/emos/lmenuview?menuType='<%= listType.get(i) %>'"><%= listType.get(i) %></a></li>
			<% } %>
		</ul>
		<br>
	</div>
	<div>
	  <table class="table table-hover">
    <thead>
      <tr>
        <th>메뉴 이름</th>
        <th>가격</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
      </tr>
    </tbody>
  </table>
</div>
<script>
	$(function(){
		
		$(".nav-tabs a").click(function(){
			$(this).tab('show')
		})
		
	})
</script>
</body>


</html>