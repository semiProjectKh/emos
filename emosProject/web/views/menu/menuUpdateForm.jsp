<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	var k = 1;
	$(function() {
		$('#menuinsert').click(function() {
			$('#form2').clone().appendTo('#form1');
			k++;
			$('input[type=text]:last').attr('name', 'menuname' + k).val("");
			$('input[type=number]:last').attr('name', 'price' + k).val("");
			$('select:last').attr('name', 'mtype' + k);
			/* $('#numOfInput').val(k);
			console.log($('#numOfInput').val()); */
		})
	})
	
	
</script>
<title>메뉴 수정</title>

</head>
<body>
	<div>
		<h1 align="center">메뉴 수정</h1>		
	</div>
	<form action="/emos/mninsert">
	<div id="form1">
		<div id="form2" class="row">
			<div class=" col-xs-3">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input id="menuname1"
					type="text" class="form-control inputMenu" name="menuname1"
					placeholder="메뉴이름">
			</div>
			<div class="col-xs-3">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input id="price"
					type="number" class="form-control" name="price1" placeholder="메뉴가격"
					value="0" step="100">
			</div>
			<div class=" col-xs-3">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <select class="form-control"
					id="mtype" name="mtype1">
					<option>메인메뉴</option>
					<option>사이드메뉴</option>
					<option>음료</option>
				</select>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="col-xs-12">
		<input type="hidden" name="numOfInput" id="numOfInput" value="1">
		<button type="button" id="menuinsert" class="btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		</button>
	</div>

	<br>
	<br>
	<br>
		<input type="submit" value="확인" onclick="add()">
</form>
</body>


</html>