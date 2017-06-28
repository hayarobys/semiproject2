<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="css/example.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
<style>
/* 	@media(min-width : 1630){
		:원래코드
	} */

	/* @font-face{
		font-family:"Myriad"; 
		src:url('/kanye/font/Myriad-Pro-Bold_31631.eot') format('embedded-opentype');
	} */
	#logo {
		position: absolute;
		top: 2%;
		left: 2.5%;
		z-index:2;
		width:100px;
		height:100px;
	}
	#login {
		position: absolute;
		top: 4%;
		right: 4%;
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
	body{
		font-family: "Myriad";
		width:1920px;
		height:960px;
		
	}
	.no1{
		margin:0px;
		background-color: #edede4;
		color: #b3a695;
		width:1920px;
		height:960px;
		float:left;
		background-size:cover;
		display: inline-block;
	}
	

	.no1 header{
		display:inline-block;
		margin:0px auto;
		text-align:center;
		position: absolute;
		top:10%;
		left:50%;
		transform: translate(-50%,-50%);
		z-index:8;
	}
	
	.no1 #text{
		text-align:center;
		font-family:'Myriad';
		width:70%;
		height:auto;
		font-size:18rem;
		font-weight:bold;
		position: absolute;
		top:45%;
		left:50%;
		transform: translate(-50%,-50%);
		z-index:1;
		
	}
	.no1 #img1{

		width:1000px;
		position: absolute;
		top:45%;
		left:50%;
		transform: translate(-50%,-50%);
		z-index:2;
		margin:0px;
		
	}
	.no1 .size{
		text-align:center;
		position: absolute;
		left:35%;
		bottom:0px;
		width:100px;
		height:150px;
		z-index:2;
		font-size:2rem;
		font-weight:bold;
		display:inline-block;
	}
	.no1 .size.slide:hover{
		text-align:center;
		height:900px;
		transition: all .5s ease-in-out;
		z-index:9;
		background-color:rgba(255,255,255,1);
		font-size:2rem;
		font-weight:bold;
		color:gray;
	}
	.no1 .size.slide{
		text-align:center;
		position: absolute;
		left:35%;
		bottom:0px;
		width:100px;
		height:150px;
		z-index:2;
		background-color:rgba(255,255,255,0);
		display:inline-block;
		color:rgba(255,255,255,0);
	}
	.no1 .size.slide div:hover{
		color:rgb(0,0,0);
	}
	.btsize{
		z-index:11;
		margin-top:18.5px;
	}
	.no1 .text{
		font-size:1.4rem;
	}

	.no1 .color{
		text-align:center;
		position: absolute;
		left:45%;
		bottom:0px;
		width:100px;
		height:150px;
		z-index:2;
		font-size:2rem;
		font-weight:bold;
		display:inline-block;
	}
	.no1 .color.slide:hover{
		text-align:center;
		height:900px;
		transition: all .5s ease-in-out;
		z-index:9;
		background-color:rgba(255,255,255,1);
		font-size:2rem;
		font-weight:bold;
		color:gray;
	}
	.no1 .color.slide{
		text-align:center;
		position: absolute;
		left:45%;
		bottom:0px;
		width:100px;
		height:150px;
		z-index:2;
		background-color:rgba(255,255,255,0);
		display:inline-block;
		color:rgba(255,255,255,0);
	}
	.no1 .color.slide div:hover{
		color:rgb(0,0,0);
	}
	.btcolor{
		z-index:11;
		margin-top:18.5px;
	}
	
	.no1 .price{
		text-align:center;
		position: absolute;
		left:55%;
		bottom:0px;
		width:100px;
		height:150px;
		z-index:2;
		font-size:2rem;
		font-weight:bold;
		display:inline-block;
	}
	
	.no2{
		font-family:"Myriad"; 
		display : flex;
		display: inline-block;
		flex-direction : row;
	}
	.no2.one{
		display:flex;
		flex-direction : column;
		margin:0px;
		background-color: #edede4;
		color: #b3a695;
		width:50%;
		height:100vh;
		float:left;
		background-size:cover;
		
	}
	
	.no2.one header{
		display:inline-block;
		margin:3% auto 0%;
		flex-shrink:1;
		flex-basis:18%;
	}
	.no2.one header h1{
		text-align:center;
		margin:0px;
		font-size:3rem;
	}
	.no2.one header h3{
		text-align:center;
		margin:0px;
		font-size:2.5rem;
	}
	
	.no2.one main{
		display:inline-block;
		margin:0px auto;
		flex-shrink:4;
		flex-basis:60%;
		width:100%;
	}
	
	.no2.one main #img5{
		z-index:2;
		
		width:100%;

	}
	
	.no2.one footer{
		margin:0px, auto, 5%, 0px;
		flex-shrink:1;
		flex-basis:22%;
	}
	
	.no2.one footer h1{
		text-align:center;
		font-size:3.5rem;
		margin: 0px;
	}
	
	.no2.one footer h3{
		text-align:center;
		font-size:2.5rem;
		margin:0px;
	}


	
	.no2{
		font-family:"Myriad"; 
		display : flex;
		flex-direction : row;
	}
	.no2.one{
		display:flex;
		flex-direction : column;
		margin:0px;
		background-color: #edede4;
		color: #b3a695;
		width:50%;
		height:100vh;
		float:left;
		background-size:cover;
		
	}
	
	.no2.one header{
		display:inline-block;
		margin:3% auto 0%;
		flex-shrink:1;
		flex-basis:18%;
	}
	.no2.one header h1{
		text-align:center;
		margin:0px;
		font-size:3rem;
	}
	.no2.one header h3{
		text-align:center;
		margin:0px;
		font-size:2.5rem;
	}
	
	.no2.one main{
		display:inline-block;
		margin:0px auto;
		flex-shrink:4;
		flex-basis:60%;
		width:100%;
	}
	
	.no2.one main #img{
		z-index:2;
		width:100%;

	}
	
	.no2.one footer{
		margin:0px, auto, 5%, 0px;
		flex-shrink:1;
		flex-basis:22%;
	}
	
	.no2.one footer h1{
		text-align:center;
		font-size:3.5rem;
		margin: 0px;
	}
	
	.no2.one footer h3{
		text-align:center;
		font-size:2.5rem;
		margin:0px;
	}


	
	.no2.two{
		display:flex;
		flex-direction : column;
		z-index:3;
		margin:0px;
		width:50%;
		height:100hv;
		background-color:rgb(58,55,52);
		color:#edede4;
	}
	
	.no2.two .info{
		margin-top:5%;
		margin-left:10%;
		margin-right:10%;
	}
	
	.no2.two .info h1{
		font-size:3rem;
	}
	
	.no2.two form{
		margin-top:10%;
		margin-left:5%;
	}
	
	.no2.two h1{
		font-size:3rem;
		margin:0px;
	}
	
	.no2.two form h3{
		color:rgb(151,148,136);
		font-size:1.5rem;
		margin-top:6%;
	}
	
	.no2.two form input{
		border-bottom:solid 3px rgb(151,148,136);
		border-top:solid 0px white;
		border-left:solid 0px white;
		border-right:solid 0px white;
		width:80%;
		background-color:rgb(58,55,52);
		font-size:3rem;
		color:#edede4;
		margin:0px;
	}
	
	#address, #message{
		font-size:1.3rem;
	}
	
	
	.no2.two .button{
		display:flex;
		flex-direction:row;
		margin-left:50px;
		margin-top:25px;
	}
	
	.no2.two .cancel{
		border:solid 3px rgb(151,148,136);
		width:200px;
		height:38px;
		border-radius:35px;
		text-align:center;
		padding:10px;
		color: rgb(151,148,136);
	
	}
	
	.no2.two .order{
		border:solid 3px rgb(151,148,136);
		width:200px;
		height:38px;
		border-radius:35px;
		text-align:center;
		background-color:#edede4;
		color:rgb(58,55,52);
		font-weight:bold;
		padding:10px;
		text-decoration:none;
	}
	
	.no2.two a{
		text-decoration:none;
		margin:5%;
		font-size:1.5rem;
		
	}
	

	
	.no2 #slides .slidesjs-next {
		position:absolute;
    	top:50%;
    	right:3%;
    	z-index:20;
    	width:50px;
    	transform: translate(-50%, -50%);
    }

    .no1 #slides .slidesjs-previous {
    	position:absolute;
    	top:50%;
    	left:5%;
    	z-index:20;
    	width:50px;
    	transform: translate(-50%, -50%);
    }


	
	.navbar {
    	display:none;
    }
    
    .slidesjs-pagination {
		display:none;
    }
	
	 .container {
		margin: 0;
		width: 100%;
		height: 100hv;
    }
    

/* 
    #slides .slidesjs-navigation {
      margin-top:3px;
    }

    #slides .slidesjs-previous {
      margin-right: 5px;
      float: left;
      z-index:20;
    }

    #slides .slidesjs-next {
      margin-right: 5px;
      float: left;
      z-index:20;
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
      background-image: url(img/pagination.png);
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
      color: #333
    }

    #slides a:hover,
    #slides a:active {
      color: #9e2020
    }

    .navbar {
      overflow: hidden
    }
    
    .container {
		margin: 0;
		width: 100%;
		height: 100%;
   		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
    } */
	

	
</style>
<script>

/* 	$(function(){
		$("#3.5").click(function(){
			$.ajax({
				dataType:"json",
				url:"/kanye/CtmzGetImageAction.yzy",
				data:{},
				success:function(data){
					$("#img").attr("src",data.whatever)
				}
					
			})
		})
	}) */
	function showalert(){
		alert("click이 되었습니다.")
	};
	
	$(function(){
		$(".btcolor").click(function(){
			alert("click!!!!!")
		})
	})
	
	$(function(){
		$(".btcolor").click(function(){
			var color = $(this).text();
			$.ajax({
				type: "POST",
				url: "/kanye2/CtmzListAction.ct",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				data:{'color':color},
				datatype: "json",
				success:function(data){
					console.log('받기 성공');
					console.log(color);
					$.each(data, function(i, item){
						console.log(item);
						updatePrice();
					});
				},
				error:function(request, status, error){
					console.log(	'에러코드 : ' + request.status + '\n'
							+	'메시지 :' + request.responseText + '\n'
							+	'에러 : ' + error + '\n'
							+	'상태 : ' + status
					);
					return;
				}
			});	<%-- ajax --%>
		})
	})
	
	function updatePrice(){
		
	}
	
	

</script>


</head>
<body>
    <div class="container">
    	<div id="slides">
			<div class="no1">
		    	<a href="#" id="logo">
			   		<img alt="로고" src="../image/logo2.png" width="100"/>
			    </a>
			    <a href="#" id="login">
			   		<span>Login</span>
			    </a>
		   		<header>
		  				<h1>CUSTOMISE YOUR YEEZY BOOST</h1>
		  				<h3>designed by Kanye West</h3>
		   		</header>
		  			
		  			<div id="text">YZY BST</div>
		   		
		   		<img id="img1" src="../image/yzy350tan1.png" />
		
		
		
				<div class="size">
					<div id="sizeoutput">100</div>
					<div class="text">size</div>
				</div>
				<div class="size slide">
					<div class="btsize">3.5</div>
					<div class="btsize">4</div>
					<div class="btsize">4.5</div>
					<div class="btsize" id="5">5</div>
					<div class="btsize" id="3.5">5.5</div>
					<div class="btsize" id="3.5">6</div>
					<div class="btsize" id="3.5">6.5</div>
					<div class="btsize" id="3.5">7</div>
					<div class="btsize" id="3.5">7.5</div>
					<div class="btsize" id="3.5">8</div><br><br><br><br>
				</div>
				<!-- id->class로 다 바꾸기. -->
				
				<div class="color">
					<div id="color output">red</div>
					<div class="text">color</div>
				</div>
				<div class="color slide">
					<br><br>
					<div class="btcolor">gray</div>
					<div class="btcolor">beige</div>
					<div class="btcolor">black</div>
					<div class="btcolor" id="5">white</div>
					<div class="btcolor" id="3.5">dove</div>
					<br><br>
				</div>
				
				
				<div class="price">
					<div id="color output">$80</div>
					<div class="text">price</div>
				</div>
				<a href="#" class="slidesjs-next slidesjs-navigation"><i class="icon-chevron-right icon-large"></i></a>
			</div>    	
    		
    		<!-- 여기서부터 ctmz2 -->
			<div class="no2">
				<a href="#" id="logo"> <img alt="로고" src="../image/logo2.png"
					width="100" />
					
				</a> 
				<a href="#" class="slidesjs-previous slidesjs-navigation"><i class="icon-chevron-left icon-large"></i></a>
				<a href="#" id="login"> <span>Login</span>
				</a>
				<div class="no2 one">
					<header>
						<h1>ADIDAS YEEZY</h1>
						<h1>BOOST 350</h1>
						<h3>
							Size <span id="size_output">7</span>
						</h3>
					</header>


					<main> <!-- <div id="text">YZY BST</div> --> 
					<img src="../image/yzy350tan5.png" id="img5" /> </main>


					<footer>
						<h1 id="price_output">$1,099</h1>
						<h3>TOTAL AMOUNT</h3>

					</footer>
				</div>


				<div class="no2 two">
					<div class="info">
						<h1>ORDER INFORMATION</h1>
						<form action="">
							<input type="hidden" name="size" id="size_submit"> <input
								type="hidden" name="color" id="color_submit">
							<h3>NAME</h3>
							<input type="text" name="name" maxlength="10">
							<h3>PHONE</h3>
							<input type="text" name="phone" maxlength="13">
							<h3>ADDRESS</h3>
							<input type="text" name="address" id="address" maxlength="130">
							<h3>MESSAGE</h3>
							<input type="text" name="message" id="message" maxlength="140">
						</form>
						<div class="button">
							<a href="#" class="cancel">CANCEL</a> <a href="#" class="order">ORDER
								NOW!</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 여기까지가 ctmz2 -->    	
    	</div>
    </div>
    
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script src="../js/jquery.slides.min.js"></script>
    
	<script>
	    $(function() {
	      $('#slides').slidesjs({
	        width: 1920px,
	        height: 960px,
	        navigation: false
	      });
	    });
	</script>
    
    
	    
    
</body>
</html>