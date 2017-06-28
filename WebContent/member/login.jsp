<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   
   String user_id = "";
   int user_grade = -1;

   try{
      user_id = (String)session.getAttribute("user_id");
      user_grade = (int)session.getAttribute("user_grade");
   }catch(NullPointerException e){
      System.out.println("비로그인 유저의 접속입니다.");
      /* response.sendRedirect("kanye/member/login.jsp"); */
   }
   
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>LoginPage</title>
   
   <style type="text/css">
   
   
      @font-face {
         font-family: "Myriad";
         src: url('/kanye/font/Myriad-Pro-Bold_31631.eot')
            format('embedded-opentype');
         src: url('/kanye/font/Myriad-Pro-Bold_31631.ttf') format('truetype');
         src: url('/kanye/font/Myriad-Pro-Bold_31631.woff') format('woff');
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
   
   #loginup {
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
   body{
      margin:0;
      background-color:#edede4;
      font-family:"Myriad";
   }
   #img{
      position: absolute;
      top: 50%;
      left: 30%;
      transform: translate(-50%, -50%);
      height:100%;
      overflow:hidden;
   }
   #box{            
      position: absolute;
      top: 50%;
      left: 63%;
      transform: translate(-50%, -50%);
      width: 35%;
      height: 70%;
      display:flex;
      flex-direction:column;
      align:center;
      /* border:solid 3px rgb(169,169,171); */
   }

   .title{
      color:rgb(179,166,149);
      font-size:4rem;
      text-align:center;
      margin:10%;
      
   }
   
   form{
      margin-left:25%;
   }
   input{
      width: 65%;
      height: 60px;
      background-color: #edede4;
      border: 0px solid gray ;
      border-bottom: 4px solid rgb(169,169,171);
      font-size: 1.5rem; 
      font-weight: 600;
      margin-top:10%;
      margin:0 auto;
      display:inline-block;
      align:center;
      color:rgb(100,100,100);
   }      
   
   input:nth-child(2){
      margin-top:10%;
   }
   
   input:focus {
      outline: none;
   }
   button:focus {
      outline: none;
   }
   #buttons{
      margin:15% auto;
      display:flex;
      flex-direction : row;
      font-size:1.4rem;
      text-align:center;
   }
   .login{
      width:120px;
      height:34px;
      border-radius:27px;
      background-color:rgb(179,166,149);
      color:white;
      margin-left:30px;
      cursor: pointer;
   }
   .join{
      width:120px;
      height:34px;
      border-radius:25px;
      background-color:rgb(169,169,171);
      color:white;
      cursor: pointer;
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
   
   <script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">
      function loginCheck(){
      /*    console.log("로그인 클릭");
         var formArr = $('form').serializeArray();
         // formArr = [{id:abc}, {pw:abc123}]; 식으로 반환된다.
         
         console.log(formArr);
         
         var form_id = formArr[0].value;
         var form_pw = formArr[1].value;
         
         console.log('id: ' + form_id + ', pw: ' + form_pw);
      */
         document.loginForm.action="/kanye/loginCheck.me";// 이동할 링크 지정
         document.loginForm.method="post";
         document.loginForm.submit();         // 발송
      }
      
      function moveToReg(){
         document.loginForm.action="/kanye/register.jsp";// 이동할 링크 지정
         document.loginForm.method="get";
         document.loginForm.submit();         // 발송
      }
   </script>
</head>
<body>
   <div class="menu">
       <ul>
          <li><a href="http://localhost:8090/kanye/main.jsp" id="logo">
 
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
      <a href="#" id="loginup">
         <span>Login</span>
      </a>
   <%}else{%>
      <a href='/kanye/logout.me?link="./main.html"' class="loginout">
         ${user_id}<span style="font-size: 0.9em;"> 님</span>
      </a>
   <%} %>

   <img id="img" src="/kanye/image/login.png">
   
   <div id="box">
      <div class="title">a&nbsp;d&nbsp;i&nbsp;d&nbsp;a&nbsp;s</div>
      <form name="loginForm">
         <input type="text" name="id" placeholder ="ID" />
         <input type="password" name="pw" placeholder ="Password" />
      </form>
      <div id="buttons">
            <span id="reg" onclick="moveToReg();return false;" class="join">Register</span>
            <span id="login" onclick="loginCheck();return false;" class="login">Login</span>
      </div>
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