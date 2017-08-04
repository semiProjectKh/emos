<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
    	<meta charset="UTF-8">
    	<title>E Mobile Menu Order System.</title>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    	<link rel="stylesheet" href="css/style.css"> 
    </head>

<body>
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active"> <img src="image/bg/1111.jpeg">
                <div class="carousel-caption"></div>
            </div>
            <div class="item"> <img src="image/bg/2222.jpg">
                <div class="carousel-caption"></div>
            </div>
            <div class="item"> <img src="image/bg/3333.png">
                <div class="carousel-caption"></div>
            </div>
            <div class="item"> <img src="image/bg/4444.jpeg">
                <div class="carousel-caption"></div>
            </div>
        </div>
    </div>
    <header>
        <div id="blackpad"></div>
        <div id="logobox"> 
            <img id="logo" src="image/logo/logo.png">
            <p> electric
                <br>Moblie Menu &
                <br>order
                <br>system </p>
        </div>
           
        <div id="private">
            <div class="navbar-collapse collapse ">
                <ul class="nav navbar-nav">
                    <li><span class="glyphicon glyphicon-lock w3-center" aria-hidden="true" onclick="document.getElementById('id02').style.display='block'"> 로그인</span></li>
                    <li><span class="glyphicon glyphicon-plus w3-center" aria-hidden="true"><a href="/emos/views/member/enroll/enroll.jsp" style="text-decoration:none"> 회원가입 </a></span></li>
                </ul>
            </div>
        </div>
        
    </header>
    
    <section id="main01">
        <div class="container">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    
                    <!-- Trigger/Open the Modal -->                    
                    <span id="mbtn01" class="glyphicon glyphicon-cutlery w3-display-middle mainbtn" aria-hidden="true" onclick="document.getElementById('id01').style.display='block'">
                    <p style="font-size :15px;text-align:center"><b>매장검색</b></p>
                    
                    
                    </span>

                    <!-- The Modal -->
                    <div id="id01" class="w3-modal ">
                        <div class="w3-modal-content w3-animate-opacity" style="margin-top:200px" >
                            <div class="w3-container"> 
                                <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
                                    <div class="w3-display-middle w3-center">
                                   <img src="image/AD/3333.JPG" width="345" height="100" style="margin-bottom:10px">
                                   <img src="image/AD/3333.JPG" width="345" height="100" style="margin-bottom:10px">
                                    <div class="input-group" id="search">
                                    <input type="text" class="form-control" placeholder="매장이름 지역명 을 입력하세요!!">
                                    <span class="input-group-btn">
                                        <a href="views/search.html" class="btn btn-default" type="button">검색</a>
                                    </span>
                                </div><!-- /input-group -->
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
                
                
                
                <div class="col-sm-4">  
                    
                    <!-- Trigger/Open the Modal -->                    
                        <span class="glyphicon glyphicon-blackboard w3-display-middle mainbtn" aria-hidden="true" onclick="document.getElementById('id02').style.display='block'">
                            
                            <p style="font-size :15px;text-align:center"><b>싸장님오피스</b></p>
                            
                        </span>    

                    <!-- The Modal -->
                    <div id="id02" class="w3-modal">
                        <div class="w3-modal-content w3-animate-opacity">
                            <div class="w3-container"> 
                                <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-display-topright">&times;</span>
                                <form id="login01" class="w3-display-topmiddle" action="elogin" method="post">
                                    <input type="text" id="id" class="w3-display-topleft" placeholder="아이디 입력">
                                    
                                    <input type="password" id="pw" class="w3-display-bottomleft"  placeholder="비번 입력">
                                    
                                    <button class="w3-button w3-display-right" onclick="submit()" style="color:white;background: #0c0642;height: 60px;text-align: center;">로그인</button>
                                </form>                               
                                <div class="w3-display-bottommiddle" id="loginservice">
                                <a href="views/member/enroll/enroll.jsp" class="w3-button w3-indigo">회원가입</a>
                                <a href="#" class="w3-button w3-green">아이디 찾기</a>
                                <a href="#" class="w3-button w3-teal">비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                    </div>                     
                    
                    
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
    </section>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-12"> <a href="#">개인정보 처리방침</a> | <a href="#">저작권 정책</a> | <a href="#">관련
						사이트</a>
                    <br>
                    <br>
                    <p>(34055) 경기도 안양시 동안구 호계동 전화: 010-6635-7088, 팩스: 031-123-5678</p>
                    <p>Copyright (C) 2017 KH Information & Security Institute. All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </footer>
</body>

</html>


