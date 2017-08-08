//-------------------------------민수꺼------------------------------------//

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
	
	function allCheckFunc( obj ) {
		$("[name=checkone]").prop("checked", $(obj).prop("checked") );
	}
	
	function oneCheckFunc( obj )
	{
		var allObj = $("[name=checkall]");
		var objName = $(obj).attr("name");
		if( $(obj).prop("checked") )
		{
			checkBoxLength = $("[name="+ objName +"]").length;
			checkedLength = $("[name="+ objName +"]:checked").length;
			if( checkBoxLength == checkedLength ) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		}
		else
		{
			allObj.prop("checked", false);
		}
	}
	
	function caps_lock(e) {
        var keyCode = 0;
        var shiftKey = false;
        keyCode = e.keyCode;
        shiftKey = e.shiftKey;
        if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
                || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
            show_caps_lock();
            setTimeout("hide_caps_lock()", 3500);
        } else {
            hide_caps_lock();
        }
    }// caps_lock(e) close
	function show_caps_lock() {
	     $("#capslock").show();
	}
	
	function hide_caps_lock() {
	     $("#capslock").hide();
	}
	
	function hidetext() {
		$("#checkid").text("");
	}
	$(function() {
		
		var id = $('#userid').val();
		var name = $('#username').val();
		var pw = $('#pw1').val();
		var pw2 = $('#pw2').val();
		var phone1 = $('input[name=phonef]').val().lengh;
		var phone2 = $('input[name=phonem]').val().lengh;
		var phone3 = $('input[name=phonet]').val().lengh;
		var phone4 = phone1 + phone2 + phone3;
		var email = $('#email').val();
		var birth1 = $('#birthy').val();
		var birth2 = $('#birthm').val();
		var birth3 = $('#birthd').val();
		
		$("[name=checkall]").click(function(){
			allCheckFunc( this );
		});
		$("[name=checkone]").each(function(){
			$(this).click(function(){
				oneCheckFunc( $(this) );
			});
		});
		
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
									setTimeout(hidetext, 2000);
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
		$('input[name=phonef]').focusout(function() {
			phone1 = $('input[name=phonef]').val().length;
			if (phone1==0 || phone1 < 3) {
				$('#checktel').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
			} else {
				$('#checktel').text("");
			}
		});
		
		$('input[name=phonem]').focusout(function() {
			phone2 = $('input[name=phonem]').val().length;
			if (phone2==0 || phone2 < 3) {
				$('#checktel').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
			} else {
				$('#checktel').text("");
			}
		});
		
		$('input[name=phonet]').focusout(function() {
			phone3 = $('input[name=phonet]').val().length;
			if (phone3==0 || phone3 < 4) {
				$('#checktel').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
			} else {
				$('#checktel').text("");
			}
		});
		$('#email').focusout(function() {
			email = $('#email').val();
			if (!email) {
				$('#checkemail').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
			} else {
				$('#checkemail').text("");
			}
		});
		$('#birthy').focusout(function() {
			birth1 = $('#birthy').val();
			if (!birth1) {
				$('#checkbirth').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
			} else {
				$('#checkbirth').text('');
			}
		});
		
		$('#birthm').focusout(function() {
			birth2 = $('#birthm').val();
			if (!birth2) {
				$('#checkbirth').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
			} else {
				$('#checkbirth').text('');
			}
		});
		
		$('#birthd').focusout(function() {
			birth3 = $('#birthd').val();
			if (!birth3) {
				$('#checkbirth').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
			} else {
				$('#checkbirth').text('');
			}
		});
		$('#checkall').click(
				function() {
					var gender = $('input:radio[name=gender]:checked').val();
					if (!$("[name=checkall]").prop("checked")){
						alert("필수동의 항목을 체크해주세요");
						$('[name=checkall]').focus();
					}
					
					if (!gender) {
						$('#checkgen').text('필수체크 사항입니다.').css("color", "red").css("font-size", "10pt");
					} else {
						$('#checkgen').text('');
					}
					
					if(!name){
						$('#username').focus();
						$('#checkname').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
						return false;
					}
					
					if(!id){
						$('#userid').focus();
						$('#checkid').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
						return false;
					}
					
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
					if(!phone1){
						$('input[name=phonef]').focus();
						$('#checktel').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
						return false;
					} else if (!phone2){
						$('input[name=phonem]').focus();
						$('#checktel').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
						return false;
					} else if (!phone3){
						$('input[name=phonet]').focus();
						$('#checktel').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
						return false;
					}
					if(!email){
						$('#email').focus();
						$('#checkemail').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
						return false;
					}
					
					if(!birth1){
						$('#birthy').focus();
						$('#checkbirth').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
						return false;
					} else if (!birth2){
						$('#birthm').focus();
						$('#checkbirth').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
						return false;
					} else if (!birth3){
						$('#birthd').focus();
						$('#checkbirth').text('필수입력 사항입니다.').css("color", "red").css("font-size", "10pt");
						return false;
					}
		
					if (name && id && pw && pw2 && phone1 && phone2  && phone3 && email && birth1 && birth2 && birth3
							&& gender && pw === pw2 && $("[name=checkall]").prop("checked")) {
						$('#enrolluser').submit();
						return true;
					} else {
						console.log('a');
						return false;
					}
				});
	});
	
	
	//------------------------------------용준-------------------------------------//
	
    $(function () {
        $('#checkBtn').click(function () {
            event.preventDefault();
            $.ajax({
                url: "/emos/sidcheck"
                , data: {
                    storeId: $('#storeId').val()
                }
                , type: "post"
                , dataType: "text"
                , success: function (data) {
                    if (data == 1) {
                        $('#checkDiv').text("사용가능한 아이디입니다.");
                        $('#storePwd').focus();
                    }
                    else {
                        $('#checkDiv').text("이미 사용중입니다.").css("color", "red");
                        $('#storeId').select();
                    }
                }
            })
        });
        //
        $('#storePwd2').focusout(function () {
            var password1 = $('#storePwd1').val();
            var password2 = $('#storePwd2').val();
            if (password2 == "" || password2 == null) {
                $('#checkpwd').text('필수입력');
            }
            else if (password1 != password2) {
                $('#checkpwd').text('안 맞음');
            }
            else if (password1 == password2) {
                $('#checkpwd').text('ㄱㄱ');
            }
        });
        $('#storeId').focusout(function () {
            var value = $('#storeId').val();
            var regex = /^[A-Za-z0-9+]{4,16}$/;
            if (value == "" || value == null) {
                $('#checkDiv').text("필수 입력").css("color", "red");
                setInterval(function () {
                    $('#checkDiv').text('');
                }, 5000);
                // 필수 입력
            }
            else if (!regex.test(value)) {
                // 4자리 이상 16자리 이하, 영문과 숫자만
                $('#checkDiv').text("4자리 이상 16자리 이하, 영문과 숫자만 가능").css("color", "red");
                setInterval(function () {
                    $('#checkDiv').text('');
                }, 5000);
                // $('#storeId').select();
            }
            else {
                // 확인
            }
            $('#storeId').focusout(function () {
                var value = $('#storeId').val();
                var regex = /^[A-Za-z0-9+]{4,16}$/;
                if (value == "" || value == null) {
                    $('#checkDiv').text("필수 입력").css("color", "red");
                    setInterval(function () {
                        $('#checkDiv').text('');
                    }, 5000);
                    // 필수 입력
                }
                else if (!regex.test(value)) {
                    // 4자리 이상 16자리 이하, 영문과 숫자만
                    $('#checkDiv').text("4자리 이상 16자리 이하, 영문과 숫자만 가능").css("color", "red");
                    setInterval(function () {
                        $('#checkDiv').text('');
                    }, 5000);
                    // $('#storeId').select();
                }
                else {
                    // 확인
                }
            });
        });

function execDaumPostcode() {
new daum.Postcode({
    oncomplete: function (data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = ''; // 최종 주소 변수
        var extraAddr = ''; // 조합형 주소 변수
        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            fullAddr = data.roadAddress;
        }
        else { // 사용자가 지번 주소를 선택했을 경우(J)
            fullAddr = data.jibunAddress;
        }
        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
        if (data.userSelectedType === 'R') {
            //법정동명이 있을 경우 추가한다.
            if (data.bname !== '') {
                extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if (data.buildingName !== '') {
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
        }
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('postcode').value = data.zonecode;
        document.getElementById('address').value = fullAddr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById('address2').focus();
    }
}).open();
}
