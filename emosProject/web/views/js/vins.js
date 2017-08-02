/**
 * 
 */
var a = 0;
	$(function() {
		$('#checkid').click(function(){
			a++;
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
		
			var id = $('#userid').val();
			var name = $('#username').val();
			var pw = $('#pw').val();
			var pw2 = $('#pw2').val();
			var phone = $('#phone').val();
			var email = $('#email').val();
			var birth = $('#birth').val();
			
		$('#userid').focusout(function(){
			id = $('#userid').val();
			
			if(!id){
				$('#userid').css("border-color", "red")
				$('#userid').attr('title', '아이디를 입력 하세요');
			} else {
				$('#userid').css("border-color", "white");
				$('#userid').attr('title', '');
			}
		});
		
		$('#username').focusout(function(){
			name = $('#username').val();
			
			if(!name){
				$('#username').css("border-color", "red")
				$('#username').attr('title', '이름을 입력 하세요');
			} else {
				$('#username').css("border-color", "white");
				$('#username').attr('title', '');
			}
		});
		
		$('#pw').focusout(function(){
			 pw = $('#pw').val();
			
			if(!pw){
				$('#pw').css("border-color", "red")
				$('#pw').attr('title', '비밀번호를 입력하세요');
			} else {
				$('#pw').css("border-color", "white");
				$('#pw').attr('title', '');
			}
		});
		
		$('#pw2').focusout(function(){
			pw = $('#pw').val();
			pw2 = $('#pw2').val();
			
			if(pw2 == null || pw2 == ""){
				$('#pw2').css("border-color", "red");
				$('#pw2').attr('title', '비밀번호를 입력하세요');
				$('#checkpw').text('');
			} else if (pw !== pw2){
				$('#pw2').css("border-color", "red");
				$('#checkpw').text('암호가 일치하지 않습니다.');
				$('#pw2').attr('title', '');
			} else if (pw===pw2){
				$('#pw2').css("border-color", "white");
				$('#checkpw').text('');
				$('#pw2').attr('title', '');
			} 
			
		});
		
		$('#phone').focusout(function(){
			phone = $('#phone').val();
			
			if(!phone){
				$('#phone').css("border-color", "red")
				$('#phone').attr('title', '번호를 입력하세요');
			} else {
				$('#phone').css("border-color", "white");
				$('#phone').attr('title', '');
			}
		});
		
		$('#email').focusout(function(){
			email = $('#email').val();
			
			if(!email){
				$('#email').css("border-color", "red")
				$('#email').attr('title', '메일주소를 입력하세요');
			} else {
				$('#email').css("border-color", "white");
				$('#email').attr('title', '');
			}
		});
		
		$('#birth').focusout(function(){
			birth = $('#birth').val();
			
			if(!birth){
				$('#birth').css("border-color", "red")
				$('#birth').attr('title', '생년월일을 입력하세요');
			} else {
				$('#birth').css("border-color", "white");
				$('#birth').attr('title', '');
			}
		});
		
		
		
		$('#checkall').click(function(){
			var gender = $('input:radio[name=gender]:checked').val();
			if(!gender){
				$('.gender').css("width","10%").css("border", "solid 2px red"); 
				$('.gender').attr('title', '성별을 입력하세요');
			} else {
				$('.gender').css("width","10%").css("border", "solid 2px white"); 
				$('.gender').attr('title', '');
			}
			 
			 if(a == 0)
			   alert("id 중복 체크를 해주세요!");	
				
			  if(name&&id&&pw&&pw2&&phone&&email&&birth&&gender&&pw===pw2){
				 $('#test').submit();
				 return true;
			  } else {
				  return false;
			  }
		});
		
		
		
			
			
	});