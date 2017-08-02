<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eMos 회원가입</title>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../js/vins.js">
	
</script>
</head>
<body>
	<h1 align="center">회원가입</h1>
	<div align="center">
		<form action="../../ejoin" id="test" method="post">
			<input type="text" name="username" id="username" placeholder="이름"><br>
			<input type="text" name="id" id="userid" placeholder="아이디">
			<button type="button" id="checkid">중복체크</button>
			<br> <input type="password" name="pw" id="pw" placeholder="비밀번호"><br>
			<input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인"><br>
			<div id="checkpw" style="font-size:13px"></div>
			<input type="text" name="phone" id="phone" placeholder="핸드폰 번호"><br>
			<input type="email" name="email" id="email" placeholder="이메일"><br>
			생년월일 <input type="date" name="birth" id="birth" value="생년월일"><br>
			<div class="gender">
				<input type="radio" name="gender" class="gender" value="m">
				남 <input type="radio" name="gender" class="gender" value="f">
				여
			</div>
			<br>
			<button id="checkall">가입하기</button>
			&nbsp; <input type="reset" value="취소하기">
		</form>
	</div>
</body>
</html>