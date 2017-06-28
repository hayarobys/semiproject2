<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	
	String user_id = "";
	int user_grade = -1;

	try{
		user_id = (String)session.getAttribute("user_id");
		user_grade = (int)session.getAttribute("user_grade");
	}catch(NullPointerException e){
		System.out.println("비로그인 유저의 접속입니다.");
		response.sendRedirect("../member/login.jsp");
	}
	
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>

</head>
<body>
	
	<a href="/kanye/CtmzAdminList.ct">상품 목록 확인/수정</a>
	<a href="/kanye/myPage/mypage_admin_orderlist.jsp">주문 목록 확인/수정</a>
	<a href="/kanye/MemAdminList.me">회원 정보 확인</a>
    
</body>
</html>

<!-- ctmzlist, orderlist, userlist로 이동하는 버튼 만들기. -->