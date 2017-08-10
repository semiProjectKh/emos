<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reply.model.vo.Reply, java.util.*"%>
<%
	ArrayList<Reply> reply = (ArrayList<Reply>)request.getAttribute("replylist");
%>

<%@ include file="../header.jsp" %>
	
    <section id="myinfo01">
	<div class="w3-content w3-display-container">
		<div class="col-md-6 myinfo">
			<div class="panel panel-default">
				<div class="panel-heading  w3-deep-purple">내 정보</div>
				<div class="panel-body">
					<ul style="padding-left: 5px" class="none_li">
						<li>이 름: <%= member.getUserId() %></li>
						<li>이메일 : <%=member.getEmail()%></li>
						<li>전화번호 : <%=member.getPhone() %></li>
						<li>생년월일 : <%= member.getBirth() %></li>
						<li>경고횟수 : <%= member.getVerse() %></li>
						<li>가입일 : <%= member.getEnrollDate() %></li>
					</ul>
					<button onclick="update();">수정</button>
				</div>
			</div>
		</div>

		<div class="col-md-6 myinfo">
			<div class="panel panel-default">
				<div class="panel-heading  w3-indigo">즐겨찾기 목록</div>
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
	<div class="w3-content w3-display-container">
        
		<div class="col-md-6 myinfo">
			<div class="panel panel-default">
				<div class="panel-heading w3-blue">댓글목록</div>
				<div class="panel-body">
					
					<ul style="padding-left: 5px" class="none_li" id="f">
						<% if(reply.size()>0){
							for(Reply r : reply) {%>

						<li><%= r.getContent() %> &nbsp; &nbsp; <%= r.getReplyDate() %></li>

						<%	}
						}else{%>
							<li>댓글 목록이 없습니다.</li>
						<%} %>
					</ul>
					
					<button onclick="detailcontent();">상세보기</button>
				</div>
			</div>
		</div>
		
		<div class="col-md-6 myinfo">
			<div class="panel panel-default">
				<div class="panel-heading  w3-cyan">최근 결제 목록</div>
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
</section>

	<%@ include file="../footer.jsp"%>


</body>

<style>
/*
            =====================
            ==      mypage     ==
            =====================
            */

#myinfo01{
    height: 600px;
}

.none_li{
	list-style-type:none;
}


.myinfo{
    padding: 3px;
}

.myinfo>div{
    margin: 0px;
    height: 300px;

}

.panel-heading{
    font-weight: 700;
    text-align: center;

}
.myinfo button{
    width: 40%;
    height: 40px;
    position: absolute;
    bottom: 20px;
    text-align: center;
    border-radius: 5px;
    color: #666;
    font-weight: 700;
}

</style>

<script type="text/javascript">
	var name = "<%=member.getUserId()%>";
	$('#location').html(name + " 님 정보").css("color", "white")
			.css("top", "20px").css("left", "60px");
	
    function logout(){
    	location.href="/emos/elogout";
    }
    
    function update(){
    	location.href="/emos/views/member/update.jsp";
    }
    
    function detailcontent(){
    	var userid = "<%= member.getUserId() %>";
    	location.href="/emos/einfo?num=2&userid=" + userid
    }
	
</script>

</html>