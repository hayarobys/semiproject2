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
		response.sendRedirect("./member/login.jsp");
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ctmz3</title>
<style>
	@font-face {
      font-family: "Myriad";
      src: url('/kanye/font/Myriad-Pro-Bold_31631.eot')
         format('embedded-opentype');
      src: url('/kanye/font/Myriad-Pro-Bold_31631.ttf') format('truetype');
      src: url('/kanye/font/Myriad-Pro-Bold_31631.woff') format('woff');
   }
	
	body{
		font-family: "Myriad";
		margin:0px;
		background-size:100% 100%;
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
	
	
	.no3{
		font-family:"Myriad"; 
		background-color: #edede4;
		color: #b3a695;
		border:solid red 0px;
		width:1920px;
		height:970px;
	}
	
	.no3 img{
		position: absolute;
		top:48%;
		left:30%;
		transform: translate(-50%,-50%);
		height:75%;
		z-index:1;
	}
	
	.no3 .text{
		position: absolute;
		top:40%;
		left:78%;
		transform: translate(-50%,-50%);
		width:33%;	
		z-index:2;
	}
	.no3 h1{
		font-size:3.0rem;
	}
	.no3 h3{
		font-size:1.8rem;
	}

	.no3 #button{
		width:200px;
		height:60px;
		border-radius:30px;
		background-color:#b3a695;
		color:#edede4;
		font-weight:bold;
		font-size:2.3rem;
		text-align:center;
		text-decoration:none;
		display:block;
		margin-top:10%;
		margin-left:30%;
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
      width: 50px;
      height: 50px;
      background: #b3a695;
      border-radius: 50px 0 0 0;
      display: block;
      z-index:100000;
   }
   
   #toggle:checked ~ .footer {
      bottom: 0;
      display: block;
   }
   
   #toggle:checked ~ #cone {
      z-index: 10;
      bottom : 300px;
      background: #edede4;
      border-radius: 0 0 0 50px;
      display: block;
   }
   
   ul {
      list-style: none;
   }

</style>

</head>
<body>
	<div class="no3">
		<div class="menu">
            <ul>
               <li><a href="http://localhost:8090/kanye/main.html" id="logo">
      
                     <img alt="로고" src="/kanye/mainImage/logo2.png" width="100" />
               </a>
      
                  <ul>
					<li><a href="/kanye/CtmzListAction.ct">CUSTOMIZE</a></li>
					<li><a href="/kanye/history.jsp">HISTORY</a></li>
					<li><a href="/kanye/board/review.jsp">REVIEW</a></li>
					<li><a href="http://localhost:8090/kanye/main.jsp">EVENT</a></li>
                  </ul></li>
      
            </ul>
         </div>
		<%if(user_id == null || user_id == ""){%>
			<a href="#" id="login">
				<span>Login</span>
			</a>
		<%}else{%>
			<a href='/kanye/logout.me?link="./main.html"' class="loginout">
				${user_id}<span style="font-size: 0.9em;"> 님</span>
			</a>
		<%}%>
		<div class="text">
    		<h1>주문이 완료되었습니다.</h1>
    		<h3>주문내역을 확인하려면 아래 버튼을 클릭하세요.</h3>
    		<a href="/kanye/myPage/mypage.jsp" id="button">go</a>
    	</div>
    	<a href="#"><img src="/kanye/image/box.png"/></a>
    	
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
    	
    	
    </div>
    
</body>
</html>