<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="/emos/css/detail.css"> 
</head>

<body>
	<%@ include file="../../header.jsp" %>


    <section id="detail01" class="detail ">
        <div class="w3-content w3-display-container ">
            <img src="/emos/image/store/detail/1112.jpg" width="100%" height="300px">
            
            <div id="detailname" class ="w3-display-middle">
                <div></div>
                <b class ="w3-center">Waffle house</b>
            </div>
            
            <div id="detailinfo" style="color:black" ><br>
                <h3>상세정보</h3>
                <p>
                    <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 강남구 테헤란로2길 27 2층 (우)06241 지번역삼동 826-26 <br>
                </p>
                <p>
                <span class="glyphicon glyphicon-time" aria-hidden="true"></span>                
                영업시간 (현)영업중
                 매일 11:00 ~ 23:00<br>
                </p>

                <p>
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                홈페이지
                 emoi.ithope.kr<br>
                </p>
                
                <p>                
                <span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
                연락처
                 02-568-0788 대표번호<br>
                </p>                

                <p>                
                <span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>
                대표메뉴 : 아메리카노, 레드벨벳케익, 트와이스 라떼<br>
                </p>                
            </div>
        </div>
    </section>

    <section id="detail02" class="detail">
        <div class="w3-content w3-display-container w3-display-middle">
            <!-- * Daum 지도 - 지도퍼가기 -->
            <!-- 1. 지도 노드 -->
            <div id="daumRoughmapContainer1501481393966" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
            <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://spi.maps.daum.net/imap/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
            <script charset="UTF-8">
	            new daum.roughmap.Lander({
		          "timestamp" : "1501481393966",
                  "key" : "iwt3",
		          "mapHeight" : "300"
	            }).render();
            </script>
        </div>
    </section>

    <section id="detail03" class="detail">
        <div class="w3-content w3-display-container" >
            <a class="w3-btn w3-ripple w3-yellow" style="width:100%" href="menu.html"><b>메뉴판 가기</b></a>
        </div>
    </section>

    <section id="detail04" class="detail">
        <div class="w3-content w3-display-container" style="padding:0px">
            <div class="col-sm-12 col-md-6 col-lg-4" >
                    <img src="/emos/image/store/search/3333.jpg" style="width:100%">
            </div>
            <div class="col-sm-12 col-md-3 col-lg-4" >
                    <img src="/emos/image/store/search/1111.jpg" style="width:100%">
            </div>
            <div class="col-sm-12 col-md-3 col-lg-4" >
                    <img src="/emos/image/store/search/4444.jpg" style="width:100%">
            </div>
        </div>
</section>
    
    <section id="detail05" class="detail">
        <div class="w3-content w3-display-container" >
            <div id="score">

                <h3>- 평가하기 -</h3>
                <h4>4.1 점 ★★★★☆</h4>
                <form id="review" style="position:relative">
                    
                    <textarea id="reviewfield"></textarea>
                    <button class="w3-button w3-yellow w3-display-bottomright" onclick="submit">입력하기</button>

                </form>
                <hr>
                
                <table class="w3-table w3-bordered" id="reviewtable">
                    <tr>
                        <td>★★★</td>
                        <td>걸래판 물인줄~ 이래서 평양냉면 평양냉면 하는구나</td>
                        <td>user9**</td>
                    </tr>
                    <tr>
                        <td>★</td>
                        <td>암이 나았어요.~ 뭘 넣은거지..;; 그리고 한여름에 따뜻한 물은 좀..;;</td>
                        <td>923b**</td>
                    </tr>
                    <tr>
                        <td>★★★★★</td>
                        <td>delicious!!! korean is hell~</td>
                        <td>jjih****</td>
                    </tr>
                    
                    <tr>
                        <td>★★</td>
                        <td>여름엔 따뜻하고 겨울엔 시원한 가게..</td>
                        <td>jjih****</td>
                    </tr>

                    <tr>
                        <td>★</td>
                        <td>손맛 손맛 하더니 정말로 손톱이 나왔어요!! ㅅㅂ..</td>
                        <td>jjih****</td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
	<%@ include file="../../footer.jsp" %>
</body>
</html>