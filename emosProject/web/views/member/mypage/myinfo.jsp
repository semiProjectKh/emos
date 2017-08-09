<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eMos 내 정보</title>
</head>
<body>





	<%@ include file="../../header.jsp" %>
	
	<div class="w3-content w3-display-container" style="margin-top: 10px">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">내 정보</div>
				<div class="panel-body">
					<ul style="padding-left: 5px" class="none_li">
						<li>이 름: <%=member.getUserId()%></li>
						<li>이메일 : <%=member.getEmail()%></li>
						<li>전화번호 : <%=member.getPhone()%></li>
						<li>생년월일 : <%=member.getBirth()%></li>
						<li>경고횟수 : <%=member.getVerse()%></li>
						<li>가입일 : <%=member.getEnrollDate()%></li>
					</ul>
					<button onclick="update();">수정</button>
				</div>
			</div>
		</div>

		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">즐겨찾기 목록</div>
				<div class="panel-body">
					<ul style="padding-left: 5px" class="none_li">
						<li>이메일 : <%=member.getEmail()%></li>
						<li>전화 : <%=member.getEmail()%></li>
						<li>이메일 : <%=member.getEmail()%></li>
					</ul>
					<button>수정</button>
				</div>
			</div>
		</div>
	</div>
	<div class="w3-content w3-display-container" style="margin-top: 10px">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">댓글목록</div>
				<div class="panel-body">
					<ul style="padding-left: 5px" class="none_li">
						<li>이 름 : <%=member.getEmail()%></li>
						<li>아이디 : <%=member.getEmail()%></li>
						<li>비밀번호 : <%=member.getEmail()%></li>
						<li>비밀번호 확인 :</li>
						<li>전화번호 : <%=member.getEmail()%></li>
						<li></li>
					</ul>
					<button>상세보기</button>
				</div>
			</div>
		</div>

		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">결제 목록</div>
				<div class="panel-body">
					<ul style="padding-left: 5px" class="none_li">
						<li>이메일 : <%=member.getEmail()%></li>
						<li>전화 : <%=member.getEmail()%></li>
						<li>이메일 : <%=member.getEmail()%></li>
					</ul>
					<button>상세보기</button>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../../footer.jsp" %>


</body>
<script type="text/javascript">
var name = "<%=member.getUserId()%>
	";
	$('#location').html(name + " 님 정보").css("color", "white")
			.css("top", "20px").css("left", "60px");
</script>

</html>