<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="member.model.vo.Member, store.model.vo.Store"%>

<%
	Member member = (Member) session.getAttribute("member");
	Store store = (Store) session.getAttribute("store");
//	member = new Member();
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eMos 내 정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/emos/css/style.css">

<script type="text/javascript">
	function logout() {
		location.href = "/emos/elogout";
	}

	function update() {
		location.href = "/emos/views/member/update.jsp";
	}
</script>
</head>
<body>
	<%
		if (member != null) {
	%>
	<header id="header02">
		<a href="/emos/index.jsp"> <img id="logo2"
			src="/emos/image/logo/logo.png"></a> <label id="location"></label>
		<div class="w3-display-right" style="margin-right: 20px">
			<button class="w3-button"
				style="color: white; border: solid 1px white; border-radius: 3px"
				onclick="logout();">로그아웃</button>
		</div>
	</header>
	<%
		} else {
	%>
	<header id="header02">
		<a href="/emos/index.jsp"> <img id="logo2"
			src="/emos/image/logo/logo.png"></a>
		<div class="w3-display-right" style="margin-right: 20px">
			<button href="#" class="w3-button"
				style="color: white; border: solid 1px white; border-radius: 3px"
				onclick="document.getElementById('id02').style.display='block'">로그인</button>
			<a href="views/member/enroll/enroll.jsp" class="w3-button w3-yellow" style="border-radius: 3px; text-decoration:none;">회원가입</a>
		</div>
                    <div id="id02" class="w3-modal">
                        <div class="w3-modal-content w3-animate-opacity">
                            <div class="w3-container"> 
                                <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-display-topright">&times;</span>
                                <form id="login01" class="w3-display-topmiddle" action="ablogin" method="post">
                                    <input type="text" id="id" class="w3-display-topleft" placeholder="아이디 입력">
                                    
                                    <input type="password" id="pw" class="w3-display-bottomleft"  placeholder="비번 입력">
                                    
                                    <button class="w3-button w3-display-right" onclick="submit()" style="color:white;background: #0c0642;height: 60px;text-align: center;">로그인</button>
                                </form>                               
                                <div class="w3-display-bottommiddle" id="loginservice">
                                <a href="views/member/enroll/enroll.jsp" class="w3-button w3-indigo">회원가입</a>
                                <a href="#" class="w3-button w3-green">아이디 찾기</a>
                                <a href="#" class="w3-button w3-teal">비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                    </div>
	</header>

	<%
		}
	%>

</body>
</html>