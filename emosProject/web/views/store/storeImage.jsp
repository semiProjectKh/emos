<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="storeError.jsp"
	import="store.model.vo.Store, store.model.vo.StoreImage, store.model.service.StoreService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>emos Project</title>
</head>
<body style="background: darkgray;">
	<%@ include file="/header.jsp"%>
	<%
		StoreImage simg = new StoreService().selectStoreImg(store.getStoreNum());
	%>
	
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div id="header02">
			<a href="/emos/index.jsp"> <img id="logo2"
				src="/emos/image/logo/logo.png"></a>
			<div class="w3-display-right" style="margin-right: 20px">
				<button class="w3-button"
					style="border: solid 1px white; border-radius: 3px"
					onclick="document.getElementById('id02').style.display='block'">로그인</button>
				<a href="#" class="w3-button w3-yellow" style="border-radius: 3px">회원가입</a>
			</div>

			<div id="id02" class="w3-modal">
				<div class="w3-modal-content w3-animate-top">
					<div class="w3-container">
						<span
							onclick="document.getElementById('id02').style.display='none'"
							class="w3-button w3-display-topright">&times;</span>

						<form id="login01" class="w3-display-topmiddle">
							<input type="text" id="id" class="w3-display-topleft"
								value="아이디 입력"> <input type="password" id="pw"
								class="w3-display-bottomleft"> <a href="#"
								class="w3-button w3-display-right">로그인</a>
						</form>

						<div class="w3-display-bottommiddle" id="loginservice">
							<a href="#" class="w3-button w3-indigo">기업회원가입</a> <a href="#"
								class="w3-button w3-green">아이디 찾기</a> <a href="#"
								class="w3-button w3-teal">비밀번호 찾기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>


	<!-- SIDE MENU BAR -->
	<div class="w3-row" style="margin-top: 70px;">
		<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left"
			style="display: none" id="leftMenu">
			<button onclick="closeLeftMenu()"
				class="w3-bar-item w3-button w3-large">&times;</button>
			<a href="/emos/slist?category=전체메뉴" class="w3-bar-item w3-button">STORE</a>
			<a href="/emos/views/store/storeUpdateView.jsp" class="w3-bar-item w3-button">기업정보 수정</a> 
			<a href="#" class="w3-bar-item w3-button">메뉴 추가/삭제</a>
			<a href="/emos/views/store/storeImage.jsp" class="w3-bar-item w3-button">매장 사진 추가/삭제</a>
		</div>


		<!-- SIDE MENU BUTTON -->
		<div class="w3-left">
			<button class="w3-button w3-xlarge w3-left" onclick="openLeftMenu()">&#9776;</button>
		</div>

		<!-- MENU SCRIPT -->
		<script>
			function openLeftMenu() {
				document.getElementById("leftMenu").style.display = "block";
			}
			function closeLeftMenu() {
				document.getElementById("leftMenu").style.display = "none";
			}
	
			function openRightMenu() {
				document.getElementById("rightMenu").style.display = "block";
			}
			function closeRightMenu() {
				document.getElementById("rightMenu").style.display = "none";
			}
		</script>
	</div>
	
	
	<!-- ---------------------------------------------------------------------------------------------- -->
	


	<div class="w3-content" style="background:#fff">
		<div class="w3-row w3-center">
			<div class="w3-col m12">
				<h1>IMAGE</h1>
			</div>
		</div>
		<div class="w3-row">
			<form action="/emos/simg?storeNum=<%= store.getStoreNum() %>&up=1" method="post" enctype="multipart/form-data">
				<input type="file" name="mimg">
				<!-- 
				<input type="file" name="img1">
				<input type="file" name="img2">
				<input type="file" name="img3">
				 -->
				 <input type="submit" value="등록">
			</form>
		</div>
		
		
		<div class="w3-row">
			<div style="top:0; left:0; width:100%; height:100%">
				<img src="/emos/storeImg/1/<%= simg.getImgMain() %>" width="100%" height="300px">
					<div class="w3-container w3-center w3-padding-16 w3-large" style="margin-top: -60px; margin-left:10%; margin-right:10%; background: #fff; border-radius: 8px; opacity: 0.8; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
						<h1 class="w3-xxlarge"><b><%=store.getStoreName()%></b></h1>
					</div>
			</div>
		</div>
		<!-- DETAIL VIEW -->
		<div class="w3-row">
			<div class="" style="padding-left:50px;">
				<h3>상세정보</h3>
				<p>
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					<%=store.getAddress().substring(6).replace(",", " ")%><br>
				</p>
	
	
				<%
					if(store.getStoreBusinessTime() != null) {
				%>
				<p>
					<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
					영업시간 : <%=store.getStoreBusinessTime()%><br>
				</p>
				<%
					}
				%>
	
	
				<%
					if (store.getHomepage() != null) {
				%>
				<p>
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					홈페이지 : <a href="<%=store.getHomepage()%>" target="_blank"><%=store.getHomepage()%></a><br>
				</p>
				<%
					}
				%>
				
	
				<p>
					<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
					대표번호 : <%=store.getPhone()%><br>
				</p>
	
				<p>
					<span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>
					대표메뉴 : <br>
				</p>
			</div>
			
			<!-- 주소 위치(네이버) -->
			<div id="map" style="width: 100%; height: 400px;">
			</div>
		</div>
		<!-- DETAIL VIEW CLOSE -->
	</div>
	
	<!-- script -->

	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=c9peV05tyKffEh9bvxes&submodules=geocoder"></script>

	<script>
      var map = new naver.maps.Map('map');
      var myaddress = '<%= store.getAddress().substring(6, store.getAddress().lastIndexOf(",")) %>';
      map.setOptions("mapTypeControl", true); // 일반, 위성 옵션
      // 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          
          // 마크 클릭시
          var infowindow = new naver.maps.InfoWindow({
              content: '<h4><a href="<%= store.getHomepage() %>" target="_blank"><%= store.getStoreName() %></a></h4><br><%= store.getAddress() %>'
          });
      });
      </script>
	

</body>
</html>