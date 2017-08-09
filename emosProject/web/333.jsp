<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--     <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
           // $('#lblDisplay').empty();
            //동적 태그 추가
            var strHtml = $('<a href="http://www.naver.com">네이버</a><hr />');
            $('#lblDisplay').append(strHtml);

            $('#btnCreate').click(function () {
                $('#lblTable').empty();
                var row = $('#Text2').val();
                var col = $('#Text1').val();
               
                var strTable = "<table border = '1px'>";

                for (var i = 0; i < row; i++) {
                    strTable += "<tr>";
                    for (var j = 0; j < col; j++) {
                        strTable += "<td>" + (i+1) + "행, " + (j + 1) + "열" + "</td>";
                    }
                    strTable += "</tr>";
                }
                strTable += "</table>";
      
                $('#lblTable').append(strTable);
            });
        });
    </script> -->
</head>
<body>

    <!-- 동적으로 태그 추가 -->
    <span id="lblDisplay"><b>여기에 태그 추가</b></span>
    <!-- 동적 테이블 추가 -->
    행 : <input id="Text1" type="text" />열 : <input id="Text2" type="text" />
    <input id="btnCreate" type="button" value="테이블 동적 생성" /><br />
    <div id="lblTable">

    </div>
</body>
</html>