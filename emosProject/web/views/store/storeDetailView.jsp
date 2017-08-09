<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="storeError.jsp"%>
<%@ page import="store.model.vo.Store, java.util.ArrayList"%>
<%
	Store s = (Store)request.getAttribute("store");
	ArrayList<Store> list = (ArrayList<Store>)request.getAttribute("list");
	String category = s.getCategory();
	String[] cateArr = {"전체메뉴", "피자", "치킨", "햄버거", "중국집", "한식", "양식", "일식"};
%>

<%@ include file="../header.jsp"%>


	<!-- SIDE MENU BAR -->
	<div class="w3-row">
		<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left"
			style="display: none" id="leftMenu">
			<button onclick="closeLeftMenu()"
				class="w3-bar-item w3-button w3-large">&times;</button>

			<%
				for (String cate : cateArr) {
			%>
			<a href="/emos/slist?category=<%=cate%>"
				class="w3-bar-item w3-button"><%=cate%></a>
			<%
				}
			%>
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


	<!-- CONTENTS -->
	<div class="w3-content" style="background: #fff;">
	
		<!-- CATEGORY -->
		<div>
			<h4><a href="/emos/slist?category=전체메뉴">Home</a> > <%=s.getCategory()%></h4>
		</div>
		
		<div class="w3-row">
			<div style="top:0; left:0; width:100%; height:100%">
				<img src="/emos/image/store/detail/1112.jpg" width="100%" height="300px">
					<div class="w3-container w3-center w3-padding-16 w3-large" style="margin-top: -60px; margin-left:10%; margin-right:10%; background: #fff; border-radius: 8px; opacity: 0.8; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
						<h1 class="w3-xxlarge"><b><%=s.getStoreName()%></b></h1>
					</div>
			</div>
		</div>
		
		
		<!-- DETAIL VIEW -->
		<div class="w3-row">
			<div class="" style="padding-left:50px;">
				<h3>상세정보</h3>
				<p>
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					<%=s.getAddress().substring(6).replace(",", " ")%><br>
				</p>
	
	
				<%
					if(s.getStoreBusinessTime() != null) {
				%>
				<p>
					<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
					영업시간 : <%=s.getStoreBusinessTime()%><br>
				</p>
				<%
					}
				%>
	
	
				<%
					if (s.getHomepage() != null) {
				%>
				<p>
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					홈페이지 : <a href="<%=s.getHomepage()%>" target="_blank"><%=s.getHomepage()%></a><br>
				</p>
				<%
					}
				%>
				
	
				<p>
					<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
					대표번호 : <%=s.getPhone()%><br>
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

	<div class="w3-content">
		<!-- MENU BUTTON -->
		<a href="#" class="w3-btn w3-ripple w3-yellow" style="width: 100%; margin-top: 5px; margin-bottom: 5px;"><b>메뉴판 가기</b></a>
	</div>

	<div class="w3-content" style="background: #fff;">
		<!-- PICTURE -->
		<div class="w3-row">
			<div class="w3-col m4">
				<img src="/emos/image/store/search/3333.jpg" style="position: relative; width: 100%; height: 100%;">
			</div>
			<div class="w3-col m4">
				<img src="/emos/image/store/search/1111.jpg" style="width: 100%">
			</div>
			<div class="w3-col m4">
				<img src="/emos/image/store/search/4444.jpg" style="width: 100%">
			</div>
		</div>

		
		<!-- REVIEW -->
		<div class="w3-row">
			<div id="score" style="">
				<h3>- 평가하기 -</h3>
				<h4>4.1 점 ★★★★☆</h4>
				<form id="review" style="position: relative">

					<textarea id="reviewfield"></textarea>
					<button class="w3-button w3-yellow w3-display-bottomright"
						onclick="submit">입력하기</button>

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
		<!-- REVIEW CLOSE -->




--------------------------------------------------------------------------


		<div id="notice">
			- 공지사항 :
			<%=s.getStoreNotice()%>
		</div>


		<div id="serial">
			- 사업자번호 :
			<%=s.getStoreSerial()%>
		</div>

		<% if(s.getHomepage() != null){ %>
		<div id="qr">
			- QR코드 : <br> <img
				src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=<%= s.getHomepage() %>">
			<!-- https://developers.google.com/chart/infographics/docs/qr_codes (구글 참조) -->
		</div>
		<% } %>

		<% if(s.getHomepage() != null){ %>
		<div id="homepage">
			- 홈페이지 : <a href="<%= s.getHomepage() %>" target="_blank"><%= s.getHomepage() %></a>
		</div>
		<% } %>

		<% if(s.getStoreIntro() != null){ %>
		<div id="introduce">
			- 업소소개 :
			<%= s.getStoreIntro() %>
		</div>
		<% } %>

		<% if(s.getStoreOriginInfo() != null){ %>
		<div id="originInfo">
			- 원산지 :
			<%= s.getStoreOriginInfo() %>
		</div>
		<% } %>

	

		<% if(s.getStoreMinPrice() != 0){ %>
		<div id="minPrice()">
			- 최소주문가격 :
			<%= s.getStoreMinPrice() %>
		</div>
		<% } %>

		
	</div>
	<!-- CONTENTS CLOSE -->






















	<!-- script -->

	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=c9peV05tyKffEh9bvxes&submodules=geocoder"></script>

	<script>
      var map = new naver.maps.Map('map');
      var myaddress = '<%= s.getAddress().substring(6, s.getAddress().lastIndexOf(",")) %>';
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
              content: '<h4><a href="<%= s.getHomepage() %>" target="_blank"><%= s.getStoreName() %></a></h4><br><%= s.getAddress() %>'
          });
      });
      </script>

</body>
</html>