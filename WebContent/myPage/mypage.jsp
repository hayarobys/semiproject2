<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	String user_id = "";
	int user_grade = -1;

	try{
		user_id = (String)session.getAttribute("user_id");
		user_grade = (int)session.getAttribute("user_grade");
	}catch(NullPointerException e){
		System.out.println("비로그인 유저의 접속입니다.");
		response.sendRedirect("/kanye/member/login.jsp");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<title>내 정보보기</title>
	
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
      color: #edede4;
      font-weight: bold;
      font-size: 1.5rem;
      text-align: center;
      text-decoration: none;
   }
		/* 전체적인 구조 정의 */

	
		#headerSpace{
			height: 50px;
			width: 960px;
			margin: 0 auto;

		}
		
		#content{
			background-color: #b3a695;
			border :3px solid #b3a695;
			width: 960px;
			height: 880px;
			margin: 0 auto;
			box-shadow: -12px 5px 10px rgba(0, 0, 0, 0.2);
			
		}
		
		#navSpace{
			width: 200px;
			height: 850px;
			float:left;
		}
		
		#navSpace ul{
			padding: 0;
			margin: 0;
		}
		
		#navSpace li{
			list-style: none;
			margin: 10px 10px 5px 10px;
			width: 100%;
			height: 100px;
			line-height: 100px;
			font-color:#b3a695;
			text-align: center;
			border-radius: 18px;
			background-color:#edede4;
			border : 3px solid #b3a695;
				cursor: pointer;
			
		}
		.button{
		border:0;
		outline:0;
		background-color:#edede4;
		font-size:1em;
		font-weight: 700;
		color: #6b6358;
		cursor: pointer;
		}
		
		/* #navSpace li:hover{
			background-color: #b3a695;
			transition: all .3s ease;
		}  */
		
		#navSpace li:nth-child(1){
			background-color:  #edede4;
		}
		
		#navSpace li:nth-child(2){
			background-color: #edede4;
		}
		
		#navSpace li:nth-child(3){
			background-color: #edede4;
		}
		
		#navSpace li:nth-child(4){
			background-color: #edede4;
		}
		
		
		#sectionSpace{
			height: 850px;
			width:715px;
			margin: 10px 10px 10px 227px;
			background-color: #edede4;
			color: #6b6358;
			border : 3px solid #b3a695;
			border-radius: 18px;
		}
		
	/* 	#footerSpace{
			clear: left;
			width: 100%;
			height: 10px;
			background-color: #4E4741;
			border-top: 1px solid gray;
		}
		 */
		
		/* 좌측 네비게이션 바 정의 */
/* 		*{
			border: 1px solid #b3a695;
		} */
		
	/*푸터코드*/
		
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
	
	<script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
					
			$('#navSpace li:nth-child(1)').click({dir:'/kanye/OrderListAction.od'}, loadPage);
			$('#navSpace li:nth-child(2)').click({dir:'mypage_my_review.jsp'}, loadPage);
			$('#navSpace li:nth-child(3)').click({dir:'mypage_member_info.jsp'}, loadPage);
			$('#navSpace li:nth-child(4)').click(moveMain);
			/* $('#navSpace li:nth-child(4)').click({dir:'/kanye/logout.me?link="/kanye/main.jsp"'}, loadPage); */
			$('#navSpace li:nth-child(5)').click({dir:'/kanye/CtmzAdminList.ct'}, loadPage);
			$('#navSpace li:nth-child(6)').click({dir:'/kanye/MemAdminList.me'}, loadPage);
			$('#navSpace li:nth-child(7)').click({dir:'/kanye/CtmzAdminList.ct'}, loadPage);
		});
		
		function moveMain(){
			location.href='/kanye/logout.me?link="/kanye/main.jsp"';
			
		}
		
		function loadPage(event){
			console.log('호출됨');
			$.ajax({
				url:event.data.dir,
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				dataType:'html',
				success:function(data){
					$('#sectionSpace').html(data);
				}
			});
		}
		
	</script>
</head>
<body>
		<%if(user_id == null || user_id == ""){%>
			<a href="#" id="login">
				<span>Login</span>
			</a>
		<%}else{%>
			<a href='/kanye/myPage/mypage.jsp' class="loginout">
				${user_id}<span style="font-size: 0.9em;"> 님</span>
			</a>
		<%} %>

	<div class="menu">
		<ul>
			<li><a href="/kanye/main.jsp" id="logo">

					<img alt="로고" src="/kanye/image/logo2.png" width="100" />
			</a>

				<ul>
					<li><a href="/kanye/CtmzListAction.ct">CUSTOMIZE</a></li>
					<li><a href="/kanye/history.jsp">HISTORY</a></li>
					<li><a href="/kanye/review.rv">REVIEW</a></li>
					<li><a href="http://localhost:8090/kanye/main.jsp">EVENT</a></li>
				</ul></li>

		</ul>
	</div>
	<!-- 상단여백 -->
	<header id="headerSpace">
		
	</header>
	
	<div id="content">
		<!-- 좌측 메뉴바 -->
		<nav id="navSpace">
			<ul>
				<!-- 메뉴1: 주문 내역 조회 -->
				<li>
					<input type="button" class="button" id="admin" value="주문 내역 조회" />
				</li>
				<!-- 메뉴2: 내가 작성한 상품평 -->
				<li><input type="button" class="button" id="admin" value="내가 작성한 상품평" /></li>
				<!-- 메뉴3: 회원 정보 수정 -->
				<li><input type="button" class="button" id="admin" value="회원 정보 수정" /></li>
				<li><input type="button" class="button" id="admin" value="로그아웃" /></li>
				
				<%-- <%if(user_id=="admin"){ %> --%>
				<!-- 메뉴4: 관리자 페이지 -->
				<li><input type="button" class="button" id="admin" value="상품 목록 불러오기" /></li>
				<li><input type="button" class="button" id="admin" value="회원 정보 불러오기" /></li>
				<li><input type="button" class="button" id="admin" value="주문 정보 불러오기" /></li>
				<%-- <%}%> --%>
				
			</ul>
		</nav>
		
		<!-- 본문 -->
		<section id="sectionSpace">
			본문
		</section>
		
		<!-- 바닥 정보창 -->
		<!-- <footer id="footerSpace">
			
		</footer> -->
	</div>
	
	
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