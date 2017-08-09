<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="storeError.jsp"%>
<%@ page import="store.model.vo.Store, java.util.ArrayList"%>
<%
	ArrayList<Store> list = (ArrayList<Store>) request.getAttribute("list");
	String category = (String) request.getAttribute("category");
	String[] cateArr = {"전체메뉴", "피자", "치킨", "햄버거", "중국집", "한식", "양식", "일식"};
%>
<%@ include file="../header.jsp"%>

<!-- SIDE MENU BAR -->
<div class="w3-row" style="margin-top: 0px;">
	<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left"
		style="display: none" id="leftMenu">
		<button onclick="closeLeftMenu()"
			class="w3-bar-item w3-button w3-large">&times;</button>

		<%
			for (String cate : cateArr) {
		%>
		<a href="/emos/slist?category=<%=cate%>" class="w3-bar-item w3-button"><%=cate%></a>
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
		</script>
</div>


<!-- CONTENTS -->
<section id="search01">
	<div class="w3-content w3-display-container" id="listContent">
		<div class="w3-row w3-center">
			<div class="w3-col m12">
				<h1><%=category%></h1>
			</div>
		</div>
	</div>
</section>
<section id="search02">
	<div class="w3-content w3-display-container">
		<!-- STORE LIST -->
		<%
			for (Store s : list) {
		%>
		<a href="/emos/sdetail?storeNum=<%=s.getStoreNum()%>">
			<div class="w3-third">
				<div class="w3-card-4">
					<img src="/emos/image/store/search/1111.jpg" style="width: 100%">
					<div class="w3-container w3-white" style="height: 200px;">
						<h4><%=s.getStoreName()%></h4>
						<p>
							업 종 :
							<%=s.getCategory()%><br>
							<!-- 주   소 : <%=s.getAddress().substring(6).replace(",", " ")%><br> -->
							주 소 :
							<%=s.getAddress().substring(6, s.getAddress().lastIndexOf(","))%><br>
							전화번호 :
							<%=s.getPhone()%><br> 대표메뉴 :
						</p>
					</div>
				</div>
			</div>
		</a>
		<%
			}
		%>

	</div>

</section>

<!-- CONTENTS CLOSE -->



<%@ include file="../footer.jsp"%>
<!-- MORE LIST SCRIPT -->
<script>
				var page = 0;
				var category = "<%=category%>";
	$(window)
			.scroll(
					function() {
						if ($(window).scrollTop() == $(document).height()
								- $(window).height()) {
							page++;
							$
									.ajax({
										url : "/emos/slistmore",
										data : {
											page : page,
											category : category
										},
										type : "post",
										dataType : "json",
										success : function(data) {
											var jsonStr = JSON.stringify(data); //객체를 문자열로 변환
											var json = JSON.parse(jsonStr);

											var values = $("#listContent")
													.html();

											for ( var i in json.list) {
												values += "<a href='/emos/sdetail?storeNum="
														+ json.list[i].storeNum
														+ "'><div class='w3-third'><div class='w3-card-4'><img src='/emos/image/store/search/1111.jpg' style='width:100%'><div class='w3-container w3-white' style='height: 200px;'><h4>"
														+ decodeURIComponent(json.list[i].storeName)
														+ "</h4><p>업   종 : "
														+ decodeURIComponent(json.list[i].category)
														+ "<br>주   소 : "
														+ decodeURIComponent(json.list[i].address)
														+ "<br>전화번호 : "
														+ decodeURIComponent(json.list[i].phone)
														+ "<br>대표메뉴 : </p></div></div></div></a>";
											}

											$("#listContent").html(values);

										},
										error : function() {
											alert("fail");
										}
									});
						}
					});
</script>

</body>
</html>