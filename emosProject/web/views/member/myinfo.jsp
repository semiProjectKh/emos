<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member, reply.model.vo.Reply, java.util.*"%>
<%
	Member member = (Member) session.getAttribute("member");
	ArrayList<Reply> reply = (ArrayList<Reply>)request.getAttribute("replylist");
	
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
<link rel="stylesheet" href="/emos/css/style.css">
<script type="text/javascript">
    function logout(){
    	location.href="/emos/elogout";
    }
    
    function update(){
    	location.href="/emos/views/member/update.jsp";
    }
    
    function detailcontent(){
    	var userid = "<%= member.getUserId() %>";
    	location.href="/emos/einfo?num=2&userid=" + userid
    }
    <%-- $(function(){
    	var userid = "<%= member.getUserId()%>";
    	location.replace("/emos/myreply?num=1&userid=" + userid);
    }) --%>
    
    </script>
</head>
<body>
	<header id="header02">
		<a href="/emos/index.jsp"> <img id="logo2"
			src="/emos/image/logo/logo.png"></a> <label id="location"></label>
		<div class="w3-display-right" style="margin-right: 20px">
			<button class="w3-button"
				style="color: white; border: solid 1px white; border-radius: 3px"
				onclick="logout();">로그아웃</button>
		</div>
	</header>
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
					<button>더 보기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="w3-content w3-display-container" style="margin-top: 10px">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">댓글목록</div>
				<div class="panel-body">
					
					<ul style="padding-left: 5px" class="none_li" id="f">
						<% for(Reply r : reply) {%>
						<li><%= r.getContent() %></li>
						<%} %>
					</ul>
					
					<button onclick="detailcontent();">더 보기</button>
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