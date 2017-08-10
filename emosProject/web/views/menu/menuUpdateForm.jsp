<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="menu.model.vo.Menu, java.util.ArrayList"%>

<%
	//네비게이션 바의 이름을 받아오는 리스트
	ArrayList typeArr = (ArrayList) request.getAttribute("listType");
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
<title>메뉴 수정 및 삭제</title>

</head>
<body>
	<div>
		<h1 align="center">메뉴 수정 및 삭제</h1>
	</div>
	<%
		int i = 1;
		int cnt = 1;
		for (Menu m : list) {
	%>
	<div id="form<%=cnt++%>" class="menu_element_group" name="1">
		<div id="form2" class="row div_menu_set" name="2">
			<input type="hidden" id="mNum<%=i%>" value="<%=m.getMenuNum()%>">
			<div class="col-xs-3">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input id="menuname1"
					type="text" class="form-control inMName" name="menuname<%=i%>"
					value="<%=m.getMenuName()%>">
			</div>
			<div class="col-xs-3">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input id="price"
					type="number" class="form-control inMPrice" name="price<%=i%>"
					value="<%=m.getPrice()%>" step="100">
			</div>
			<div class=" col-xs-3">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user inMType"></i></span> <select
					class="form-control" id="mtype" name="mtype<%=i%>">
					<%
						for (int j=0; j<typeArr.size(); j++) {
					%>

					<%
						if (m.getMenuType().equals(typeArr.get(j))) {
					%>
					<option value="<%= typeArr.get(j) %>" selected><%= typeArr.get(j) %></option>
					<%
						} else {
					%>
					<option value="<%= typeArr.get(j) %>"><%= typeArr.get(j) %></option>
					<%
						}
					%>
					<%
						}
					%>
				</select>
			</div>
			<div class=" col-xs-3" name="3">
				<div name="4">
					<button id="up_btn<%=i%>" class="btn btn-default ubtn"
						value=<%=m.getMenuNum()%>>수정</button>
				</div>
				<div>
					<button id="del_btn<%=i%>" class="btn btn-default dbtn"
						value=<%=m.getMenuNum()%>>삭제</button>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<%
		i++;
		}
	%>

	<script type="text/javascript">
		$('.dbtn').click(function() {
			$.ajax({
				url : "mdelete",
				type : "post",
				data : {
					menuNum : $(this).val()
				},
				dataType : "text",
				success : function(value) {
					if (value == 1) {
						$(this).parent('.menu_element_group').remove();
						location.reload();
					}
				},
				error : function() {
					console.log("실패함");
				}

			})
		})

		$('.ubtn').click(
				function() {
					var menuName = $(this).parent().parent().parent().children(
							'div').children('input[type=text]').val();
					var menuNum = $(this).val();
					var menuPrice = $(this).parent().parent().parent()
							.children('div').children('input[type=number]')
							.val();
					var menuType = $(this).parent().parent().parent().children(
							'div').children('select').val();
					$.ajax({
						url : "mupdate",
						type : "post",
						data : {
							menuNum : menuNum,
							menuName : menuName,
							menuPrice : menuPrice,
							menuType : menuType
						},
						dataType : "text",
						success : function(value) {
							if (value == 1) {
								location.reload();
							}
						},
						error : function() {
							console.log("실패함");
						}
					})
				})
	</script>


</body>

</html>