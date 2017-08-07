<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="aritcleView">
         <div>1</div>
         <div>2</div>
         <div>3</div> 
   </div>
</body>

<script type="text/javascript">
// Add contents for max height
$(document).ready(function () {
$(document).scroll(function() {
var maxHeight = $(document).height();
var currentScroll = $(window).scrollTop() + $(window).height();

if (maxHeight <= currentScroll + 100) {
$.ajax({
})
}
})
});
</script>
</html>