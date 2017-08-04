<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%
	Member member = (Member) session.getAttribute("member");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eMos 내 정보</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../../css/style.css">
<script type="text/javascript">
    function logout(){
    	location.href="/emos/elogout";
    }
    
    function update(){
    	location.href="/emos/views/member/update.jsp";
    }
    
    </script>
</head>
<body>

	
	
	
	
	
	<div class="w3-content w3-display-container" style="margin-top: 10px">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">내 정보</div>
				<div class="panel-body">
					<ul style="padding-left: 5px" class="none_li">
						<li>이 름: <%= member.getUserId() %></li>
						<li>이메일 : <%=member.getEmail()%></li>
						<li>전화번호 : <%=member.getPhone() %></li>
						<li>생년월일 : <%= member.getBirth() %></li>
						<li>경고횟수 : <%= member.getVerse() %></li>
						<li>가입일 : <%= member.getEnrollDate() %></li>
					</ul>
					<button onclick="update();">수정</button>
				</div>
			</div>
		</div>

		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">즐겨찾기 목록</div>
				<div class="panel-body">
					<ul style="padding-left: 5px" class="none_li">
						<li>이메일 : <%=member.getEmail()%></li>
						<li>전화 : <%=member.getEmail()%></li>
						<li>이메일 : <%=member.getEmail()%></li>
					</ul>
					<button>수정</button>
				</div>
			</div>
		</div>
	</div>
	<div class="w3-content w3-display-container" style="margin-top: 10px">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">댓글목록</div>
				<div class="panel-body">
					<ul style="padding-left: 5px" class="none_li">
						<li>이 름 : <%=member.getEmail()%></li>
						<li>아이디 : <%=member.getEmail()%></li>
						<li>비밀번호 : <%=member.getEmail()%></li>
						<li>비밀번호 확인 : </li>
						<li>전화번호 : <%=member.getEmail()%></li>
						<li></li>
					</ul>
					<button>상세보기</button>
				</div>
			</div>
		</div>
		
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">결제 목록</div>
				<div class="panel-body">
					<ul style="padding-left: 5px" class="none_li">
						<li>이메일 : <%=member.getEmail()%></li>
						<li>전화 : <%=member.getEmail()%></li>
						<li>이메일 : <%=member.getEmail()%></li>
					</ul>
					<button>상세보기</button>
				</div>
			</div>
		</div>
	</div>




</body>
<script type="text/javascript">
var name = "<%=member.getUserId()%>";
	$('#location').html(name + " 님 정보").css("color", "white")
			.css("top", "20px").css("left", "60px");
</script>

</html>