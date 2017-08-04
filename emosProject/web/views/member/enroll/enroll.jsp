<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
   <script type="text/javascript">
	$(function() {
		$('#checkid').click(function(){
			$.ajax({
				url : "/web/edupid",
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
			var name = $('#name').val();
			var id = $('#userid').val();
			var pw = $('#pw').val();
			var pw2 = $('#pw2').val();
			var phone = $('#phone').val();
			var email 
			var gender = $('input:radio[name=gender]:checked').val();
			
			if(!pw){
				$('#pw').css("border-color", "red");
			} else if(!pw2){
				$('#pw2').css("border-color", "red");
			} else if(pw&&pw2&&pw !==pw2){
				$('#pw2').css("border-color", "red");
				$('#pw2').attr('title', '암호가 일치하지 않습니다.')
			} else {
				$('#test').submit();
			}
			
		})
	})
       
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace("w3-black", "w3-red");
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace("w3-red", "w3-black");
    }
}       
       
       
</script>

</head>



<body>
	<%@ include file="../../header.jsp" %>  
   
   <section id="enroll01">
       <div class="w3-content w3-display-container" >
       
    <div class="tab-content">
        <ul class="nav nav-tabs" id="enrolltab">
            <li class="active"><a data-toggle="tab" href="#en1">개인회원</a></li>
            <li><a data-toggle="tab" href="#en2">기업회원</a></li>
        </ul>
       
        <div id="en1" class="tab-pane fade in active">
            <form action="../../ejoin" id="enrolluser" method="post" class="w3-center">
            
<span class="w3-block w3-left-align">
   <label class="agreet">&nbsp;&nbsp;&nbsp;이용약관 및 개인정보 수집 및 이용에 모두 동의합니다.</label> 
   <input type="checkbox" value="check1">
</span>


<span  class="w3-button w3-block w3-left-align">
   <label onclick="myFunction('agree2')" class="agreet">이용약관 동의(필수) </label> 
   <input type="checkbox" value="check2">
</span>

<div id="agree2" class="w3-hide w3-container agreement">
	<%@ include file="usedinfo.html" %>  
</div>
               
<span  class="w3-button w3-block w3-left-align">
   <label class="agreet" onclick="myFunction('agree3')">개인정보 수집 및 이용 동의(필수)</label> 
   <input type="checkbox" value="check3">

</span>
<div id="agree3" class="w3-hide w3-container agreement">
	<%@ include file="privateinfo.html" %>  

</div>
               
                            
            <br>
            <hr>
            
            <p>이 름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="username" id="username">&nbsp;
            아이디 <input type="text" name="id" id="userid" placeholder="영문 숫자 8글자 이상">
            <input type="button" id="checkid" value="중복체크">
            </p>
            <p>비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" name="pw1" id="pw1" placeholder="영문 숫자 8글자 이상" class="p1">
            </p>
            <p>비밀번호 확인
            <input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인" class="p1">
            </p>
            <hr>
            <p>핸드폰 번호&nbsp;&nbsp;&nbsp;
            <input type="tel" name="phonef" class="phone">-
            <input type="tel" name="phonem" class="phone">-
            <input type="tel" name="phonet" class="phone">
            </p>
            <p>E-mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="email" name="email" id="email" placeholder="123456@emos.com" class="p1">
            </p>
            <p>
            생년월일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="number" name="birthy" id="birthy" value="생년월일" class="birth" min="1950" max="2017">
            <input type="number" name="birthm" id="birthm" value="생년월일" class="birth" min="1" max="12">
            <input type="number" name="birthd" id="birthd" value="생년월일" class="birth" min="1" max="31">
            </p>
            <p id="genp"><label>성 별</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="gender" class="gender" value="m" id="m"> 
            <label for="m">남</label>
            <input type="radio" name="gender" class="gender" value="f" id="f"> 
            <label for="f">여</label>
            </p>
            <br>
            
            <hr>
            
            <br>
            <br>
            
            <input type="button" id="checkall" value="가입하기" >
            &nbsp;
            <input type="reset" id="enrollcancle" value="취소하기"> 
            </form>
        </div>

           
                   
            <div id="en2" class="tab-pane fade">
            <form action="../../ejoin" id="enrollcompany" method="post">
            <input type="text" name="username" id="username" placeholder="이름">
            <br>
            <input type="text" name="id" id="userid" placeholder="아이디">
            <button type="button" id="checkid">중복체크</button>
            <br>
            <input type="password" name="pw" id="pw" placeholder="비밀번호">
            <br>
            <input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인">
            <br>
            <input type="tel" name="phone" placeholder="핸드폰 번호">
            <br>
            <input type="email" name="email" id="email" placeholder="이메일">
            <br> 생년월일
            <input type="date" name="birth" id="birth" value="생년월일">
            <br>
                <p> 성별 
                    <input type="radio" name="gender" class="gender" value="m"> 
                    <b >남</b>
                </p>
                <p>
                    <input type="radio" name="gender" class="gender" value="f">
                    <b>여</b>
                    
                </p>
            <br>
            <br>

            
            <input type="button" id="checkall">가입하기 &nbsp;
            <input type="reset" value="취소하기"> 
            </form>
        </div>
    </div>
           
       </div>
    </section>
    
    
    
    
	<%@ include file="../../footer.html" %>  

</body>

</html>