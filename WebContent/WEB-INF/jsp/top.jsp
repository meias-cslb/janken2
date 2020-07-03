<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>じゃんけん</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

<!--jQuery本体-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script src="jquery.inview.js" type="text/javascript"></script> -->
<!--自分で作るjQueryプログラム-->
<script>
// 	$('#error').on('inview', function() {
// 	$(function() {
	    //ブラウザの表示域に表示されたときに実行する処理
// 	    $('#error').css({'color':'red', 'font-size': '20px', 'font-weight':'bold'});
// 	});
</script>
</head>
<body>
	<h1>じゃんけん</h1>

	<%
		if(message != null) {
	%>
		<div id="error"><%= message %></div>
	<%
		}
	%>

	<form method="GET" action="${pageContext.request.contextPath}/result">
		<div>
			<p><label><input type="radio" name="hand" value="1">
						<img src="${pageContext.request.contextPath}/image/gu.png" alt="グー"></label></p>
			<p><label><input type="radio" name="hand" value="2">
						<img src="${pageContext.request.contextPath}/image/choki.png" alt="チョキ"></label></p>
			<p><label><input type="radio" name="hand" value="3">
						<img src="${pageContext.request.contextPath}/image/pa.png" alt="パー"></label></p>
		</div>
		<input type="submit" value="Let's Fight!">
	</form>

</body>
</html>