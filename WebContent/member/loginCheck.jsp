<%--
	이 페이지는 로그인 정보가 유효한지 확인하는 역할을 한다.
	첫째, 입력 양식 유효성 검사.(특수문자/ 앞 뒤 공백/ 한글을 거른다.) (이건 가급적 클라이언트에서 처리하자)
	둘째, DB와 데이터 일치여부 확인
	셋째, 유효결과에서 분기하여 리디렉트 한다.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bst.member.db.*" %>

<%
	// 1. POST방식의 쿼리로부터 로그인 정보를 받아온다.
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("pw");
	
	// 2. 입력 유효성 검사(영문 대소문자, 숫자 20자)
	// 이것은 회원가입 단계에서 서버가 체크하도록 구성한다.
	
	// 3. DB 데이터 대조.
	YZMemberDAO memberDAO = new YZMemberDAO();
	boolean isMatching = memberDAO.loginCheck(user_id, user_pw);
	
	if(isMatching == false){
		// 매칭 실패시 fail 반환
		//out.print("fail");
		out.println("<script language=\"javascript\">");
		out.println("alert('아이디나 비밀번호가 잘못되었습니다.');");
		out.println("history.back()");	// 혹은 history.go(-1);
		out.println("</script>");
	}else{
		// 매칭 성공시 세션영역에 해당유저의 아이디와 등급을 저장하고 success 반환
		//out.print("success");
		
		int user_grade = memberDAO.getGrade(user_id);
		
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_pw", user_pw);
		session.setAttribute("user_grade", user_grade);
		System.out.println("유저 등급: " + user_grade + ", main.jsp로 이동합니다.");
		
		response.sendRedirect("./main.jsp");
	}
	
%>