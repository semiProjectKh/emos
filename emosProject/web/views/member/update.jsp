<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <section id="updateuser01" >
        <div class="w3-content w3-display-container" style="padding:30px;">
            <form action="/emos/emupdate" id="updateinfo" method="post" class="w3-center"> 
            <input type="hidden" name="userid" value="<%= member.getUserId() %>">
                <p> 이 름&nbsp;&nbsp;
                    <input type="text" name="name" value="<%= member.getUserName() %>" >&nbsp; 아이디
                    <input type="text" name="userid" value="<%= member.getUserId() %>" disabled>
                    <div id="checkname"></div>
                </p>
            
                <p> 비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="password"  name="userpwd" id="pw1" class="p1">
                    <div id="checkpw"></div>
                    <p id="capslock" style="position:relative; border:2px solid #003b83; width:300px; bottom:0px; display:none"> &nbsp;<b>CapsLock</b> 키가 눌려있습니다.&nbsp;</p>
                </p>
                <p> 비밀번호 확인
                    <input type="password" name="userpwd2" id="pw2" class="p1">
                    <div id="checkpw2"></div>
                </p>
                <hr>
                <p> 핸드폰 번호&nbsp;&nbsp;&nbsp;
                    <input type="tel" name="phone" value="<%= member.getPhone() %>" class="phone">
                    <div id="checktel"></div>
                </p>
                <p> E-mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="email" name="email" value="<%= member.getEmail() %>" class="p1">
                    <div id="checkemail"></div>
                </p>
                <input type="button" id="check" value="수정하기"> &nbsp;
                <input type="button" onclick="window.history.back()" id="enrollcancle" value="취소하기"> 
                <a href="/emos/edelete?userid=<%= member.getUserId() %>" class="btn btn-default" id="reject">탈퇴하기</a>
            </form>
        </div>
    </section>
    
    <%@ include file="../footer.jsp" %>


</body>
<style>
#updateuser01{
	margin-top:20px;
}



#check{
    width: 30%;
    background: blue;
    color: white
}

#reject{
    margin-left: 20px;
    background: black;
    color: white;
}

#updateinfo input{
    margin: 10px;
    border-radius: 5px;
    height: 35px;
}

</style>
  <script type="text/javascript">
    
    function logout(){
    	location.href="/emos/elogout";
    }
    
    var pw = $('#pw1').val();
    var pw2 = $('#pw2').val();
   
    $(function(){
    	
    	$('#pw1').focusout(function() {
			pw = $('#pw1').val();
			pw2 = $('#pw2').val();
			
			if (!pw) {
				$('#checkpw').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
			} else if (pw && pw2 && pw !== pw2){
				$('#checkpw2').text("암호가 일치하지 않습니다.")	.css("color", "red").css("font-size", "10pt");
			} else {
				$('#checkpw2').text("");
				$('#checkpw').text("");
			} 
			
				
		});
		$('#pw2').focusout(function() {
			pw = $('#pw1').val();
			pw2 = $('#pw2').val();
			if (!pw2) {
				$('#checkpw2').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
			} else if (pw&&pw2 &&pw !== pw2) {
				$('#checkpw2').text("암호가 일치하지 않습니다.")	.css("color", "red").css("font-size", "10pt");
			} else {
				$('#checkpw2').text("");
			}
			
			
		});
			
			$('#check').click(function(){
				if(!pw){
					$('#pw1').focus();
					$('#checkpw').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
					return false;
				}
				if(!pw2){
					$('#pw2').focus();
					$('#checkpw2').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
					return false;
				}
				
				if(pw && pw2 && pw === pw2){
					$('#updateinfo').submit();
					return true;
				} else {
					return false;
				}
					
				
			});
			
		});
</script>

</html>