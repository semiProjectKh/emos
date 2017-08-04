<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, menu.model.vo.Menu,member.model.vo.Member"%>
<%
	ArrayList<Menu> list = (ArrayList<Menu>) request.getAttribute("list");
	//Member member = (Member) session.getAttribute("member");
%>


<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="/emos/css/menu.css"> 
</head>

<body>
	<%@ include file="../../header.jsp"%>
	

	<section id="mennu01">
		<div id="side">
			<img src="/emos/views/menu1.jpg" id="mimg">
			<script type="text/javascript">
				var img = document.getElementById("mimg");
				$(function() {
					$("#side").css("height", img.height);
				});
			</script>
			<%
			for(Menu n : list){ 
			%>
				<div class="menu" id="<%=n.getMenu_num() %>"  name="<%=n.getMenu_name() %>" price="<%=n.getMenu_price()%>"
				<%if(n.getMenu_modal()==1){ %>
					data-toggle="modal" data-target="#myModal1"
				<%}%>
					style="left:<%=n.getMenu_left()%>%;
							top:<%=n.getMenu_top()%>%;
						  width:<%=n.getMenu_width()%>%;
						  height:<%=n.getMenu_height()%>%;"></div>
			<%
			} 
			%>
		</div>
	</section>

	<section id="menu02">
	
	<h1>test</h1>
	<h1><%=list.get(1).getMenu_name() %></h1>
	
	</section>


	<%@ include file="../../footer.html"%>	
	
	
    <script>
	$(function(){ 
		$('.menu').click(function(){
			var id =  $(this).attr('id');
			$("#menu02").append($('#'+id).attr('name')+$('#'+id).attr('price')+'<br>');
		}); 
	});
	</script>

</body>
</html>