<%-- 로그아웃 버튼을 눌렀을때 호출되는 페이지
다음의 방식으로 사용하라.
<span><a href="kanye/logout.me">로그아웃</a></span>

이러면 YZMemberController.java 를 거쳐서 이 페이지로 이동해온다.
여기서 세션에 저장된 user_id와 user_grade 등을 소멸하기 위해 세션영역 자체를 지워버릴까?

--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//로그아웃 처리 공간
	request.setCharacterEncoding("utf-8");
	session.invalidate();	// 세션소멸
	
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	response.setHeader ("Cache-Control", "no-cache");
	
	String link = request.getParameter("link");
	link = link.substring(1, link.length()-1 );
	
	System.out.println( "날아온 링크" + link );
	
	response.sendRedirect("" + link);
%>


