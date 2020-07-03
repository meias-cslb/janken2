<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="model.janken2.PlayerCount" %> --%>
<%
	int player = (int)request.getAttribute("player");
	int computer = (int)request.getAttribute("computer");
	String result = (String)request.getAttribute("result");
	int wincount = (int)session.getAttribute("wincount");
	int losecount = (int)session.getAttribute("losecount");
	int drawcount = (int)session.getAttribute("drawcount");
// 	Player playerCount = (Player)session.getAttribute("count");

// 	if(count != null) {
// 		count = Integer.toString(Integer.parseInt(count));
// 	}

%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>じゃんけん結果</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

<!--jQuery本体-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script src="jquery.inview.js" type="text/javascript"></script> -->
<!--自分で作るjQueryプログラム-->
<script>
// 	$('#wincount').on('inview', function() {
// 	$(function() {
	    //ブラウザの表示域に表示されたときに実行する処理
// 	    $('#wincount').css({'color':'white',
// 	    									'font-size': '16px',
// 	    									'font-weight':'bold',
// 	    									'text-decoration':'none',
// 	    									'padding':'8px 10px',
// 	    									'background-color':'orange',
// 	    									'border-radius':'10px',
// 	    									'cursor':'pointer'});
// 	    $('#wincount').hover(
// 			function() {
// 		        //マウスカーソルが重なった時の処理
// 				$('#wincount').css('opacity','0.8');
// 		    },
// 		    function() {
// 		        //マウスカーソルが離れた時の処理
// 		    	$('#wincount').css('opacity','1');
// 		});
// 	});

// 	$('#wincount').hover(function() {
// 		$('#wincount').css('opacity','0.8');
// 	});

</script>
</head>
<body>

	<div id="showresult">
		<h1>じゃんけん結果 :</h1>
		<h2><%= result %></h2>
	</div>

	<div id="count">
			<h2>WIN：<%= wincount %></h2>
			<h2>Lose：<%= losecount %></h2>
			<h2>Draw：<%= drawcount %></h2>
		<%
			if(wincount > 0 || losecount > 0 || drawcount > 0) {
		%>
			<a href="${pageContext.request.contextPath}/result?action=reset" id="countnum">リセットする</a>
		<%
			}
		%>
	</div>

	<div id="result">

		<div id="player">
			<h2>プレイヤー</h2>
			<%
				if(player == 1) {
			%>
				<img src="${pageContext.request.contextPath}/image/gu.png" alt="グー">
			<%
				} else if(player == 2){
			%>
				<img src="${pageContext.request.contextPath}/image/choki.png" alt="チョキ">
			<%
				} else if(player == 3) {
			%>
				<img src="${pageContext.request.contextPath}/image/pa.png" alt="パー">
			<%
				}
			%>
		</div>

		<h2 id="vs">VS</h2>


		<div id="computer">
			<h2>コンピューター</h2>
			<%
				if(computer == 1) {
			%>
				<img src="${pageContext.request.contextPath}/image/gu.png" alt="グー">
			<%
				} else if(computer == 2){
			%>
				<img src="${pageContext.request.contextPath}/image/choki.png" alt="チョキ">
			<%
				} else if(computer == 3) {
			%>
				<img src="${pageContext.request.contextPath}/image/pa.png" alt="パー">
			<%
				}
			%>
		</div>

	</div>

	<form method="GET" action="${pageContext.request.contextPath}/top" id="result-form">
		<input type="submit" value="もう一回勝負する！">
	</form>

</body>
</html>