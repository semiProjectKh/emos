<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="menu.model.vo.Menu, java.util.ArrayList"%>

<%
	// 네비게이션 바의 이름을 받아오는 리스트
	ArrayList listType = (ArrayList) request.getAttribute("listType");
	// 해당 스토어의 메뉴목록을 받아오는 리스트
	ArrayList<Menu> list = (ArrayList<Menu>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>


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


	<div>
		<button class="w3-button w3-teal w3-xlarge w3-right"
			onclick="openRightMenu()">&#9776;</button>
	</div>

	<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-right"
		style="display: none; right: 0; width: 340px" id="rightMenu">
		<button onclick="closeRightMenu()"
			class="w3-bar-item w3-button w3-large">Close &times;</button>
		<table id="cartTable" class="table table-bordered">
			<tbody>
			</tbody>
		</table>
		<hr>
		<div>
			<table id="totPrice" align="right"></table>
		</div>
		<a id="menu_order" class="btn btn-default" href="javascript:pay_sys()">
			<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
		</a>

	</div>

	<div id="menupane" class="col-sm-12">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab"
				href="#<%=listType.get(0)%>"><%=listType.get(0)%></a></li>
			<%
				for (int i = 1; i < listType.size(); i++) {
			%>
			<li><a data-toggle="tab" href="#<%=listType.get(i)%>"><%=listType.get(i)%></a></li>
			<%
				}
			%>
		</ul>

		<div class="tab-content">

			<div class="tab-pane fade in active" id="<%=listType.get(0)%>">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>메뉴 이름</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<%
							if (listType.get(0).equals(list.get(i).getMenuType())) {
						%>
						<tr
							onclick="throwinCartEvent($(this).clone().attr('onclick', ''))">
							<td><input type="hidden" name="menuNum"
								value="<%=list.get(i).getMenuNum()%>"><%=list.get(i).getMenuName()%></td>
							<td><%=list.get(i).getPrice()%></td>
						</tr>
						<%
							}
						%>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<%
				for (int i = 1; i < listType.size(); i++) {
			%>
			<div class="tab-pane fade" id="<%=listType.get(i)%>">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>메뉴 이름</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int j = 0; j < list.size(); j++) {
						%>
						<%
							if (listType.get(i).equals(list.get(j).getMenuType())) {
						%>
						<tr
							onclick="throwinCartEvent($(this).clone().attr('onclick', ''))">
							<td><input type="hidden" name="menuNum"
								value="<%=list.get(j).getMenuNum()%>"><%=list.get(j).getMenuName()%></td>
							<td><%=list.get(j).getPrice()%></td>
						</tr>
						<%
							}
						%>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<%
				}
			%>

		</div>
	</div>
</body>
<script>
	// 메뉴클릭시 발생하는 이벤트
	function throwinCartEvent(cart) {
		var cloneTr = cart;
		var cnt = 0;
		var ii = 0;
		var ff = false;
		var Now = new Date();

		if (!$('#cartTable > tbody').has('tr').length) {
			$('#cartTable > tbody').append(cloneTr);
			$('#cartTable > tbody > tr:last')
					.append(
							"<td><input type='number' name='mcnt' min='1' value='1' style='width:40px'></td><td><a class='glyphicon glyphicon-remove' onclick='deleteTr(this);'></a></td>");
		} else {
			$('#cartTable > tbody > tr')
					.each(
							function(index, element) {
								if (ff == false
										&& $(element).children('td:eq(0)')
												.text() == cloneTr.children(
												'td:first').text()) {
									ff = true;
									ii = index;
									// return false;
								}
							})
			if (!ff) {
				$('#cartTable > tbody').append(cloneTr).prop('onclick', null);
				$('#cartTable > tbody > tr:last')
						.append(
								"<td><input type='number' name='mcnt' min='1' value='1' style='width:40px' class='spinner'></td><td><a class='glyphicon glyphicon-remove' onclick='deleteTr(this);'></a></td>");
			} else {
				var pp = $('#cartTable > tbody').children('tr').eq(ii)
						.children('td').children('input[type=number]');
				pp.val(parseInt(pp.val()) + 1);
				console.log(pp.parent().html());
			}
		}

		totPrice();
		openRightMenu();
	}

	// 삭제 버튼 클릭시 이벤트
	function deleteTr(cartTr) {
		var cntMenu = $('cartTable > tbody > tr > input');
		$(cartTr).parent().parent().remove();

		totPrice();
	}

	// 장바구니에 담겨있는 총 가격 처리하는 함수
	function totPrice(price) {
		var totPrice = 0;
		$('#cartTable > tbody > tr')
				.each(
						function(index, element) {
							totPrice = parseInt(totPrice)
									+ (parseInt($(element).children('td:eq(1)')
											.text()) * $(element).children()
											.children('input[type=number]')
											.val());
							$('#totPrice').html(
									"<tr><td> 총가격 : </td><td>  " + totPrice
											+ "  </td></tr>");
						})
		return totPrice;
	}
	$('#cartTable > tbody').on('change', function() {
		$('#cartTable > tbody > tr > td > input[type=number]').each(function() {
			totPrice();
		})

	});

	// 장바구니 보여주는 이벤트
	function openRightMenu() {
		document.getElementById("rightMenu").style.display = "block";
	}

	// 장바구니 감춰주는 이벤트
	function closeRightMenu() {
		document.getElementById("rightMenu").style.display = "none";
	}

	// 현재시간 처리용 함수
	function getTimeStamp() {
		var d = new Date();

		var s = leadingZeros(d.getFullYear(), 4)
				+ leadingZeros(d.getMonth() + 1, 2)
				+ leadingZeros(d.getDate(), 2) +

				leadingZeros(d.getHours(), 2) + leadingZeros(d.getMinutes(), 2)
				+ leadingZeros(d.getSeconds(), 2);

		return s;
	}
	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}

	// 결제 api
	var IMP = window.IMP;
	$(function() {
		IMP.init('imp77260699');
	});
	function pay_sys() {
		var cnt = [];
		var menuNum = [];

		$('#cartTable input[name="menuNum"]').each(function(i) {
			menuNum.push($(this).val());
		})
		$('input[name="mcnt"]').each(function(i) {
			cnt.push($(this).val());
		})

		IMP.request_pay({
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : $('#cartTable > tbody > tr:eq(0) > td:eq(0)').text()
					+ " ...",//getTimeStamp(),
			amount : totPrice(),
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				// 결제 서블릿으로 넘어가는 아작스 ()
				$.ajax({
					url : "morder",
					type : "post",
					data : {
						"paymentTime" : getTimeStamp(),
						"storeNum" : "2",
						"memberNum" : "1",
						"paymentMethod" : "card",
						"mcnt" : cnt,
						"menuNum" : menuNum
					},
					dataType : "text",
					success : function(value) {
						// location.reload();
					},
					error : function() {
						console.log("실패");
					}
				})

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;

			}
			alert(msg);
		})
	}
</script>


</html>