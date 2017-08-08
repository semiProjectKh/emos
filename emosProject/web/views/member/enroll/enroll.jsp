<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/enroll.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
</head>



<body>
	<%@ include file="../../header.jsp"%>

	<section id="enroll01">
		<div class="w3-content w3-display-container">

			<div class="tab-content">
				<ul class="nav nav-tabs" id="enrolltab">
					<li class="active"><a data-toggle="tab" href="#en1">개인회원</a></li>
					<li><a data-toggle="tab" href="#en2">기업회원</a></li>
				</ul>

				<div id="en1" class="tab-pane fade in active">
					<form action="../../ejoin" id="enrolluser" method="post"
						class="w3-center">

						<span class="w3-block w3-left-align"> <label class="agreet">&nbsp;&nbsp;&nbsp;이용약관
								및 개인정보 수집 및 이용에 모두 동의합니다.</label> <input type="checkbox" value="check1">
						</span> <span class="w3-button w3-block w3-left-align"> <label
							onclick="myFunction('agree2')" class="agreet">이용약관 동의(필수)
						</label> <input type="checkbox" value="check2">
						</span>

						<div id="agree2" class="w3-hide w3-container agreement">
							<%@ include file="usedinfo.jsp"%>
						</div>

						<span class="w3-button w3-block w3-left-align"> <label
							class="agreet" onclick="myFunction('agree3')">개인정보 수집 및
								이용 동의(필수)</label> <input type="checkbox" value="check3">
						</span>



						<div id="agree3" class="w3-hide w3-container agreement">
							<%@ include file="privateinfo.jsp"%>

						</div>


						<br>
						<hr>

						<p>
							이 름&nbsp;&nbsp;
							<input type="text" name="username" id="username">&nbsp;
							아이디 <input type="text" name="id" id="userid"
								placeholder="영문 숫자 8글자 이상"> <input type="button"
								id="checkid" value="중복체크">
						</p>
						<p>
							비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="password"
								name="pw1" id="pw1" placeholder="영문 숫자 8글자 이상" class="p1">
						</p>
						<p>
							비밀번호 확인 <input type="password" name="pw2" id="pw2"
								placeholder="비밀번호 확인" class="p1">
						</p>
						<hr>
						<p>
							핸드폰 번호&nbsp;&nbsp;&nbsp; <input type="tel" name="phonef"
								class="phone">- <input type="tel" name="phonem"
								class="phone">- <input type="tel" name="phonet"
								class="phone">
						</p>
						<p>
							E-mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="email" name="email" id="email"
								placeholder="123456@emos.com" class="p1">
						</p>
						<p>
							생년월일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="number"
								name="birthy" id="birthy" value="생년월일" class="birth" min="1950"
								max="2017"> <input type="number" name="birthm"
								id="birthm" value="생년월일" class="birth" min="1" max="12">
							<input type="number" name="birthd" id="birthd" value="생년월일"
								class="birth" min="1" max="31">
						</p>
						<p id="genp">
							<label>성 별</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="gender" class="gender" value="m" id="m">
							<label for="m">남</label> <input type="radio" name="gender"
								class="gender" value="f" id="f"> <label for="f">여</label>
						</p>
						<br>

						<hr>

						<br> <br> <input type="button" id="checkall"
							value="가입하기"> &nbsp; <input type="reset"
							id="enrollcancle" value="취소하기">
					</form>
				</div>

				<div id="en2" class="tab-pane fade">
                    <form method="post" action="/emos/sinsert" id="enrollstore" class="w3-center">
                        
                        
                        
                        <span class="w3-block w3-left-align"> <label class="agreet">&nbsp;&nbsp;&nbsp;이용약관 및 개인정보 수집 및 이용에 모두 동의합니다.</label> <input type="checkbox" value="check1">
						</span> <span class="w3-button w3-block w3-left-align"> <label
							onclick="myFunction('agree4')" class="agreet">이용약관 동의(필수)
						</label> <input type="checkbox" value="check2">
						</span>
                        <div id="agree4" class="w3-hide w3-container agreement">
                            <%@ include file="usedinfo.jsp"%>
                        </div> <span class="w3-button w3-block w3-left-align"> <label
							class="agreet" onclick="myFunction('agree5')">개인정보 수집 및
								이용 동의(필수)</label> <input type="checkbox" value="check3">
						</span>
                        <div id="agree5" class="w3-hide w3-container agreement">
                            <%@ include file="privateinfo.jsp"%>
                        </div>
                        
                        <p style="padding-right:180px">
                            <!-- ID -->ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" name="storeId" id="storeId" maxlength="20" autofocus="autofocus" tabindex="1" placeholder="아이디(영문 소, 대문자, 숫자 조합)" pattern="[A-Za-z0-9]{4,10}" required>
                            <button type="button" id="checkBtn">중복확인</button>
                            <div id="checkDiv"></div>
                        </p>
                        <p>
                            <!-- PASSWORD -->비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="password" name="storePwd1" id="storePwd1" maxlength="20" placeholder="비밀번호(영문 소, 대문자, 숫자 조합)" pattern="[A-Za-z0-9]{4,10}" class="p1" required> </p>
                        <p>
                            <!-- PASSWORD CHECK -->비밀번호 확인 
                            <input type="password" name="storePwd2" id="storePwd2" maxlength="20" placeholder="비밀번호 재확인" pattern="[A-Za-z0-9]{4,10}" class="p1" required>
                            <div id="checkpwd"> </div>
                        </p>
                        <p>
                            <!-- STORE NAME -->상호명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" name="storeName" id="storeName" placeholder="상호명" required>                             <!-- STORE SERIAL -->사업자 번호
                            <input type="text" name="storeSerial" id="storeSerial" placeholder="사업자등록번호" required> </p>
                        <p>
                            <!-- CEO -->대표자 성함 &nbsp;&nbsp;
                            <input type="text" name="ceo" id="ceo" placeholder="대표자명" required>
                            <!-- PHONE -->대표번호 &nbsp;&nbsp;&nbsp;
                            <input type="tel" name="phone" id="phone" placeholder="대표 전화번호" required> </p>
                        <p style="padding-right:120px">
                            <!-- ADDRESS -->주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" id="postcode" name="postcode" placeholder="우편번호">
                            <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"> </p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" id="address" name="address" placeholder="주소">
                            <input type="text" id="address2" name="address2" placeholder="상세주소"> </p>
                        <p style="padding-right:370px">
                            <!-- CATEGORY -->카테고리 &nbsp;&nbsp; &nbsp; &nbsp;
                            <select id="category" name="category" >
                                <option value="피자">피자</option>
                                <option value="치킨">치킨</option>
                                <option value="분식">분식</option>
                                <option value="중국집">중국집</option>
                                <option value="양식">양식</option>
                                <option value="한식">한식</option>
                            </select>
                        </p>
                        <hr>
                        <p style="padding-right:160px">
                            <!-- QR -->
                            QR code&nbsp;&nbsp;&nbsp; <input type="text" name="qr" id="qr" placeholder="QR코드 주소?"> </p>
                        <p>
                            <!-- HOMEPAGE -->
                            홈페이지 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="url" name="homepage" id="homepage" placeholder="http://"> </p>
                        <p>
                            <!-- STORE NOTICE -->
                            공지사항 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="storeNotice" id="storeNotice" placeholder=""> </p>
                        <p>
                            <!-- STORE INTRO -->
                            매장 소개 &nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="8" cols="48" name="storeIntro" id="storeIntro" placeholder="매장 자랑하기"></textarea>
                        </p>
                        <p>
                            <!-- STORE ORIGIN INFO -->
                             원산지 정보 &nbsp;&nbsp;<textarea rows="5" cols="48" name="storeOriginInfo" id="storeOriginInfo" placeholder="원산지정보"></textarea>
                        </p>
                        <p>
                            <!-- STORE BUSINESSTIME -->
                            open~close&nbsp;
                            <input type="datetime" name="storeBusinessTime" id="storeBusinessTime" placeholder="open"> ~
                            <input type="datetime" name="storeBusinessTime" id="storeBusinessTime" placeholder="close"> </p>
                        <p style="padding-right:260px">
                            <!-- STORE MIN PRICE -->
                            최소 주문 가격 &nbsp;<input type="number" name="storeMinPrice" id="storeMinPrice" placeholder="최소주문가격" step="1000"> </p>
                        <p >
                            <!-- confirm, cancel 으로 재확인 -->
                            <input type="submit" value="가입하기" id="register"> &nbsp;
                            <input type="reset" id="enrollcancle" value="취소하기">                             
                        
                        </p>
                    </form>				
				</div>
			</div>

		</div>
	</section>




	<%@ include file="../../footer.jsp"%>

</body>

</html>