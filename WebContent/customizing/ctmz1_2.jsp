<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="bst.ctmz.db.CtmzDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ctmz1</title>
<style>
   
   
   html{
      width:100%;
      height:100%;
   }
   
   @media(min-width : 1630){
      /* 원래코드 */
   }
   
   @media(min-width : ){
      
   }
   
   
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
   
   body {
      font-family: "Myriad";
      margin: 0px;
      display: inline-block;
      width: 100%;
      height: 100%;
   }
   
   .no1 {
      
      margin: 0px;
      background-color: #edede4;
      color: #b3a695;
      float: left;
      background-size: cover;
      width: 100%;
      height: 100%;
   }
   
   .no1 header {
      display: inline-block;
      margin: 0px auto;
      text-align: center;
      position: absolute;
      top: 10%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 8;
   }
   
   .no1 #text {
      text-align: center;
      font-family: 'Myriad';
      width: 100%;
      height: auto;
      font-size: 18rem;
      font-weight: bold;
      position: absolute;
      top: 45%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 1;
      /* 반응형으로 설계하려면 이미지파일로 가져와야 할 듯. */
   }
   
   .no1 #img1 {
      /* img html코드 지우고,
         background-image로 넣을 것. */
      width: 60%;
      position: absolute;
      top: 45%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 2;
      margin: 0px;
      /* shadow 흰색으로 blur 효과 줄 것. */
      /* -webkit-box-shadow: 0 0 30px 30px rgba(255,255,255,0.8);
         box-shadow: 0 0 30px 30px rgba(255,255,255,0.8); */
   }
   
   .no1 .size {
      text-align: center;
      position: absolute;
      left: 35%;
      bottom: 0px;
      width: 100px;
      height: 150px;
      z-index: 2;
      font-size: 2rem;
      font-weight: bold;
      display: inline-block;
   }
   
   .no1 .size.slide:hover {
      text-align: center;
      height: 90%;
      transition: all .5s ease-in-out;
      z-index: 9;
      background-color: rgba(255, 255, 255, 1);
      font-size: 2rem;
      font-weight: bold;
      color: gray;
   }
   
   .no1 .size.slide {
      text-align: center;
      position: absolute;
      left: 35%;
      bottom: 0px;
      width: 100px;
      height: 150px;
      z-index: 2;
      background-color: rgba(255, 255, 255, 0);
      display: inline-block;
      color: rgba(255, 255, 255, 0);
      overflow:hidden;
   }
   
   .no1 .size.slide div:hover {
      color: rgb(0, 0, 0);
      cursor:pointer;
   }
   
   .btsize {
      z-index: 11;
      margin-top: 18.5px;
   }
   
   .no1 .text {
      font-size: 1.4rem;
   }
   
   .no1 .color {
      text-align: center;
      position: absolute;
      left: 45%;
      bottom: 0px;
      width: 100px;
      height: 150px;
      z-index: 2;
      font-size: 2rem;
      font-weight: bold;
      display: inline-block;
   }
   
   .no1 .color.slide:hover {
      text-align: center;
      height: 50%;
      transition: all .5s ease-in-out;
      z-index: 9;
      background-color: rgba(255, 255, 255, 1);
      font-size: 2rem;
      font-weight: bold;
      color: gray;
   }
   
   .no1 .color.slide {
      text-align: center;
      position: absolute;
      left: 45%;
      bottom: 0px;
      width: 100px;
      height: 150px;
      z-index: 2;
      background-color: rgba(255, 255, 255, 0);
      display: inline-block;
      color: rgba(255, 255, 255, 0);
      overflow:hidden;
      
   }
   
   .no1 .color.slide div{
      margin-top:10%;
   }
   
   .no1 .color.slide div:hover {
      color: rgb(0, 0, 0);
      cursor:pointer;
   }
   
   .no1 .color.slide div:active .no1 .color.slide {
      text-align: center;
      position: absolute;
      left: 45%;
      bottom: 0px;
      width: 100px;
      height: 150px;
      z-index: 2;
      background-color: rgba(255, 255, 255, 0);
      display: inline-block;
      color: rgba(255, 255, 255, 0);
   }
   
   
   *{
   	border:1px solid black;
   }
   
   
   /* .no1 .color.slide:hover ~ .btcolor {
      width:60px;
      height:60px;
      border-radius:100%;
      margin:0 auto;
      display:inline-block;
      background-color:#9C8C79;
      color:#9C8C79;
   } */
   
   .btcolor {
      z-index: 11;
      margin:0 auto;
      display:inline-block;
   }
   #color_circle{
      width:1em;
      height:1em;
      align:center;
      margin:0px;
   
   }
   #color_circle .circle{
      width:1em;
      height:1em;
      border-radius:100%;
      margin:0 auto;
      display:inline-block;
      background-color:#9C8C79;
      color:#9C8C79;
   }
   
   
   .no1 .price {
      text-align: center;
      position: absolute;
      left: 55%;
      bottom: 0px;
      width: 100px;
      height: 150px;
      z-index: 2;
      font-size: 2rem;
      font-weight: bold;
      display: inline-block;
   }
   
   #next {
      position: absolute;
      top: 50%;
      right: 0%;
      transform: translate(-50%, -50%);
      z-index: 2;
      font-size: 11rem;
      color: #b3a695;
      font-family:serif;
      font-weight:bold;
   }
   
   #next:hover {
      color: rgb(0, 0, 0);
   }
   /* #next는 ctmz2.jsp로 이동하는 기능. */
   
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	
	$(function(){
	    $('.btsize').on({
	       mouseenter:function(){ 
	          var size = $(this).text();
	          $("#size_output").text(size);
	          $("#size_submit").val(size);
	          if(size==225){
	             $("#img1").css("width","54%");
	          } else if(size ==230){
	             $("#img1").css("width","55%");
	          } else if(size ==235){
	             $("#img1").css("width","56%");
	          } else if(size ==240){
	             $("#img1").css("width","57%");
	          } else if(size ==245){
	             $("#img1").css("width","58%");
	          } else if(size ==250){
	             $("#img1").css("width","59%");
	          } else if(size ==255){
	             $("#img1").css("width","60%");
	          } else if(size ==260){
	             $("#img1").css("width","61%");
	          } else if(size ==265){
	             $("#img1").css("width","62%");
	          } else if(size ==270){
	             $("#img1").css("width","63%");
	          } else if(size ==275){
	             $("#img1").css("width","64%");
	          } else if(size ==280){
	             $("#img1").css("width","65%");
	          } 
	       }
	    });
	 });
	 //마우스 오버될 때마다 출력되는 이미지 사이즈만 바뀌게 하는 기능.
	
	
	
	/* 사이즈 선택하면, #size_output에서는 출력을
		#size_submit에서는 전송하는 값을 수정한다.
	*/
	$(function(){
		$(".btsize").click(function(){
			var size = $(this).text();
			$("#size_output").text(size);
			$("#size_submit").val(size);
			console.log("size 잘 저장되나?"+size);
			if(size==225){
	             $("#img1").css("width","54%");
	        } else if(size ==230){
	             $("#img1").css("width","55%");
	        } else if(size ==235){
	             $("#img1").css("width","56%");
	        } else if(size ==240){
				$("#img1").css("width","57%");
			} else if(size ==245){
				$("#img1").css("width","58%");
			} else if(size ==250){
				$("#img1").css("width","59%");
			} else if(size ==255){
				$("#img1").css("width","60%");
			} else if(size ==260){
				$("#img1").css("width","61%");
			} else if(size ==265){
				$("#img1").css("width","62%");
			} else if(size ==270){
				$("#img1").css("width","63%");
			} else if(size ==275){
				$("#img1").css("width","64%");
			} else if(size ==280){
				$("#img1").css("width","65%");
			} 
			//$(".size.slide").css({"text-align":"center","position":"absolute","left":"35%","bottom":"0px","width":"100px","height":"150px","z-index":"2","background-color":"rgba(255, 255, 255, 0)","display":"inline-block","color":"rgba(255, 255, 255, 0)","overflow":"hidden"})
			/* 
			text-align: center;
		      position: absolute;
		      left: 35%;
		      bottom: 0px;
		      width: 100px;
		      height: 150px;
		      z-index: 2;
		      background-color: rgba(255, 255, 255, 0);
		      display: inline-block;
		      color: rgba(255, 255, 255, 0);
		      overflow:hidden;
			 */
			
			
		})
	})
	
	
	 $(function(){
      $('.btcolor').on({
         mouseenter:function(){ 
            var color = $(this).text();
            
            $("#color_output").text(color);
            $("#color_submit").val('"'+color+'"');
            //color값 출력
            var img = "/kanye/image/yzy350"
            img = img + color + "1.png";
            $("#img1").attr("src","");
            $("#img1").attr("src",img);
            // color값에 맞게 이미지 출력
            var price = 0;
            $("#price_output").text("$") //기존에 있던 출력값을 없애고 새로 쓰기 위해.
            if(color=="mr"){
               price = 1450;
            } else if(color=="tan"){
               price = 1300;
            } else if(color=="pb"){
               price = 1250;
            } else if(color=="tw"){
               price = 575;
            } else if(color=="td"){
               price = 2295;
            }
            $("#price_output").append(price);
            $("#price_submit").val(price);
         }
      });
   });

	
	
	
	
	
	$(function(){
		$(".btcolor").click(function(){
			var color = $(this).text();
			
			$("#color_output").text(color);
			$("#color_submit").val('"'+color+'"');
			console.log("color 잘 저장되나?"+color);
			//color값 출력 & 전송
			console.log(color+"클릭");
			var img = "/kanye/image/yzy350"
			img = img + color + "1.png";
			$("#img1").attr("src","");
			$("#img1").attr("src",img);
			// color값에 맞게 이미지 출력
			
			var price = 0;
			$("#price_output").text("$") //기존에 있던 출력값을 없애고 새로 쓰기 위해.
			
			if(color=="mr"){
				price = 1450;
			} else if(color=="tan"){
				price = 1300;
			} else if(color=="pb"){
				price = 1250;
			} else if(color=="tw"){
				price = 575;
			} else if(color=="td"){
				price = 2295;
			}
			$("#price_output").append(price);
			$("#price_submit").val(price);
			// price값 출력 & 전송
			
			$(".color.slide").height(150);
		})
	})
	
	$(function(){
		$("#next").click(function(){
			console.log("click");
			document.nextform.action="/kanye/customizing/ctmz2.jsp";
			document.nextform.submit();
		})
	})
	
	
	/* DB에서 COLOR값을 받아오는 기능. */
	
<%-- 	$(function(){
		<% 
			for(int i = 0 ; i < list.size() ; i++){
				CtmzDTO ctmzDTO = new CtmzDTO();
				
				ctmzDTO = (CtmzDTO)list.get(i);
				String color = ctmzDTO.getCTMZ_COLOR();
		%>		
				$("#color"+<%=i%>).html('<%=color%>');
		<%
			}
		%>
	}); --%>

    //칼라값을 hexcode로 넣으려면.... 밑에놈을 써야한다.
    <%-- 
      $(function(){
         <% 
            for(int i = 0 ; i < list.size() ; i++){
               CtmzDTO ctmzDTO = new CtmzDTO();
               
               ctmzDTO = (CtmzDTO)list.get(i);
               String color = ctmzDTO.getCTMZ_COLOR();
               String hexcolor = "";
               if(color==mr){
                  hexcolor=
               } else if(color==tan){
                  hexcolor=
               } else if(color==tan){
                  hexcolor=
               } else if(color==tan){
                  hexcolor=
               } else if(color==tan){
                  hexcolor=
               }
         %>      
               $("#color"+<%=i%>).html("<%=color%>");
         <%
            }
         %>
      });
       --%>
   
   

</script>
</head>
<body>
    <div class="no1">
       <div class="menu">
            <ul>
               <li><a href="http://localhost:8090/kanye/main.html" id="logo">
      
                     <img alt="로고" src="/kanye/mainImage/logo2.png" width="100" />
               </a>
      
                  <ul>
                     <li><a href="http://localhost:8090/kanye/main.html">CUSTOMIZE</a></li>
                     <li><a href="http://localhost:8090/kanye/history.html">HISTORY</a></li>
                     <li><a href="http://localhost:8090/kanye/main.html">REVIEW</a></li>
                     <li><a href="http://localhost:8090/kanye/main.html">EVENT</a></li>
                  </ul></li>
      
            </ul>
         </div>
      
     	 <!-- <a href="/kanye/register.html" id="login">
		      Login
		</a> -->
	
			<a href="#" id="login">
				<span>Login</span>
			</a>
		
		
		
         <header>
              <h1>CUSTOMISE YOUR YEEZY BOOST</h1>
              <h3>designed by Kanye West</h3>
         </header>
           
           <div id="text">YZY BST</div>
         
         <img id="img1" src="/kanye/image/yzy350tan1.png" />
      
      <span id="next">></span>

      
      <div class="size">
         <div id="size_output">255</div>
         <div class="text">size</div>
      </div>
      <div class="size slide">
         <div class="btsize">225</div>
         <div class="btsize">230</div>
         <div class="btsize">235</div>
         <div class="btsize">240</div>
         <div class="btsize">245</div>
         <div class="btsize" >250</div>
         <div class="btsize" >255</div>
         <div class="btsize" >260</div>
         <div class="btsize" >265</div>
         <div class="btsize" >270</div>
         <div class="btsize" >275</div>
         <div class="btsize" >280</div><br><br>
      </div>
      
      <div class="color">
         <div id="color_output"><a id="color_circle"><div class="circle"></div></a></div>
         <!-- 도대체 color slide에는 어떻게 이미지를 넣나....그냥 img파일을 넣을까? -->
         <div class="text">color</div>
      </div>
      <div class="color slide">
         <br>
         <br>
         <div class="btcolor" id="color0">mr</div><br>
         <div class="btcolor" id="color1">tan</div><br>
         <div class="btcolor" id="color2">pb</div><br>
         <div class="btcolor" id="color3">tw</div><br>
         <div class="btcolor" id="color4">td</div><br>
         <div class="btcolor" id="color5"></div><br>
         <div class="btcolor" id="color6"></div><br>
      </div>

      <div class="price">
         <div id="price_output">$1300</div>
         <div class="text">price</div>
      </div>
      
      <form action="/kanye/customizing/ctmz2.jsp" name="nextform">
         <input type="hidden" id="size_submit" name="ctsize" value="255">
         <input type="hidden" id="color_submit" name="ctcolor" value='"tan"'>
         <input type="hidden" id="price_submit" name="ctprice" value="1300">
      </form>
      
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
















