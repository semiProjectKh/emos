<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>e'Mos</title>

<style>
	#menubar {
			border : 1px orange solid;
			position: fixed;
			top: 0px;
			height: 120px;
			width: 70%;
			background: white;
	}

	#menu {
			

	}

	#menu li{
			list-style: none;
			float : left;
			margin: 1.5px;
	}

	#menu li a{
			text-decoration:none;
	}

	#hr {
			clear: left;
	}

	#main {
			margin-top: 125px;
	}

	#bottom {
			background-color: orange;
			color: white;
			text-align: center;
			width: 100%;
			position: absolute;

	}

	body {
			width: 70%;
			left: 15%;
			position: relative;
	}
  </style>

</head>
<body>

  <header id="menubar">
  <%@ include file="header.jsp" %>
  </header>
  
  <section id=main>
	<!-- <hr id=hr> -->
	main
  </section>
  <hr>
  <footer id='bottom'>
  <%@ include file="footer.html" %>
  </footer>
</body>
</html>