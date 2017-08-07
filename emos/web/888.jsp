<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="menu.model.vo.Menu, java.util.ArrayList" %>

<%
	ArrayList listType = (ArrayList) request.getAttribute("listType");
	ArrayList<Menu> list = (ArrayList<Menu>) request.getAttribute("list");
	String mCategory = (String) request.getAttribute("mCategory");
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

	<div class="row">
		<div id="menupane" class="col-sm-12">
				<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#<%= listType.get(0)%>"><%= listType.get(0) %></a></li>
    	<% for (int i=1; i<listType.size(); i++) { %>
    	<li><a data-toggle="tab" href="#<%= listType.get(i) %>"><%= listType.get(i) %></a></li>
    	<% } %>
  	</ul>

	<div class="tab-content">
    	
    	<div class="tab-pane fade in active" id="<%= listType.get(0) %>">
      			<table class="table table-hover">
    				<thead>
      					<tr>
        					<th>메뉴 이름</th>
        					<th>가격</th>
      					</tr>
    				</thead>
    			<tbody>
    			<% for (int i=0; i<list.size(); i++) { %>
    				<% if (listType.get(0).equals(list.get(i).getMenuType())) { %>
      					<tr> 
        					<td><%= list.get(i).getMenuName() %></td>
        					<td><%= list.get(i).getPrice() %></td>
      					</tr>
      				<% } %>
      			<% } %>
      			</tbody>
  			</table>
      	</div>
      			<% for (int i=1; i<listType.size(); i++) { %>
      				<div class="tab-pane fade" id="<%= listType.get(i) %>">
      					<table class="table table-hover">
      						<thead>
      							<tr>
        							<th>메뉴 이름</th>
        							<th>가격</th>
      							</tr>
    						</thead>
    					<tbody>
 						<% for (int j=0; j<list.size(); j++) { %>
 							<% if (listType.get(i).equals(list.get(j).getMenuType())) { %>
      							<tr> 
        							<td><%= list.get(j).getMenuName() %></td>
        							<td><%= list.get(j).getPrice() %></td>
      							</tr>
      						<% } %>
      					<% } %>
      					</tbody>
  					</table>
      			</div>
      		<% } %>
    
    	</div>
  </div>
  <div><button id="asa">aa</button></div>
</body>

</html>