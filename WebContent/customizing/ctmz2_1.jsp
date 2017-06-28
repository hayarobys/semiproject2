<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ctmz2</title>
<style>

	@font-face{
		font-family:"Myriad"; 
		src:url('/kanye/font/Myriad-Pro-Bold_31631.eot') format('embedded-opentype');
		src:url('/kanye/font/Myriad-Pro-Bold_31631.ttf') format('truetype');
		src:url('/kanye/font/Myriad-Pro-Bold_31631.woff') format('woff');
	}

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

	body{
		font-family: "Myriad";
		margin:0px;
		display:inline-block;
		width:100%;
		height:100hv;
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
		/* shadow 흰색으로 blur 효과 줄 것. */
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


</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	
	/* 어떻게 값을 받아오나.... */
	
	$(".btsize").click(function(){//받아와야함.
		var size = $(this).text();
		$("#size_output").text(size);
		$("#size_submit").val(size);
	})

	
	$(".btcolor").click(function(){//받아와야함.
		var color = $(this).text();
		var price = 0;
		$("#color_output").text(color);
		$("#color_submit").val(color);
		/* color값 출력 & 전송 */
		var img = "../image/yzy350"
		img = img + color + "5.png";
		$("#img5").attr("href",img);
		/* color값에 맞게 이미지 출력 */
		
		/* $("#img5").attr("href","../image/yzy350").append(color).append("5.png"); */
		
	})
	
	$(".pricegetget").click(function(){
		$("#price_output").text("$")/* 기존에 있던 출력값을 없애고 새로 쓰기 위해. */
		$("#price_output").append(price);
		$("#price_submit").val(price);
	})
	
	


</script>

</head>
<body>
    <div class="no2">
    	<a href="#" id="logo">
	   		<img alt="로고" src="../image/logo2.png" width="100"/>
	    </a>
	    <a href="#" id="login">
	   		<span>Login</span>
	    </a>
 		<div class="no2 one">
 			<header>
	    		<h1>ADIDAS YEEZY</h1>
	    		<h1>BOOST 350</h1>
	    		<h3>Size <span id="size_output">7</span></h3>
    		</header>
    	
	    	
	    	<main>
	     		  <!-- <div id="text">YZY BST</div> -->
	      		 <img src="../image/yzy350tan5.png" id="img5"/>
	    	</main>
    	
	    	
	    	<footer>
	    	    <h1 id="price_output">$1,099</h1>
	    		<h3>TOTAL AMOUNT</h3>
	    		
	    	</footer>
 		</div>
 		
 		
 		<div class="no2 two">
 			<div class="info">
	 			<h1>ORDER INFORMATION</h1>
	 			<form action="/OrderAddAction.ct">
	 				<input type="hidden" name="size" id="size_submit">
	 				<input type="hidden" name="color" id="color_submit">
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
		 			<a href="#" class="cancel">CANCEL</a>
		 			<a href="#" class="order">ORDER NOW!</a>
	 			</div>
 			</div>
 		</div>   
    </div>
</body>
</html>