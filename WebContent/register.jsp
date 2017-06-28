<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>회원 가입</title>
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

h1 {
	margin: 0px;
	position: absolute;
	top: 11%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-family: 'Myriad';
	color: #b3a695;
	font-size: 70px;
	font-weight: 500;
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

#shoes {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	height: auto;
	z-index: 1;
}

#register_id {
	margin: 0;
	position: absolute;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -50%);
	height: 210px;
	width: 450px;
	z-index: 2;
	border-collapse: collapse;
}

#register_info {
	margin: 0px;
	position: absolute;
	top: 61%;
	left: 50%;
	transform: translate(-50%, -50%);
	height: 350px;
	width: 450px;
	z-index: 2;
}

.field_id, .field_info {
	padding: 0px;
	padding-left: 20px;
	width: 450px;
	height: 60px;
	background-color: rgba(255, 255, 255, 0.8);
	border: 0px solid gray;
	outline: 0;
	font-size: 1.2em;
	font-weight: 600;
}

#p1 {
	width: 100px;
	margin: 0px ;
	pading: 0px;
}

#p2 {
	width: 170px;
	margin: 0px;

	pading: 0px;
}

#p3 {
	width: 170px;
	margin: 0px;
	pading: 0px;
}

#next {
	position: absolute;
	top: 85%;
	left: 50%;
	right: 50%;
	transform: translate(-50%, -50%);
	width: 450px;
	height: 60px;
	background-color: #b3a695;
	font-weight: 700;
	font-size: 1.2em;
	color: white;
	z-index: 2;
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

<script>
function check(){
	var id=joinform.MEMBER_ID.value;
	var password1=joinform.MEMBER_PW.value;
	var password2=joinform.MEMBER_PW2.value;	
	var email=joinform.MEMBER_EMAIL.value;
	var phone1=joinform.MEMBER_PHONE1.value;
	var phone2=joinform.MEMBER_PHONE2.value;
	var phone3=joinform.MEMBER_PHONE3.value;
	var addr1=joinform.MEMBER_ADDR1.value;
	var addr2=joinform.MEMBER_ADDR2.value;
	
	var forms = document.getElementById("joinform");

 
	if(id.length < 6){
	/* 	
		for (int i = 0; i < id.length(); i++) {
			 
			chr = id.charAt(i); 
			   
			if (chrInput >= 0x61 && chrInput <= 0x7A) { //소문자
			   break;
			} 
			else if (chrInput >=0x41 && chrInput <= 0x5A) { //대문자
				break;
			}
			else if (chrInput >= 0x30 && chrInput <= 0x39) {
			    // 숫자 OK!
			} 
			else {
				alert("아이디는 영문 또는 숫자로만 입력해주세요.");
				joinform.MEMBER_ID.focus();
			    return false;  
			}
		} else { */
			
		alert("아이디를 6글자 이상 입력하세요.");
		joinform.MEMBER_ID.focus();
		return false;
	}
	
	
	if(password1.length == 0){
		alert("비밀번호를 입력하세요.");
		joinform.MEMBER_PW.focus();
		return false;
	} 
	if(password1 != password2){
		alert("비밀번호가 일치하지 않습니다.");
		joinform.MEMBER_PW.value="";
		joinform.MEMBER_PW2.value="";
		joinform.MEMBER_PW.focus();
		return false;
	}
	
	if ((forms.MEMBER_NAME.value=="")||(forms.MEMBER_NAME.value.length<=1)){
		alert("이름을 제대로 입력해 주세요.");
		forms.MEMBER_NAME.focus();
         		return false;
	}
	
	if(email.length == 0){
		alert("이메일을 제대로 입력하세요.");
		joinform.MEMBER_EMAIL1.focus();
		return false;
	}
	if(phone1.length == 0||phone2.length == 0||hone3.length == 0){
		alert("전화번호를 모두 입력하세요.");
		joinform.MEMBER_PHONE.focus();
		return false;
	} 

 
	if(addr1.length == 0){
		alert("집 주소를 입력하세요.");
		joinform.MEMBER_ADDR1.focus();
		return false;
	} 
	if(addr2.length == 0){
		alert("상세 주소를 입력하세요.");
		joinform.MEMBER_ADDR2.focus();
		return false;
	} 

	return true;
}

</script>




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

	<h1>REGISTER</h1>

	
	<div id="shoes">
		<img alt="회원가입" src="/kanye/registerImage/aq2660_3_1.png" width="1500" />
	</div>

	<form name="joinform" id="joinform" action="./MemberJoin.me" method="post" onsubmit="return check()">		
		
	<section>
		<table id="register_id">
			<tr>

				<td><input type="text" name="MEMBER_ID" class="field_id" id="id"
					placeholder="아이디" /></td>

			</tr>
			<tr>

				<td><input type="password" name="MEMBER_PW" class="field_id" id="pw"
					placeholder="비밀번호" /></td>
			</tr>
			<tr>

				<td><input type="password" name="MEMBER_PW2" class="field_id" id="pw_chk"
					placeholder="비밀번호 확인" /></td>

			</tr>
		</table>
		<table id="register_info">
			<tr>
				<td><input type="text" name="MEMBER_NAME" class="field_info" id="name"
					placeholder="이름" /></td>
			</tr>
			<tr>
				<td><input type="text" name="MEMBER_EMAIL" class="field_info" id="mail"
					placeholder="이메일" /></td>

			</tr>
			<tr>
				<th><input type="text" name="MEMBER_PHONE1" class="field_info" id="p1"
					placeholder="핸드폰" /> <input type="text" name="MEMBER_PHONE2" class="field_info" id="p2" />
					<input type="text" name="MEMBER_PHONE3" class="field_info" id="p3" /></th>
			</tr>
			<tr>
				<td><input type="text" name="MEMBER_ADDR1" class="field_info" id="home1"
					placeholder="주소" /></td>
			</tr>
			<tr>
				<td><input type="text" name="MEMBER_ADDR2" class="field_info" id="home2"
					placeholder="상세주소" /></td>
			</tr>

		</table>
		<input type="submit" id="next" value="가입하기" />







	</section>
	
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
	
</body>
</html>