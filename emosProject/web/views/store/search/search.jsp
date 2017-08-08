<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="/emos/css/search.css"> 
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%@ include file="../../header.jsp"%>
	
    <section id="searchsec01">
        <div id="searchAD">
            <div class="w3-display-container">
                <img class="mySlides" src="/emos/image/AD/2222.jpg" style="width:100%">
                <img class="mySlides" src="/emos/image/AD/3333.jpg" style="width:100%">
                <img class="mySlides" src="/emos/image/AD/4444.jpg" style="width:100%">

            <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
            <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
            </div>

            <script>
                var slideIndex = 1;
                showDivs(slideIndex);

                function plusDivs(n) {
                    showDivs(slideIndex += n);
                }

                function showDivs(n) {
                    var i;
                    var x = document.getElementsByClassName("mySlides");
                    if (n > x.length) {slideIndex = 1}    
                    if (n < 1) {slideIndex = x.length}
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";  
                    }
                    x[slideIndex-1].style.display = "block";  
                }
            </script>

            
        
        
        
        </div>
        <div id="searchbar">
            <div class="input-group w3-display-bottommiddle" id="search">
                <input type="text" class="form-control" placeholder="매장이름 지역명 을 입력하세요!!">
                <span class="input-group-btn">
                        <a href="views/search.html" class="btn btn-default" type="button">검색</a>
                </span>
            </div>
        </div>
    </section>

    
    
    
    <section id="searchsec02">
        <div class="w3-content w3-display-container">
            <p style="color : black; font-size :20px">- 검색결과 -</p>
            <a href="detail.html">
            <div class="w3-third w3-section">
                <div class="w3-card-4">
                    <img src="/emos/image/store/search/2222.jpg" style="width:100%">
                    <div class="w3-container w3-white">
                        <h4>waffle benatto</h4>
                        <p>업   종 : 디저트, 요식업, 카페 <br> 
                           주   소 : 경기도 안양시 안양 1동<br>
                           전화번호 : 010-6635-7088<br> 
                           대표메뉴 : 플레인 와플 셋트, 베트남 커피</p>
                    </div>
                </div>
            </div>
            </a>

            <a href="detail.html">
            <div class="w3-third w3-section">
                <div class="w3-card-4">
                    <img src="/emos/image/store/search/1111.jpg" style="width:100%">
                    <div class="w3-container w3-white">
                        <h4>Island of player</h4>
                        <p>업   종 : 한식, 퓨전 한식 <br> 
                           주   소 : 경기도 의왕시 청계동 백운호수로<br>
                           전화번호 : 010-6635-7777<br> 
                           대표메뉴 : 영계백숙 오오오오 </p>
                    </div>
                </div>
            </div>
            </a>            
                
            <a href="detail.html">
            <div class="w3-third w3-section">
                <div class="w3-card-4">
                    <img src="/emos/image/store/search/2222.jpg" style="width:100%">
                    <div class="w3-container w3-white">
                        <h4>은나무 숲</h4>
                        <p>업   종 : 카페, 디저트, 케익 <br> 
                           주   소 : 서울시 강남구 역삼동<br>
                           전화번호 : 010-6635-7088<br> 
                           대표메뉴 : 아메리카노, 조각케익, 레드벨벳케익</p>
                    </div>
                </div>
            </div>
             </a>               
                
            <a href="detail.html">
            <div class="w3-third w3-section">
                <div class="w3-card-4">
                    <img src="/emos/image/store/search/4444.jpg" style="width:100%">
                    <div class="w3-container w3-white">
                        <h4>kaith wonder land</h4>
                        <p>업   종 : 디저트, 요식업, 카페 <br> 
                           주   소 : 경기도 시흥시 정왕동 <br>
                           전화번호 : 010-6635-7088<br> 
                           대표메뉴 : 구슬 아이스모카, 바닐라 라떼</p>
                    </div>
                </div>
            </div>
            </a>
            
        </div>
    </section>
	
	
	
	
	
			
	
	<%@ include file="../../footer.jsp"%>
</body>

</html>