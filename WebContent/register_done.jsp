<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>가입을 축하합니다!</title>
<style type="text/css">

@font-face {
	font-family: "Myriad";
	src: url('/kanye/font/Myriad-Pro-Bold_31631.eot')format('embedded-opentype');
	src: url('/kanye/font/Myriad-Pro-Bold_31631.ttf') format('truetype');
	src: url('/kanye/font/Myriad-Pro-Bold_31631.woff') format('woff');
}

/* @font-face {
	font-family: "manbal";
	src: url('/kanye/font/manbal.eot) format('embedded-opentype');
	src: url('/kanye/font/manbal.ttf') format('truetype');
	src: url('/kanye/font/manbal.woff') format('woff');
} 
 */
body {
	margin: 0;
	background-color: #edede4;
}

.menu div, ul, li {
	margin: 0;
	padding: 0;
}

.menu {
	position: absolute;
	top: 2%;
	left: 2%;
	z-index: 10;
	width: 100px;
	height: 100px
}

.menu ul li {
	float: left;
	z-index: 10;
	list-style-type: none;
}

.menu a {
	font-family: "Myriad";
	z-index: 10;
	color: #b3a695;
	font-size: 30px;
	padding: 0 10px 0 10px;
	text-decoration: none;
}

.menu  a:hover {
	color: #6b6358;
	z-index: 10;
}

.menu  ul ul {
	display: none;
}

.menu  ul:hover ul {
	display: block;
	padding: 15px 0px 0px 0px;
}

.menu  ul li:hover li {
	padding: 10px 5px 10px 5px;
}

h1 {
	margin: 0px;
	position: absolute;
	top: 55%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-family: 'manbal';
	color: #b3a695;
	font-size: 60px;
	font-weight: 500;
	text-align: center;
}



#shoesImage{
margin: 0px;
position: absolute;
transform: translate(-50%, -50%);
top: 35%;
	left: 50%;

}

#login {
	font-family: "Myriad";
	position: absolute;
	top: 4%;
	right: 3%;
	z-index: 10;
	width: 120px;
	height: 36px;
	border-radius: 18px;
	background-color: #b3a695;
	color: #edede4;
	font-weight: bold;
	font-size: 1.5rem;
	text-align: center;
	text-decoration: none;
}


#mainButton {
	font-family: "Myriad";
	position: absolute;
	top: 70%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 10;
	width: 210px;
	height: 36px;
	border-radius: 18px;
	background-color: #b3a695;
	color: #edede4;
	font-weight: bold;
	font-size: 1.5rem;
	text-align: center;
	text-decoration: none;
}



        .footer {
	background: #b3a695;
	display: none;
	color: #edede4;
	position: absolute;
	width: 100%;
	height: 350px;
	padding: 80px;
	transition: bottom;
	box-sizing: border-box;
	text-align: center;
	z-index:20;
}

#toggle {
	position: absolute;
	cursor: pointer;
	left: -100%;
	top: -100%;
}


#toggle+label {
	position: absolute;
	z-index: 10;
}


#cone {
	position: absolute;
	bottom: 0%;
	right: 0%;
	width: 100px;
	height: 100px;
	background: #b3a695;
	border-radius: 100px 0 0 0;
	display: block;
	cursor: pointer;
}

#toggle:checked ~ .footer {
	bottom: 0;
	display: block;
}

#toggle:checked ~ #cone {
	z-index: 30;
	bottom : 250px;
	background: #edede4;
	border-radius: 0 0 0 100px;
	display: block;
	cursor: pointer;
}

ul {
	list-style: none;
}


</style>
</head>
<body>
	<a href="http://localhost:8090/kanye/main.jsp" id="login">
		Login </a>

	<div class="menu">
		<ul>
			<li><a href="http://localhost:8090/kanye/main.jsp" id="logo">

					<img alt="로고" src="mainImage/logo2.png" width="100" />
			</a>

				<ul>
					<li><a href="/kanye/CtmzListAction.ct">CUSTOMIZE</a></li>
					<li><a href="/kanye/history.jsp">HISTORY</a></li>
					<li><a href="/kanye/board/review.jsp">REVIEW</a></li>
					<li><a href="http://localhost:8090/kanye/main.jsp">EVENT</a></li>
				</ul></li>

		</ul>
	</div>
	
	
	
		<img alt="회원가입완료" src="mainImage/regist_done.png" width=600" id="shoesImage"/>
		<h1>회원가입이<br/>완료되었습니다!</h1>
	
	<a href="http://localhost:8090/kanye/myPage/mypage.jsp" id="mainButton">
		go to my page !</a>
	
	<input type="checkbox" name="toggle" id="toggle" />
	<label for="toggle" id="cone"></label>


	<div class="container"></div>


	<div class="footer">
		<ul>
			<li>아디다스코리아(유) 서울특별시 서초구 서초대로 74길 4, 삼성생명 서초타워 23층 (06620)</li>
			<br />
			<li>대표이사 : 에드워드 닉슨 사업자 등록번호 : 214-81-07412 통신판매업신고 :
				2007-서울서초-10391</li>
			<br />
			<li>개인정보 보호책임자 : 김동일 고객센터 : 1588-8241</li>
			<br />
			<br />
			<li>©adidas Korea, LLC. All Rights Reserved.</li>
		</ul>


	</div>


</body>
