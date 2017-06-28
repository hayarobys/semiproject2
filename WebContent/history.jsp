<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히스토리</title>
<style type="text/css">

@font-face {
	font-family: "Myriad";
	src: url('/kanye/font/Myriad-Pro-Bold_31631.eot')
		format('embedded-opentype');
	src: url('/kanye/font/Myriad-Pro-Bold_31631.ttf') format('truetype');
	src: url('/kanye/font/Myriad-Pro-Bold_31631.woff') format('woff');
}

body {
	margin: 0;
}




.scene {
	height: 100vh;
	background-size: cover;
	overflow: hidden;
	background-attachment: fixed;
}

.scene.one {
	background-image: url(historyImage/history01-01.png);
}

.scene.two {
	background-image: url(historyImage/history02-01.png);
}

.scene.three {
	background-image: url(historyImage/history03-01.png);
}

.scene.four {
	background-image: url(historyImage/history04-01.png);
}

.scene.five {
	background-image: url(historyImage/history05-01.png);
	
}

#bottom{
font-family: "Myriad";
position:absolute;
margin: 0px;
bottom: 5%;
right:2%;
text-align:center;
z-index: 10;
	width: 170px;
	height: 36px;
	border-radius: 18px;
	background-color: #b3a695;
	color: white;
	font-weight: bold;
	font-size: 1.5rem;
	text-align: center;
	text-decoration: none;



}

#top{
font-family: "Myriad";
position:absolute;
margin: 0px;
top: 5%;
left:2%;
text-align:center;
z-index: 10;
	width: 170px;
	height: 36px;
	border-radius: 18px;
	background-color: #edede4;
	color: white;
	font-weight: bold;
	font-size: 1.5rem;
	text-align: center;
	text-decoration: none;

}





</style>
</head>

<body>

	
	<div class="scene one" id="first"><a href="http://localhost:8090/kanye/main.jsp" id="top">back to main</a></div>
	<div class="scene two"></div>
	<div class="scene three"></div>
	<div class="scene four"></div>
	<div class="scene five"><a href="#first" id="bottom">back to top</a></div>
	
</body>

</html>