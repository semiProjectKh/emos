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
<style>  

input[type=number]::-webkit-inner-spin-button {
    opacity: 1;
}

</style>

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
      					<tr onclick="throwinCartEvent($(this).clone().attr('onclick', ''))"> 
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
      							<tr onclick="throwinCartEvent($(this).clone().attr('onclick', ''))"> 
        							<td value="<%= list.get(j).getMenuName() %>" ><%= list.get(j).getMenuName() %></td>
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
<div id="cart" class="col-sm-4 hide">
			<form id="cart_form">
				<table id="cartTable" class="table table-bordered">
					<tbody>
						
					</tbody>
				</table>
				</form>
			<hr>
			<div id="totPrice">
			
			</div>
		</div>
	</div>
</body>
<script>

	
	function throwinCartEvent(cart) {
		var totPrice = 0;
		var cloneTr = cart;
		var cnt=0;
		
		
		var ii = 0;
		var ff = false;
		if(!$('#cartTable > tbody').has('tr').length) {
			$('#cartTable > tbody').append(cloneTr).prop('onclick', null);
			$('#cartTable > tbody > tr:last').append("<td><input type='number' min='1' value='1' style='width:40px'></td><td><a class='glyphicon glyphicon-remove' onclick='deleteTr(this);'></a></td>");
			// totPrice += $(this).parent().parent().children('td:even').text();
			
		} else {
			$('#cartTable > tbody > tr').each(function(index, element) {			
				if($(element).children('td:eq(0)').text() == cloneTr.children('td:first').text()) {
					ff = true;
					ii = index;
					return false;		
				}
				
					
				
			})
			if (!ff) {
				$('#cartTable > tbody').append(cloneTr).prop('onclick', null);
				$('#cartTable > tbody > tr:last').append("<td><input type='number' min='1' value='1' style='width:40px'></td><td><a class='glyphicon glyphicon-remove' onclick='deleteTr(this);'></a></td>");
				totPrice += $(this).parent().parent().children('td:even').text();
			} else {
				var pp = $('#cartTable > tbody').children('tr').eq(ii).children('td').children('input');
				pp.val(parseInt(pp.val())+1);
			}
		}
		
		// 총 가격 처리하는 jquery
		
		totPrice();
		/* $('#cartTable > tbody > tr').each(function(index, element) {
			console.log($(element).children('td:eq(2) > input[type=number]').val());
			totPrice = parseInt(totPrice) + (parseInt($(element).children('td:eq(1)').text())*$(element).children().children('input').val());
			
			$('#totPrice').html("총가격 : " + totPrice).attr('align','right');
			console.log();
		}) */
		
		/* if (cnt != 1) {
			
			$('#cartTable > tbody').append(cloneTr).prop('onclick', null);
			$('#cartTable > tbody > tr:last').append("<td><input type='number' min='1' value='1' style='width:40px'></td><td><a class='glyphicon glyphicon-remove' onclick='deleteTr(this);'></a></td>");
			totPrice += $(this).parent().parent().children('td:even').text();
			cnt++;
		}
		else {
			(this).children(1).val()
		}
		$('#cartTable > tbody > tr').each(function(index, element) {
			totPrice = parseInt(totPrice) + parseInt($(element).children('td:eq(1)').text());
			$('#totPrice').html("총가격 : " + totPrice).attr('align','right');
		}) */
		
		
		
		
	}
	
	function deleteTr(cartTr) {
		var cntMenu = $('cartTable > tbody > tr > input').val();
		$(cartTr).parent().parent().remove();
		totPrice;
	}
	
	
	$('#asa').click(function(){
		if($('#cart').hasClass('show')) {
			$('#menupane').removeClass('col-sm-8');
			$('#menupane').addClass('col-sm-12');
			$('#cart').removeClass('show');
			$('#cart').addClass('hide');
		} else {
			$('#menupane').removeClass('col-sm-12');
			$('#menupane').addClass('col-sm-8');
			$('#cart').removeClass('hide');
			$('#cart').addClass('show');
		}
	});
	
	function totPrice() {
		var totPrice = 0;
		$('#cartTable > tbody > tr').each(function(index, element) {
			totPrice = parseInt(totPrice) + parseInt($(element).children('td:eq(1)').text());
			$('#totPrice').html("총가격 : " + totPrice).attr('align','right');
		})
	}
</script>

</html>