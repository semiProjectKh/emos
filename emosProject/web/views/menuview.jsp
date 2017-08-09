<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, menu.model.vo.Menu,member.model.vo.Member"%>
<%
	ArrayList<Menu> list = (ArrayList<Menu>) request.getAttribute("list");
	//Member member = (Member) session.getAttribute("member");
%>


<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>menuView</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="/emos/css/style.css"> 
</head>

<body>
	<header id="header02">
		<a href="/emos/index.html"> <img id="logo2"
			src="/emos/image/logo/logo.png"></a>
		<div class="w3-display-right" style="margin-right: 20px">
			<button href="#" class="w3-button"
				style="border: solid 1px white; border-radius: 3px"
				onclick="document.getElementById('id02').style.display='block'">로그인</button>
			<a href="#" class="w3-button w3-yellow" style="border-radius: 3px">회원가입</a>
		</div>

		<div id="id02" class="w3-modal">
			<div class="w3-modal-content w3-animate-top">
				<div class="w3-container">
					<span
						onclick="document.getElementById('id02').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>




					<form id="login01" class="w3-display-topmiddle">
						<input type="text" id="id" class="w3-display-topleft"
							value="아이디 입력"> <input type="password" id="pw"
							class="w3-display-bottomleft"> <a href="#"
							class="w3-button w3-display-right">로그인</a>
					</form>
					<div class="w3-display-bottommiddle" id="loginservice">
						<a href="#" class="w3-button w3-indigo">기업회원가입</a> <a href="#"
							class="w3-button w3-green">아이디 찾기</a> <a href="#"
							class="w3-button w3-teal">비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
	</header>
<style>
        #side {
            position: relative;
            width: 80%;
            height: inherit;
            border: solid 3px green;
        }
        
        img{
            width: 100%;
            height: auto;
            position: absolute;
        }
        
        .menu {
            position: absolute;
            border: solid 1px red;
        }
        
</style>
	<section id="mennu01">
		<div id="side">
			<img src="/emos/views/menu1.jpg" id="mimg">
			<script type="text/javascript">
				var img = document.getElementById("mimg");
				$(function() {
					$("#side").css("height", img.height);
				});
			</script>
			<%
			for(Menu n : list){ 
			%>
				<div class="menu" id="<%=n.getMenu_num() %>"  name="<%=n.getMenu_name() %>" price="<%=n.getMenu_price()%>"
				<%if(n.getMenu_modal()==1){ %>
					data-toggle="modal" data-target="#myModal1"
				<%}%>
					style="left:<%=n.getMenu_left()%>%;
							top:<%=n.getMenu_top()%>%;
						  width:<%=n.getMenu_width()%>%;
						  height:<%=n.getMenu_height()%>%;"></div>
			<%
			} 
			%>
		</div>





	</section>

	<section id="menu02">
	
	<h1>test</h1>
	<h1><%=list.get(1).getMenu_name() %></h1>
	
	</section>


	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<a href="#">개인정보 처리방침</a> | <a href="#">저작권 정책</a> | <a href="#">관련
						사이트</a> <br> <br>
					<p>(34055) 경기도 안양시 동안구 호계동 전화: 010-6635-7088, 팩스: 031-123-5678</p>
					<p>Copyright (C) 2017 KH Information & Security Institute. All
						Rights Reserved.</p>
				</div>
			</div>
		</div>
	</footer>
	
    <script>
	$(function(){ 
		$('.menu').click(function(){
			var id =  $(this).attr('id');
			$("#menu02").append($('#'+id).attr('name')+$('#'+id).attr('price')+'<br>');
		}); 
	});
	</script>

</body>
</html>