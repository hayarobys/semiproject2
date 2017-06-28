<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<head>
	<style type="text/css">
				/* 리뷰글이 핀터레스트 형식으로 담길 공간 */
		#appbox{
			margin: 0 auto;
			column-count: 5;
			column-gap: 5px;
			max-width: 715px;
		}
		
		#appbox figure{
			display: inline-block;
			margin: 0px;
			padding: 9px 9px 3px 9px;
			margin-bottom: 6px;
			
			max-width: 235px;
			min-width: 120px;
			
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
		
		#review_rate{
			color: orange;
			text-align: right;
			font-size: 15px;
			line-height: 21px;
			padding: 0;
			margin: 0;
		}
		
		#appbox figure p{
			clear: left;
			cursor: pointer;
			padding: 0;
			margin: 0.5em 0px 0px 0px;
			font-size: 0.7em;
		}
		
		#review_date{
			color: gray;
			text-align: right;
			font-size: 11px;
		}
	
	</style>
	
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
				url: "/kanye/GetMyReviewListAction.rv",
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
					/* $('.cssload-bell').css('visibility', 'visible');	// 로딩 이미지
					$('.moreReview').css('visibility', 'hidden');	// 더보기 버튼 */
				},
				complete: function(){
					// 통신 완료시 정의
					/* $('.cssload-bell').css('visibility', 'hidden');	// 로딩 이미지
					$('.moreReview').css('visibility', 'visible');	// 더보기 버튼 */
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
				
				$("#appbox").append('<figure id="review' + item.REVIEW_NO + '"><img src="' + item.REVIEW_IMAGE + '"><div id="review_rate">' + star + '</div><p>' + orgMsg + '</p><div id="review_date">' + item.REVIEW_DATE + '</div></figure>');
				<%if(user_grade >= 0){%>
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
				/* 	$('.cssload-bell').css('visibility', 'visible'); // 로딩 이미지 */
				},
				complete: function(){
					// 통신 완료시 정의
				/* 	$('.cssload-bell').css('visibility', 'hidden');	// 로딩 이미지 */
				}
			});	<%-- ajax --%>
		}	// getReview()
		
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
						/* $('.cssload-bell').css('visibility', 'visible'); // 로딩 이미지 */
					},
					complete: function(){
						// 통신 완료시 정의
						/* $('.cssload-bell').css('visibility', 'hidden');	// 로딩 이미지 */
					}
				});	<%-- ajax --%>

				return false;
			});
		});	<%-- $.ready --%> 
	</script>
	
</head>
<body>

	<article id="reviewTable">
	작성한 글이 없습니다.
		<article id="appbox">
			<%-- DB에서 불러온 이미지가 들어갈 공간 --%>
			
		</article>
	
	</article>
</body>


