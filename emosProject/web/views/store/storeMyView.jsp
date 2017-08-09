<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="storeError.jsp"%>
<%@ page import="store.model.vo.Store, java.util.ArrayList"%>
<%
	Store s = (Store)request.getAttribute("store");
%>
	<%@ include file="../header.jsp"%>
	
    <section id="ceo01">
        <div class="w3-content w3-display-container">
            <div class="tab-content">
                <ul class="nav nav-tabs" id="ceotab">
                    <li class="active">
                        <a data-toggle="tab" href="#ceo1" class="w3-deep-orange ceotab">현재 테이블</a></li>
                    <li><a data-toggle="tab" href="#ceo2" class="w3-lime ceotab">내 매장</a></li>
                    <li><a data-toggle="tab" href="#ceo3" class="w3-yellow ceotab">매출 관리</a></li>
                </ul>
                
                <div id="ceo1" class="tab-pane fade in active w3-deep-orange"> 
                    <div id="tableinfo" style="height:100px;">
                        <p>테이블 갯수 총 : </p>
                        <p>사용중인 테이블 : </p>
                        <p>사용 가능 테이블 : </p>
                    </div>
                    
                    <div class="storetable ">
                        <p class="w3-display-topleft tableused">사용중</p>
                        <div class="tablemenu w3-display-middle">
                            아이스크림<br>
                            찐빵<br>
                            피자 <br>
                            햄버거<br>
                        </div>
                        <p class="w3-display-bottomright tableprice">20,000원</p>
                    </div>
                    
                    
                    <div class="storetable">
                        <p class="w3-display-middle tablenotuse">사용 안함</p>
                    </div>

                    
                    <div class="storetable">
                        <p class="w3-display-middle tablenotuse">사용 안함</p>
                    </div>

                    
                    <div class="storetable">
                        <p class="w3-display-topleft tableused">사용중</p>
                        <div class="tablemenu w3-display-middle">
                            피자 <br>
                        </div>
                        <p class="w3-display-bottomright tableprice">12,000원</p>
                    </div>
                
                    
                    <div class="storetable">
                        <p class="w3-display-topleft tableused">사용중</p>
                        <div class="tablemenu w3-display-middle">
                            아이스크림<br>
                        </div>
                        <p class="w3-display-bottomright tableprice">3,000원</p>
                    </div>
                    
                    <div id="bookinginfo" style="height:30px; margin-top:40px;">
                        <p>예약 및 포장 (8개)</p>
                    </div>
                    <div class="bookings w3-center"> </div>
                    <div class="bookings w3-center"> </div>
                    <div class="bookings w3-center"> </div>
                    <div class="bookings w3-center"> </div>
                    <div class="bookings w3-center"> </div>
                    
                    <div id="orderaddbtn"  style="padding-top :75px;">
                    <button id="orderadd" class="orderbtn"  style="margin-left:75%;">주문하기</button>
                    <button id="bookingadd" class="orderbtn">예약하기</button>
                    </div>
                    
                </div>
                
                <div id="ceo2" class="tab-pane fade w3-lime "> 
                    
                </div>

                
                <div id="ceo3" class="tab-pane fade w3-yellow"> 
                    <div id="storeshortinfo" style="height:150px; font-weight:700px">
                        <p>이름 : </p>
                        <p>주소 : </p>
                        <p>사업자 번호 : </p>                        
                        <p>대표번호 :</p>
                    </div>

                    
                    
                    <div class="storeerp" id="todayearn">
                        <p class="w3-display-topmiddle marginT10"><b>오늘의 매상</b></p>    
                        <div class="w3-display-left" style="padding-left:60px;">
                            카 드 :  <br>
                            현 금 :  <br>
                            그 외 :  <br>
                        </div>                        
                        <div class="w3-display-right textR"  style="padding-right:60px;">
                            2,450,000원<br>
                            365,000원<br>
                            15,000원<br>
                        </div>                        
                    </div>                    

                    
                    <div class="storeerp" id="totalearn">
                        <p class="w3-display-topmiddle marginT10"><b>평균 매출</b></p>    
                        <div id="graph-disp w3-display-topmiddle">
           <div class="vGraph">
	<ul>
		<li><span class="gTerm">SUN</span><span class="gBar" style="height:0%"><span>0%</span></span></li>
		<li><span class="gTerm">MON</span><span class="gBar" style="height:20%"><span>20%</span></span></li>
		<li><span class="gTerm">TUE</span><span class="gBar" style="height:30%"><span>30%</span></span></li>
		<li><span class="gTerm">WED</span><span class="gBar" style="height:40%"><span>40%</span></span></li>
		<li><span class="gTerm">THU</span><span class="gBar" style="height:50%"><span>50%</span></span></li>
		<li><span class="gTerm">FRI</span><span class="gBar" style="height:60%"><span>60%</span></span></li>
		<li><span class="gTerm">SAT</span><span class="gBar" style="height:80%"><span>80%</span></span></li>
	</ul>
</div>
                        </div>    
                    </div>                    

                    
                    <div class="storeerp" id="bestmenu">
                        <p class="w3-display-topmiddle marginT10"><b>Best Menu</b></p>    
                        <div class="w3-display-middle">
                            1.  햄버거 (40%)<br>
                            2.  피자 (20%)<br>
                            3.  파스타 (13%)<br>
                        </div>      

                        
                        <div class="w3-display-bottommiddle" id="progress-disp">
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" role="progressbar" style="width:40%">햄버거</div>
                            
                            <div class="progress-bar progress-bar-warning" role="progressbar" style="width:20%">피자</div>
                            <div class="progress-bar progress-bar-danger" role="progressbar" style="width:13%">파스타</div>
                            <div class="progress-bar" role="progressbar" style="width:27%">그 외..</div>
                            
                        </div>
                        </div>
                    </div>                    

                    
                    <div class="storeerp">
                        <p class="w3-display-topmiddle marginT10"><b>기간별 매출 조사</b></p>    
                        <div class="w3-display-middle w3-center" style="width:80%;font-size:17px;padding-top:20px">
                            주간 - 4,303,200원 ( 2.25%)<br>
                            월간 - 11,242,300원 ( 1.02%)<br>
                            연간 - 57,346,578원 (-43.25%)<br>
                        </div>                     
                    </div>                    

                    
                    <div class="storeerp">
                        <p class="w3-display-topmiddle marginT10"><b>매출 증가 추세</b></p>    
                        <div id="graph-disp2 w3-display-topmiddle">
                            <div class="vGraph2">
	<ul>
		<li><span class="gTerm">JAN</span><span class="gBar" style="height:0%"><span>0%</span></span></li>
		<li><span class="gTerm">FEB</span><span class="gBar" style="height:0%"><span>0%</span></span></li>
		<li><span class="gTerm">MAR</span><span class="gBar" style="height:0%"><span>0%</span></span></li>
		<li><span class="gTerm">APR</span><span class="gBar" style="height:0%"><span>0%</span></span></li>
		<li><span class="gTerm">MAY</span><span class="gBar" style="height:0%"><span>0%</span></span></li>
		<li><span class="gTerm">JUN</span><span class="gBar" style="height:0%"><span>0%</span></span></li>
		<li><span class="gTerm">JUL</span><span class="gBar" style="height:20%"><span>20%</span></span></li>
		<li><span class="gTerm">AUG</span><span class="gBar" style="height:30%"><span>30%</span></span></li>
		<li><span class="gTerm">SEP</span><span class="gBar" style="height:40%"><span>40%</span></span></li>
		<li><span class="gTerm">OCT</span><span class="gBar" style="height:50%"><span>50%</span></span></li>
		<li><span class="gTerm">NOB</span><span class="gBar" style="height:60%"><span>60%</span></span></li>
		<li><span class="gTerm">DEC</span><span class="gBar" style="height:80%"><span>80%</span></span></li>
	</ul>
</div>
                        </div>                         
                        
                        
                    </div>                    

                    
                    <div class="storeerp">
                        <p class="w3-display-topmiddle marginT10"><b>선호도</b></p>    
                        <div class="w3-display-middle">
                            1.  30대 남성 (33%)<br>
                            2.  20대 여성 (21%)<br>
                            3.  30대 여성 (7%)<br>
                        </div>                           
                        
                        <div class="w3-display-bottommiddle" id="progress-disp">
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" role="progressbar" style="width:33%">30대 남</div>
                            
                            <div class="progress-bar progress-bar-warning" role="progressbar" style="width:21%">20대 여</div>
                            <div class="progress-bar progress-bar-danger" role="progressbar" style="width:7%">30대 여</div>
                            <div class="progress-bar" role="progressbar" style="width:39%">그 외..</div>
                            
                        </div>
                        </div>                        
                        
                    </div>                    
                    <p style="margin-top:40px;">메모장</p>
                    <textarea class="ceomemo"></textarea>
                
                </div>
            </div>
        </div>        
    </section>
	
	
	
	
	


	<%@ include file="../footer.jsp"%>

</body>

</html>