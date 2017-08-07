/**
 * 
 */

function myFunction(id) {
	var x = document.getElementById(id);
	if (x.className.indexOf("w3-show") == -1) {
		x.className += " w3-show";
		x.previousElementSibling.className = x.previousElementSibling.className
				.replace("w3-black", "w3-red");
	} else {
		x.className = x.className.replace(" w3-show", "");
		x.previousElementSibling.className = x.previousElementSibling.className
				.replace("w3-red", "w3-black");
	}
}

$(function() {
	var id = $('#userid').val();
	var name = $('#username').val();
	var pw = $('#pw1').val();
	var pw2 = $('#pw2').val();
	var phone = $('.phone').length;
	var email = $('#email').val();
	var birth = $('#birth').val();

	$('#userid').focusout(function() {
				id = $('#userid').val();
				var regex = /^[A-Za-z0-9+]{4,16}$/;
				if (!id) {
					$('#checkid').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
				} else if(!regex.test(id)){
					// 4자리 이상 16자리 이하, 영문과 숫자만
					$('#checkid').text("4자리 이상 16자리 이하, 영문과 숫자만 가능합니다.").css("font-size", "10pt").css("color", "red");
				}
				else {
					$('#checkid').text('');

					$.ajax({
						url : "/emos/edupid",
						type : "post",
						data : {
							userid : $('#userid').val()
						},
						dataType : "text", // 서블릿 서버에서 ajax 쪽으로 보내는 타입
						success : function(data) {
							if (data === "ok") {
								$('#checkid').text("사용가능한 아이디입니다.").css(
										"color", "blue").css("font-size",
										"10pt");
								$('#pw1').focus();
							} else {
								$('#checkid').css("color", "red");
								$('#checkid').text("아이디가 중복되었습니다.").css(
										"color", "red").css("font-size",
										"10pt");
								$('#userid').select();
							}
						},
						error : function(data) {
							alert("서블릿 에러");
						}
					});
				}

			})

	$('#username').focusout(function() {
		name = $('#username').val();
		if (!name) {
			$('#checkname').text("필수입력 사항입니다.").css("font-size", "10pt").css("color", "red");
		} else {
			$('#checkname').text("");
		}
	});

	$('#pw1').focusout(function() {
		pw = $('#pw1').val();
		pw2 = $('#pw2').val();
		
		if (!pw) {
			$('#checkpw').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
		} else if (pw && pw2 && pw != pw2){
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

	$('.phone').focusout(function() {
		phone = $('.phone').length;
		console.log(phone);
		if (phone == 0 || phone < 9) {
			$('#checktel').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
		} else {
			$('#checktel').text("");
		}
	});

	$('#email').focusout(function() {
		email = $('#email').val();

		if (!email) {
			$('#email').css("border-color", "red")
			$('#email').attr('title', '메일주소를 입력하세요');
		} else {
			$('#email').css("border-color", "white");
			$('#email').attr('title', '');
		}
	});

	$('#birth').focusout(function() {
		birth = $('#birth').val();

		if (!birth) {
			$('#birth').css("border-color", "red")
			$('#birth').attr('title', '생년월일을 입력하세요');
		} else {
			$('#birth').css("border-color", "white");
			$('#birth').attr('title', '');
		}
	});

	$('#checkall').click(
			function() {
				var gender = $('input:radio[name=gender]:checked').val();
				if (!gender) {
					$('.gender').css("width", "10%").css("border",
							"solid 2px red");
					$('.gender').attr('title', '성별을 입력하세요');
				} else {
					$('.gender').css("width", "10%").css("border",
							"solid 2px white");
					$('.gender').attr('title', '');
				}

				if (a == 0)
					alert("id 중복 체크를 해주세요!");

				if (name && id && pw && pw2 && phone && email && birth
						&& gender && pw === pw2) {
					$('#test').submit();
					return true;
				} else {
					return false;
				}
			});

});