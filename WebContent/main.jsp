<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String user_id = "";
	int user_grade = -1;

	try{
		user_id = (String)session.getAttribute("user_id");
		user_grade = (int)session.getAttribute("user_grade");
	}catch(NullPointerException e){
		System.out.println("비로그인 유저의 접속입니다.");
		/* response.sendRedirect("./member/login.jsp"); */
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>ADIDAS-이지부스트</title>
  
  <link rel="stylesheet" href="css/example.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">

  <style>
  
  @font-face {
	font-family: "Myriad";
	src: url('font/Myriad-Pro-Bold_31631.eot')
		format('embedded-opentype');
	src: url('font/Myriad-Pro-Bold_31631.ttf') format('truetype');
	src: url('font/Myriad-Pro-Bold_31631.woff') format('woff');
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
	display: block;
	padding: 15px 0px 0px 0px;
}

.menu  ul ul li {
	padding: 10px 5px 10px 5px;
}

#login {
	font-family: "Myriad";
      position: absolute;
      top: 4%;
      right: 3%;
      z-index:10;
      width:120px;
      height:36px;
      border-radius:18px;
      background-color:#b3a695;
      color:#edede4;
      font-weight:bold;
      font-size:1.5rem;
      text-align:center;
      text-decoration:none;
      
   }
   .loginout{
   	  font-family: "Myriad";
      position: absolute;
      top: 4%;
      right: 3%;
      z-index: 10;
      width: 120px;
      height: 36px;
      border-radius: 18px;
      background-color: #b3a695;
      color: white;   /* #edede4; */
      font-weight: bold;
      font-size: 1.5rem;
      text-align: center;
      text-decoration: none;
   }
   
   #back{
   position: absolute;
      top: 18%;
		left: 50%;
		transform: translate(-50%, -50%);
   
   }
  
    body {
      -webkit-font-smoothing: antialiased;
      font: normal 15px/1.5 "Helvetica Neue", Helvetica, Arial, sans-serif;
      color: #232525;
      padding-top:70px;
      margin: 0;
	background-color: #edede4;
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
	z-index: 10;
	bottom : 250px;
	background: #edede4;
	border-radius: 0 0 0 100px;
	display: block;
	cursor: pointer;
}

ul {
	list-style: none;
}

    #slides {
      display: none
    }

    #slides .slidesjs-navigation {
      margin-top:3px;
    }

    #slides .slidesjs-previous {
      margin-right: 5px;
      float: left;
    }

    #slides .slidesjs-next {
      margin-right: 5px;
      float: left;
    }

    .slidesjs-pagination {
      margin: 6px 0 0;
      float: right;
      list-style: none;
    }

    .slidesjs-pagination li {
      float: left;
      margin: 0 1px;
    }

    .slidesjs-pagination li a {
      display: block;
      width: 13px;
      height: 0;
      padding-top: 13px;
      background-image: url(mainImage/pagination.png);
      background-position: 0 0;
      float: left;
      overflow: hidden;
    }

    .slidesjs-pagination li a.active,
    .slidesjs-pagination li a:hover.active {
      background-position: 0 -13px
    }

    .slidesjs-pagination li a:hover {
      background-position: 0 -26px
    }

    #slides a:link,
    #slides a:visited {
      color: #333;
    }

    #slides a:hover,
    #slides a:active {
      color: #9e2020
    }

    .navbar {
      overflow: hidden
    }
 
    #slides {
      display: none;
      cursor: pointer;
    }

	 .container {
		margin: 0;
		width: 940px;
		height: 528px;
   		position: absolute;
		top: 52%;
		left: 50%;
		transform: translate(-50%, -50%);
	
    }
   

  </style>

</head>
<body>
<div class="menu">
		<ul>
			<li><a href="http://localhost:8090/kanye/main.jsp" id="logo">

					<img alt="로고" src="mainImage/logo2.png" width="100" />
			</a>

				<ul>
					<li><a href="/kanye/CtmzListAction.ct">CUSTOMIZE</a></li>
					<li><a href="/kanye/history.jsp">HISTORY</a></li>
					<li><a href="/kanye/review.rv">REVIEW</a></li>
					<li><a href="/kanye/main.jsp">EVENT</a></li>
				</ul></li>

		</ul>
	</div>
	
	
	
	
		<%if(user_id == null || user_id == ""){%>
			<a href="/kanye/member/login.jsp" id="login">
				<span>Login</span>
			</a>
		<%}else{%>
			<a href='/kanye/myPage/mypage.jsp' class="loginout">
				${user_id}<span style="font-size: 0.9em;"> 님</span>
			</a>
		<%} %>
       
       
       
  <div class="container">
    <div id="slides">
      <a href="http://localhost:8090/kanye/history.jsp"><img src="mainImage/main01.png" alt="history"></a>
      <a href="http://localhost:8090/kanye/history.html"><img src="mainImage/main02.png" alt="main"></a>
      <a href="http://localhost:8090/kanye/history.html"><img src="mainImage/main03.png" alt="customize"></a>
      <a href="http://localhost:8090/kanye/history.html"><img src="mainImage/main04.png" alt="rivew"></a>
      <a href="http://localhost:8090/kanye/history.html"><img src="mainImage/main05.png" alt="rivew"></a>
      <a href="#" class="slidesjs-previous slidesjs-navigation"><i class="icon-chevron-left icon-large"></i></a>
      <a href="#" class="slidesjs-next slidesjs-navigation"><i class="icon-chevron-right icon-large"></i></a>
    </div>
  </div>
  
  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

  <script src="js/jquery.slides.min.js"></script>

  <script>
    $(function() {
      $('#slides').slidesjs({
        width: 940,
        height: 528,
        navigation: false
      });
    });
  </script>
  
  
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
</html>
