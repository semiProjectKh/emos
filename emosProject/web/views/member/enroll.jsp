<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eMos 회원가입</title>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#checkid').click(function(){
			$.ajax({
				url : "/emos/edupid",
				type : "post",
				data : {userid : $('#userid').val()},
				dataType : "text", //서블릿 서버에서 ajax 쪽으로 보내는 타입
				success : function(data){
					if(data === "ok"){
					alert("사용 가능한 아이디 입니다.");
					$('#username').focus();
					}
					else{
						alert("아이디가 중복되었습니다.");
						$('#userid').select();
					}
				},
				error : function(data){
					alert("서블릿 에러");
				}
			});
		})
		
		$('#checkall').click(function(){
			var pw = $('#pw').val();
			var pw2 = $('#pw2').val();
			alert(pw+" "+pw2);
			if(!pw){
				$('#pw').css("border-color", "red");
			} else {
				$('#pw').css("border-color", "white");
			}
			
			if(!pw2){
				$('#pw2').css("border-color", "red");
			} else {
				$('#pw2').css("border-color", "white");
			}
			
			if(pw&&pw2&&pw===pw2){
				$('#pw2').css("border-color", "white");
			} else {
				$('#pw2').css("border-color", "red");
				$('#pw2').attr('title', '암호가 일치하지 않습니다.')
			}
			
			
			
		})
		
		
		
			
			
	})
</script>
</head>
<body>
	<h1 align="center">회원가입</h1>
	<div align="center">
	
       <input type="text" name="username" placeholder="이름"><br>
       <input type="text" name="id" id="userid" placeholder="아이디"><button type="button" id="checkid">중복체크</button><br>
       <input type="password" name="pw" id="pw" placeholder="비밀번호"><br> 	
	   <input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인"><br>
	   <input type="phone" name="phone" placeholder="핸드폰 번호"><br>
	    <input type="email" name="email" placeholder="이메일"><br>
	    생년월일	<input type="date" name="birth" value="생년월일"><br>
	   <input type="radio" name="gender" value="m"> 남 <input type="radio" name="gender" value="f"> 여 <br>
	   <input type="submit" value="가입하기" id="checkall"> &nbsp;
	   <input type="reset" value="취소하기">
	
	</div>
</body>
</html>