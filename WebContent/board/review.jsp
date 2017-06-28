<%@	page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String user_id = "";
	int user_grade = -1;

	try{
		user_id = (String)session.getAttribute("user_id");
		user_grade = (int)session.getAttribute("user_grade");
		System.out.println("user_grade!: " + user_grade);
		// user_grade 1=어드민, 0=일반회원, -1=비로그인
	}catch(NullPointerException e){
		System.out.println("비로그인 유저의 접속입니다.");
	}
%>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<title>리뷰</title>

	<link rel="stylesheet" href="css/font-awesome.min.css">
	<style type="text/css">
		@font-face {
			font-family: "Myriad";
			src: url('font/Myriad-Pro-Bold_31631.eot')
				format('embedded-opentype');
			src: url('font/Myriad-Pro-Bold_31631.ttf') format('truetype');
			src: url('font/Myriad-Pro-Bold_31631.woff') format('woff');
		}
		
		body { 
			margin: 0;
			background-color: #F2E6D7;
		}
		
		header{
			background-color: #D8CEC0;
			height: 75px;
			width: 100%;
			position: fixed;
			left: 0px;
			top: 0px;
			border-bottom: 1px solid #b3a695;
			z-index: 5;
		}
		
		<%-- 이 아래부턴 로고-메뉴 관련 css --%>
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
			padding: 80px 0px 0px 0px;
		}
		
		.menu  ul li:hover li {
			padding: 10px 5px 10px 5px;
		}
		
		<%-- 이 아래는 로그인 버튼 --%>
		#logo {
			position: absolute;
			top: -5%;
			left: 2.5%;
			width:100px;
			height:100px;
		}
		
		.loginout{
			position: absolute;
			top: 25%;
			right: 3%;
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
		
		#login {
			position: absolute;
			top: 25%;
			right: 3%;
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
		
		section{
			background-color: #F2E6D7;
			margin: 75px auto 0;
			min-width: 780px;
			padding: 5px 0;
		}
		
		#addreview{
			background-color: white;
			border-radius: 100%;
			width: 2.5em;
			height: 2.5em;
			line-height: 2.5em;
			text-align: center;
			position: fixed;
			bottom: 8%;
			right: 30px;
			box-shadow: 0 1px 2px rgba(0, 0, 0, 0.7);
			font-weight: bolder;
			cursor: pointer;
			
		}
		
		#addpopup{
			width: 253px;
			height: auto;
			display: none;
			background-color:#F7F7EF;
			margin: 0px;
			padding: 9px 9px 3px 9px;
			border-radius: 10px;
			text-align: center;
			z-index: 4;
			box-shadow: 0 0 4px rgba(0, 0, 0, 0.7);
		}
		
		#imgbox{
			border-radius: 10px;
			margin: 0;
			padding: 0;
			display: inline-block;
			cursor: pointer;
			
			clear:both;
		}
		
		#imgfileaddbutton{
			display:none;
		}
		
		#ratetext{
			border: 0;
			color: #f6931f;
			font-weight: bold;
			width: 14%;
			display: inline-block;
			text-align: left;
		}
		
		#ratebar{
			width: 50%;
			display: inline-block;
		}
		
		#length_counter{
			width: 28%;
			display: inline-block;
			font-size: 0.8em;
			text-align: right;
		}
		
		#message{
			border-radius: 10px;
			outline: 0;
			padding: 5px 2px 5px 7px;
		}
		
		.review_button{
			background-color: #D8CEC0;
			font-weight: bolder;
			font-size: 1.5em;
			width: 50%;
			height: 40px;
			border-radius: 13px;
			outline: 0;
			cursor: pointer;
		}
		
		/* 리뷰글이 핀터레스트 형식으로 담길 공간 */
		#appbox{
			margin: 0 auto;
			column-count: 3;
			column-gap: 5px;
			max-width: 780px;
		}
		
		@media(min-width: 1044px){
			#appbox{
				column-count: 4;
				max-width: 1044px;
			}
		}
		
		@media(min-width: 1308px){
			#appbox{
				column-count: 5;
				max-width: 1308px;
			}
		}
		
		#appbox figure{
			display: inline-block;
			margin: 0px;
			padding: 9px 9px 3px 9px;
			margin-bottom: 6px;
			
			max-width: 235px;
			min-width: 235px;
			
			background-color: #F7F7EF;
			
			border-radius: 10px;
		}
		
		#appbox figure:hover{
			box-shadow: 0 0 2px rgba(0, 0, 0, 0.7);
			-webkit-box-shadow: 0 0 2px rgba(0, 0, 0, 0.7);
			-moz-box-shadow: 0 0 2px rgba(0, 0, 0, 0.7);
			
			opacity: 0.75;
			transition: all .2s ease;
		}
	
		#delete_button{
			width: 0.95em;
			height: 0.95em;
			border: 1px solid #9E9E9E;
			background-color: #D7D7D7;
			color: #A1A1A1;
			text-align: center;
			line-height: 0.95em;
			border-radius: 100%;
			position: absolute;
			cursor: pointer;
			display: none;
		}
		
		#appbox figure img{
			width: 100%;
			margin-bottom: 6px;
			border-radius: 10px;
			cursor: pointer;
		}
		
		#review_mem_id{
			width: 40%;
			padding: 0;
			margin: 0;
			float: left;
		}
		
		#review_rate{
			color: orange;
			text-align: right;
			font-size: 20px;
			line-height: 21px;
			padding: 0;
			margin: 0;
		}
		
		#appbox figure p{
			clear: left;
			cursor: pointer;
			padding: 0;
			margin: 0.5em 0px 0px 0px;
		}
		
		#review_date{
			color: gray;
			text-align: right;
			font-size: 11px;
		}
		
		footer{
			background-color: #F2E6D7;
			height: 100px;
			min-width: 780px;
		}
		
		<%-- 이하는 더보기 버튼 --%>
		.moreReview{
			background-color:#fdf6eb;
			
			-webkit-border-top-left-radius:4px;
			-moz-border-radius-topleft:4px;
			border-top-left-radius:4px;
			
			-webkit-border-top-right-radius:4px;
			-moz-border-radius-topright:4px;
			border-top-right-radius:4px;
			
			-webkit-border-bottom-right-radius:4px;
			-moz-border-radius-bottomright:4px;
			border-bottom-right-radius:4px;
			
			-webkit-border-bottom-left-radius:4px;
			-moz-border-radius-bottomleft:4px;
			border-bottom-left-radius:4px;
			
			text-indent:0;
			border:2px solid #b3a695;
			display:inline-block;
			color:#b3a695;
			
			font-family:Arial Black;
			font-size:16px;
			font-weight:bold;
			font-style:normal;
			
			height:30px;
			line-height:30px;
			width:94px;
			position: relative;
			left: calc(50% - 47px);
			
			text-decoration:none;
			text-align:center;
			text-shadow:1px 1px 0px #fdf6eb;
		}
		
		.moreReview:hover {
			background-color:#e7d3bd;
		}
		
		.moreReview:active {
			position: relative;
			top:1px;
		}
		
		<%-- 이하는 CSS 로딩애니메이션. 추후 GIF로 교체 가능성 있음. --%>
		.cssload-bell{
			z-index: 3;
			width: 26px;
			height: 28px;
			border-radius: 100%;
			
			position:fixed;
			right: 13px;
			bottom: 13px;
		}
		
		.cssload-circle {
			width: 100%;
			height: 100%;
			position:fixed;
		}
		
		.cssload-circle .cssload-inner {
			width: 100%;
			height: 100%;
			border-radius: 100%;
			border: 4px solid rgba(179,166,149,0.7);
			border-right: none;
			border-top: none;
			background-clip: padding;
			box-shadow: inset 0px 0px 8px rgba(198,198,192,0.15);
		}
		
		.cssload-circle:nth-of-type(0) {
			transform: rotate(0deg);
				-o-transform: rotate(0deg);
				-ms-transform: rotate(0deg);
				-webkit-transform: rotate(0deg);
				-moz-transform: rotate(0deg);
		}
		
		.cssload-circle:nth-of-type(0) .cssload-inner {
			animation: cssload-spin 1.3s infinite linear;
				-o-animation: cssload-spin 1.3s infinite linear;
				-ms-animation: cssload-spin 1.3s infinite linear;
				-webkit-animation: cssload-spin 1.3s infinite linear;
				-moz-animation: cssload-spin 1.3s infinite linear;
		}
		
		.cssload-circle:nth-of-type(1){
			transform: rotate(70deg);
				-o-transform: rotate(70deg);
				-ms-transform: rotate(70deg);
				-webkit-transform: rotate(70deg);
				-moz-transform: rotate(70deg);
		}
		
		.cssload-circle:nth-of-type(1) .cssload-inner{
			animation: cssload-spin 2.3s infinite linear;
				-o-animation: cssload-spin 2.3s infinite linear;
				-ms-animation: cssload-spin 2.3s infinite linear;
				-webkit-animation: cssload-spin 2.3s infinite linear;
				-moz-animation: cssload-spin 2.3s infinite linear;
		}
		
		.cssload-circle:nth-of-type(2){
			transform: rotate(140deg);
				-o-transform: rotate(140deg);
				-ms-transform: rotate(140deg);
				-webkit-transform: rotate(140deg);
				-moz-transform: rotate(140deg);
		}
		
		.cssload-circle:nth-of-type(2) .cssload-inner{
			animation: cssload-spin 2.3s infinite linear;
				-o-animation: cssload-spin 2.3s infinite linear;
				-ms-animation: cssload-spin 2.3s infinite linear;
				-webkit-animation: cssload-spin 2.3s infinite linear;
				-moz-animation: cssload-spin 2.3s infinite linear;
		}
		
		.cssload-bell{
			animation: cssload-spin 2.75s infinite linear;
				-o-animation: cssload-spin 2.75s infinite linear;
				-ms-animation: cssload-spin 2.75s infinite linear;
				-webkit-animation: cssload-spin 2.75s infinite linear;
				-moz-animation: cssload-spin 2.75s infinite linear;
		}
		
		@keyframes cssload-spin{
			from {
				transform: rotate(0deg);
			}
			to {
				transform: rotate(360deg);
			}
		}
		
		@-o-keyframes cssload-spin{
			from {
				-o-transform: rotate(0deg);
			}
			to {
				-o-transform: rotate(360deg);
			}
		}
		
		@-ms-keyframes cssload-spin {
			from {
				-ms-transform: rotate(0deg);
			}
			to {
				-ms-transform: rotate(360deg);
			}
		}
		
		@-webkit-keyframes cssload-spin {
			from {
				-webkit-transform: rotate(0deg);
			}
			to {
				-webkit-transform: rotate(360deg);
			}
		}
		
		@-moz-keyframes cssload-spin {
			from {
				-moz-transform: rotate(0deg);
			}
			to {
				-moz-transform: rotate(360deg);
			}
		}
	</style>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
 	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
 	<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
 	<script src="http://malsup.github.com/jquery.form.js"></script> 
	<script type="text/javascript">
		
		var reactId = 1;
		var howMany = 15;
		
		function getReviewList(){
		<%-- 썸네일 리뷰 리스트를 Ajax통신으로 받아오는 비동기 함수. --%>
			console.log("페이지 추가 로드");
		
			$.ajax({
				type: "GET",
				url: "/kanye/GetReviewListAction.rv",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				data:{
					'startId':reactId,
					'howMany':howMany
				},
				datatype: "json",
				success:function(data){
					var message = data.message;
					console.log('message: ' + message);
					console.log('reactId: ' + reactId);
					
					if(message == 'success'){
						//console.log('data.jsonReviewList: ' + data.jsonReviewList);
						addReviewList(data.jsonReviewList);
						reactId += howMany;
						
						// 로드된 컨텐츠가 페이지 높이보다 적어 스크롤바가 사라졌을때의 처리
						if ( $("body").height() < $(window).height() ){
							getReviewList();
						}
						
					}else if(message == 'finishdata'){
						console.log('불러올 데이터가 없습니다.');
						
					}else if(message == 'error'){
						console.log('죄송합니다, DB에 장애가 있습니다. 고객센터에 문의해 주십시오.');
					}
				},
				error:function(request, status, error){
					console.log(	'에러코드 : ' + request.status + '\n'
						+	'메시지 :' + request.responseText + '\n'
						+	'에러 : ' + error + '\n'
						+	'상태 : ' + status
					);
					return;
				},
				beforeSend: function(){
					// 로딩 동작 정의
					$('.cssload-bell').css('visibility', 'visible');// 로딩 이미지
					$('.moreReview').css('visibility', 'hidden');	// 더보기 버튼
				},
				complete: function(){
					// 통신 완료시 정의
					$('.cssload-bell').css('visibility', 'hidden');	// 로딩 이미지
					$('.moreReview').css('visibility', 'visible');	// 더보기 버튼
				}
			});	<%-- ajax --%>
		}
		
		function addReviewList(list){
		<%-- 웹페이지에 리뷰 리스트를 등록하는 함수. 목록으로 json 배열 리뷰데이터만 줄 것. --%>
			$.each(list, function(index, item){
				var orgMsg = item.REVIEW_MESSAGE;
				console.log('orgMsg: ' + orgMsg);
				if(orgMsg != null){
					if(orgMsg.length >= 35){
						orgMsg = orgMsg.substr(0, 35) + '<span style="color: brown;"> ...</span>';
					}
				}
				var star = "";
				var rate = item.REVIEW_RATE;
				for(var i = 1; i <= rate; i++){
					star += '★';
				}
				
				$("#appbox").append('<figure id="review' + item.REVIEW_NO + '"><img src="' + item.REVIEW_IMAGE + '"><div id="review_mem_id">' + item.MEM_ID + '</div><div id="review_rate">' + star + '</div><p>' + orgMsg + '</p><div id="review_date">' + item.REVIEW_DATE + '</div></figure>');
				<%if(user_grade == 1){%>
					$('#review' + item.REVIEW_NO).prepend('<div id="delete_button"><b>×</b></div>');
				
				<%}%>
			});
		}
		
		function getReview(revNo){
			<%-- 단 하나의 리뷰글을 로딩하는 함수. --%>
			console.log("상세 리뷰글 요청");
			
			$.ajax({
				type: "GET",
				url: "/kanye/GetReviewAction.rv",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				data:{
					'revNo':revNo,
				},
				datatype: "json",
				success:function(data){
					var message = data.message;
					console.log('revNo: ' + revNo);
					
					if(message == 'success'){
						console.log('상세 데이터를 성공적으로 불러왔습니다.');
						//popupReview(data);
						$('#review' + revNo + ' img').attr('src', data.REVIEW_IMAGE);
					}else if(message == 'error'){
						console.log('데이터를 불러오지 못했습니다. 글이 삭제되었거나 DB장애 입니다. 문의 해주세요.');
						
					}
				},
				error:function(request, status, error){
					console.log(	'에러코드 : ' + request.status + '\n'
							+	'메시지 :' + request.responseText + '\n'
							+	'에러 : ' + error + '\n'
							+	'상태 : ' + status
					);
					return;
				},
				beforeSend: function(){
					// 로딩 동작 정의
					$('.cssload-bell').css('visibility', 'visible'); // 로딩 이미지
				},
				complete: function(){
					// 통신 완료시 정의
					$('.cssload-bell').css('visibility', 'hidden');	// 로딩 이미지
				}
			});	<%-- ajax --%>
		}	// getReview()
		
		function setSize(obj){
		<%-- 리뷰등록 팝업창에서 이미지 미리보기에 사진이 등록될때 호출되는 함수. readURL과 거의 동시에 호출 --%>
			var imgWidth = obj.naturalWidth;
			var imgHeight = obj.naturalHeight;
			console.log('이미지 가로: ' + imgWidth);
			console.log('이미지 세로: ' + imgHeight);

			if(imgWidth >= imgHeight){
				$('#imgbox').css({
					'width':'100%',
					'height':'auto'
				});
				
				console.log('가로가 더 긴 사진이다.');
			}else{
				$('#imgbox').css({
					'height':'240px',
					'width':'auto'
				});
				console.log('세로가 더 긴 사진이다.');
			}
			
			
		}
		
		function readURL(input){
		<%-- 우측하단 플러스 버튼을 눌러 나온 리뷰등록 팝업창에서 이미지 파일을 업로드했을때 호출되는 함수 --%>
			var str = input.value;
			console.log('업로드한 파일 이름: ' + input.value.substring(str.lastIndexOf("\\")+1));
			
			if(input.files && input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					$('#imgbox').attr('src', e.target.result);
				}
				
				reader.readAsDataURL(input.files[0]);
				
			}
		}	// readURL()
		
		$(window).scroll(function() {
		// 스크롤 막대가 바닥에 닿으면 DB로부터 리뷰글을 추가로 요청.
			/* console.log('scrollTop: ' + $(window).scrollTop());
			console.log('document.height: ' + $(document).height());
			console.log('window.height: ' + $(window).height()); */
			
				//scrollTop - 스크롤 바에서 마우스로 움직이는 네모난 스크롤 막대의 가장 윗부분의 y좌표.
				//document.height - body의 높이/길이 (웹브라우저는 이 길이가 모니터보다 클 경우 스크롤바를 보여준다.)
				//window.height - 브라우저 viewport의 높이(창의 크기에서 주소창과 같은 상하단 메뉴를 제외한 길이)
			
			if ( $(window).scrollTop() == $(document).height() - $(window).height() ){
				getReviewList();
			}
		});
		
		$(function(){
			<%-- 처음 웹페이지에 접속했을때 보여줄 리뷰글을 DB에 요청 --%>
			getReviewList();
			 
			<%-- 리뷰글 클릭시 게시글 번호를 DB로 전송 --%>
			$(document).on('click', '#appbox figure', function(){
				
				var reviewNo = $(this).attr('id').substring('review'.length);
				console.log('reviewNo: ' + reviewNo);
				
				getReview(reviewNo);

				return false;
			});
			
			<%-- 리뷰글에 마우스 오르내릴시 삭제 버튼 표시/비표시. 수정 기능은 두 시간의 여유가 주어지면 하겠음. --%>
			$(document).on('mouseenter', '#appbox figure', function(){
				<%-- 마우스 enter --%>
				$(this).find('#delete_button').css({
					'display':'block'
				});

				return false;
			});
			
			$(document).on('mouseleave', '#appbox figure', function(){
				<%-- 마우스 leave --%>
				$(this).find('#delete_button').css({
					'display':'none'
				});

				return false;
			});
			
			<%-- 우측 하단 플러스 버튼을 눌렀을시 리뷰글 등록 동작 수행 --%>
			$('#addreview').click(function(){
				<%if(user_grade < 0){%>
					alert('로그인이 필요한 기능입니다.');
					return;
				<%}else{%>
					$('#addpopup').show();
					$('#addpopup').center();
				<%}%>
			});
			
			$('#message').keyup(function(e){
				var content = $(this).val();
				/* $(this).height(((content.split('\n').length + 1) * 1.5) + 'em'); 높이 증가 코드*/
				$('#length_counter').html(content.length + ' / 200');
			});
			
			<%-- 리뷰등록 팝업창의 사진등록 버튼 클릭시 동작 정의 --%>
			$('#imgbox').click(function(e){
				e.preventDefault();
				$('#imgfileaddbutton').click();
			});
			
			<%-- 리뷰등록 팝업창의 평점 슬라이드바 동작 정의 --%>
			$('#ratebar').slider({
				value:3,
				min:1,
				max:5,
				step:1,
				slide:function(event, ui){
					$('#ratetext').text('★  ' + ui.value);
				}
			});
			/* 처음 로딩되었을때 표시할 값. */
			$('#ratetext').text('★  ' + $('#ratebar').slider('value'));
			
			<%-- 리뷰등록 버튼을 눌렀을때의 ajax전송 정의 --%>
			$('#upload').ajaxForm({
				success: function(data){
					console.log('응답받음: ' + data.result) ;
					// 통신 완료시 정의
					$('.cssload-bell').css('visibility', 'hidden');	// 로딩 이미지
					$('#imgbox').attr('src', '/kanye/image/empty.png');
					$('#upload')[0].reset();	// 확장집합($로 감싼 애들을 부르는 말)은 배열로 관리되기에 이렇게 접근한다.
					$('#addpopup').hide();
				},
				beforeSubmit: function(){
					// 로딩 동작 정의
					$('.cssload-bell').css('visibility', 'visible');	// 로딩 이미지
				},
				beforeSerialize: function() {
					// form을 직렬화하기전 엘레먼트의 속성을 수정할 수도 있다.
					
				},
				dataType: 'json'	// 응답받을 데이터는 json으로 해석한다.
			});
			
			<%-- 리뷰글 삭제 버튼을 누를시 ajax로 db에 제거요청 후, 페이지 재정렬. --%>
			$(document).on('click', '#delete_button', function(){
				var revNo = $(this).parent().attr('id').substring(6);
				console.log('리뷰아이디: '+revNo);
				
				<%-- 삭제버튼 클릭시 동작 정의 --%>
				console.log('delete click!');
				$.ajax({
					type: "POST",
					url: "/kanye/ReviewDeleteAction.rv",
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:{
						'revNo':revNo,
					},
					datatype: "json",
					success:function(data){
						var message = data.message;
						console.log('revNo: ' + revNo);
						console.log('message: ' + message);
						
						if(message == 'success'){
						<%-- DB로부터 삭제성공 메시지가 반환되면 클라이언트의 웹페이지에서도 제거 --%>
							$('#review' + revNo).remove();
							console.log('#review' + revNo + '번 리뷰를 성공적으로 삭제 했습니다');
						}else if(message == 'error'){
							console.log('이미 삭제된 글이거나 DB장애 입니다. 문의 해주세요.');
						}
					},
					error:function(request, status, error){
						console.log(	'에러코드 : ' + request.status + '\n'
								+	'메시지 :' + request.responseText + '\n'
								+	'에러 : ' + error + '\n'
								+	'상태 : ' + status
						);
						return;
					},
					beforeSend: function(){
						// 로딩 동작 정의
						$('.cssload-bell').css('visibility', 'visible'); // 로딩 이미지
					},
					complete: function(){
						// 통신 완료시 정의
						$('.cssload-bell').css('visibility', 'hidden');	// 로딩 이미지
					}
				});	<%-- ajax --%>

				return false;
			});
		});	<%-- $.ready --%> 
	</script>
	
	<script type="text/javascript">
	<%-- 리뷰 추가 버튼 클릭시 나타나는 팝업창 정의 --%>
		<%-- 모든 요소에 적용되는 center() 라는 프로토타입 정의 --%>
		<%-- center()가 호출된 문서객체는 스크롤에 관계없이 화면 중앙에 나타나게 된다. --%>
		jQuery.fn.center = function(){
			console.log( $(window).width() - $(this).outerWidth() );
			console.log( ( ( $(window).width() - $(this).outerWidth() ) / 2 ) + $(window).scrollLeft() + 'px');
			
			this.css({
				'position':'absolute',
				'top':Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + 'px',
				'left':Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + 'px'
			});
			
			return this;
		}
		
		<%-- 리뷰 등록 버튼 클릭시 호출 --%>
		function insertReview(){
			console.log('등록버튼 클릭!');
			
			/* console.log('이미지박스: ' + $('#imgbox').attr('src')); */
			console.log('레이트텍스트:' + $('#ratetext').text().substring(3));
			console.log('메시지: ' + $('#message').val());
			
			$('#ratetext2').attr('value', $('#ratetext').text().substring(3));
			
			$('#upload').submit();
		}
		
		<%-- 리뷰 취소 버튼 클릭시 호출 --%>
		function cancelReview(){
			console.log('취소버튼 클릭!');
			$('#upload')[0].reset();
			$('#addpopup').hide();
		}
	</script>
	
</head>
<body>
	<header>
	<%-- display: fixed; 헤더 공간 --%>
		<!-- <a href="/kanye/main.jsp" id="logo">
			<img alt="로고" src="/kanye/image/logo2.png" width="100"/>
		</a> -->
		
		<div class="menu">
			<ul>
				<li>
					<a href="/kanye/main.jsp" id="logo">
						<img alt="로고" src="mainImage/logo2.png" width="100" />
					</a>
					<ul>
						<li><a href="/kanye/CtmzList.ct">CUSTOMIZE</a></li>
						<li><a href="/kanye/history.jsp">HISTORY</a></li>
						<li><a href="/kanye/review.rv">REVIEW</a></li>
						<li><a href="/kanye/main.jsp">EVENT</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
		<%if(user_id == null || user_id == ""){%>
			<a href="/kanye/login.me" id="login">
				<span>Login</span>
			</a>
		<%}else{%>
			<a href='/kanye/logout.me?link="review.rv"' class="loginout">
				${user_id}<span style="font-size: 0.9em;"> 님</span>
			</a>
		<%}%>
	</header>
	
	<section>
		<article id="addpopup">
			<%-- 리뷰 추가버튼을 누르면 나타나는 팝업창 --%>
			<%-- http://ohming.tistory.com/250 참조. --%>
			<form enctype="multipart/form-data" method="POST" action="kanye/AddReviewAction.rv" id="upload" name="upload">
				<div><img id="imgbox" src="/kanye/image/empty.png" onload="setSize(this);"></div>
				<input type="file" name="imgfileaddbutton" id="imgfileaddbutton" onchange="readURL(this);">
				<div id="ratetext"></div><input type="hidden" id="ratetext2" name="ratetext2" value="">
				<div id="ratebar"></div>
				<div id="length_counter">0 / 200</div>
				<textarea rows="6" cols="32" name="message" id="message" maxlength="200"></textarea>
				<button id="commit_button" class="review_button" onclick="insertReview();return false;">등록</button><button id="cancel_button" class="review_button" onclick="cancelReview(); return false;">취소</button>
			</form>
		</article>
	
		<article id="appbox">
			<%-- DB에서 불러온 이미지가 들어갈 공간 --%>
		</article>
		
		<%-- 리뷰추가 버튼. 우측 하단에 fixed로 위치하는 동그란 플러스 버튼 --%>
		<div id="addreview">┼</div>
		
		<%-- 로딩 이미지. ajax 통신중 노출됨--%>
		<div class="cssload-bell">
			<div class="cssload-circle">
				<div class="cssload-inner"></div>
			</div>
			<div class="cssload-circle">
				<div class="cssload-inner"></div>
			</div>
			<div class="cssload-circle">
				<div class="cssload-inner"></div>
			</div>
			<div class="cssload-circle">
				<div class="cssload-inner"></div>
			</div>
			<div class="cssload-circle">
				<div class="cssload-inner"></div>
			</div>
		</div>
	</section>
	
	<footer>
		<a href="#none" class="moreReview" onclick="getReviewList()">더보기</a>
	</footer>
</body>
</html>
