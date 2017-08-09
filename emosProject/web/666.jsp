<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
//스크롤 이벤트 발생 시
$(window).scroll(function() {
var scrollHeight = $(window).scrollTop()+$(window).height();
var documentHeight = $(document).height();
if (scrollHeight = documentHeight) {
for(var i=0; i <10; i++) {
$("<h1>무한 스크롤 </h1>").appendTo("body");
}
}
});
});
$(document).ready(function() {
for(var i=0; i<20; i++) {
$("<h1>무한 스크롤</h1>").appendTo("body");
}
});
</script><body></body>
</html>