<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="reply.model.vo.Reply, java.util.*, java.sql.Date"%>
<%
	// dd
	ArrayList<Reply> list = (ArrayList<Reply>) request.getAttribute("list");
		
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
 	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue(); 
	int pageMax = ((Integer)request.getAttribute("pageMax")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main {
	margin-top: 125px;
}
</style>
<script type="text/javascript" src="/e/views/js/jquery-1.11.3.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script type="text/javascript" src="/e/views/js/jquery.raty.js"></script>
<script type="text/javascript">
	$(function() {
		$('label#star').raty({
			score : 5,
			path : "/e/views/images",
			width : 200,
			click : function(score, evt) {
				$("#starRating").val(score);
				$("#displayStarRating").html(score);
			}
		});
	});
</script>
<script>
$( document ).ready(function() {
	   $("a.good").on("click", function(){
		   /* $("a#good").on("click", function(){ */
	      var rNumValue = $(this).attr("id").substring(4);
	      var tempA = $(this);

	      $.ajax({
	         url : "/e/rgood",
	         data : {rNum : rNumValue},
	         type : "get",
	         success : function(data){
	        	 if(data=="true"){
	        		 tempA.text("♥" + (Number(tempA.text().substring(1)) + 1));
	 	            alert("성공(" + data + ")");
	        	 }else{
	        		 alert("이미 좋아요 완료!");
	        	 }
	            
	         },
	         error : function(data){
	            // tempA.text("♥" + (Number(tempA.text().substring(1)) + 1));
	            alert("실패(" + data + ")");
	         }
	      });
	   });
	});
</script>

</head>
<body>
	<header id="menubar">
		<%@ include file="../../header.jsp"%>
	</header>
	<hr id=hr>
	<section id=main>
		<%
			if (member != null) {
		%>
		&nbsp; &nbsp; &nbsp;

		<form action="rinsert" method="post">
			<input type="hidden" name="rwriter" value="<%=member.getUserId()%>">
			<table align="center" width="600" bgcolor="yellow" border="1" id="test11">
				<tr>
					<td><input type="text" readonly
						value="<%=member.getUserName()%>"></td>
				</tr>
				<tr>
					<td>&nbsp; <label id="star"></label> <!-- <label for="starRating">Value : </label> -->
						<!-- <input type="text" id="starRating" value="0" /> --> <input
						type="hidden" id="starRating" value="5" name="rstar">

						&nbsp; <label id="displayStarRating">5</label> <label
						for="displayStarRating">/5</label>
					</td>
				</tr>
				<tr>
					<td><textarea rows="7" cols="50" name="rcontent"
							placeholder="리뷰를 입력해주세요."></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="등록하기"> &nbsp; <input type="reset" value="등록취소">
					</td>
				</tr>
			</table>
		</form>
		<%
			}
		%>
		&nbsp;
				<!-- <div style="width:100%; height:200px; overflow:hidden"> -->
				<div class="wrdLatest" id=9>
				
		<table align="center" cellpadding="10" cellspacing="0" border="1"
			width="700" id="ptable">
			<%
				for (Reply reply : list) {
			%>
			<%
				if (reply.getStoreNum() == 1) {
			%>
			<tr>
				<td><%=reply.getReplyNum()%></td>
				<td><%=reply.getContent()%></td>
				<td>
					<% for(int i = 0; i < reply.getPoint(); i++){ %> <img
					src="/e/views/images/star-on.png"> <% } %> <% for(int i = 5; i > reply.getPoint(); i--){ %>
					<img src="/e/views/images/star-off.png"> <% } %> <label
					id="displayStarRating2" style="padding-left: 10px;"> <%= reply.getPoint() %>
				</label> <label for="displayStarRating2">/5</label>
				</td>
				<% if( member != null){ 
					 if(member.getUserId().equals(reply.getUserId()) == false){
				%>
				
				<td><a id= "good<%= reply.getReplyNum() %>"style="text-decoration: none;" class="good">♥<%= reply.getGood() %></a></td>
				<% } if(member.getUserId().equals(reply.getUserId()) == true){ %>
				<td>♥<%= reply.getGood() %></td>
				<td><a href="/e/rdelete?rnum=<%= reply.getReplyNum() %>">삭제</a>
				</td>
				<% }}else{ %>
				<td>♥<%= reply.getGood() %></td>
				<% }
				} //stor_num if문 close
			} //for close%>
			</tr>
			
<%--  <tr align="center" valign="middle"> 
        <td colspan="2"> 
         <% if(member != null){ %>            
            <a href="/first/views/Reply/ReplyReplyForm.jsp?bnum=<%= reply.getReplyNum() %>&page=<%= currentPage %>"> [댓글달기] </a> &nbsp;&nbsp; 
         <% } %>          
        </td> 
    	</tr> --%>
    	
		</table>
		
		</div>
	<button type="button" id="test5" class="test5" style="text-decoration: underline;">더보기 + </button>
	<script>
		var page = "<%= currentPage %>";
			$("#test5").click(function(){
				//page++;
			console.log(page);
				$.ajax({
					url : "rdetail",
					data : {page : page},
					type : "post",
					/* dataType : "json", */
					success : function(data){
						//console.log("데이타"+data);
						var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
						//console.log(jsonStr);
						var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
						
						var values = $("table#ptable").html();
						for(var i in json.list){
							
							//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
							values += "<tr><td>" + json.list[i].replyNo + "</td><td>" + json.list[i].storeNo + "</td><td>" + json.list[i].userId + "</td><td>" + 
							decodeURIComponent(json.list[i].content) + 
							"</td><td>" + json.list[i].point + "</td><td>" + json.list[i].replyDate + "</td><td>" + json.list[i].good + "</td></tr>";
						}
						
						$("table#ptable").append(values);
					
					},
					error : /* function(request,status,error){

						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
					 */
					
					function(xhr){
						var jsonResponse = JSON.parse(xhr.responseText);
						alert(jsonResponse.msg);
					}
					
				});
				
			});		//click
</script>
	</section>
	<p align="center">
		<a href="/e/index.jsp">시작페이지로 이동</a> &nbsp; <a
			href="/first/blist?page=1">목록보기로 이동</a>
	</p>
	<hr>

	<footer>
		<%@ include file="../../footer.html"%>
	</footer>
</body>
</html>
