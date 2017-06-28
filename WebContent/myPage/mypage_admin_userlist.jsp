<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="bst.member.db.YZMemberDTO" %>
<% 
   List list = (List)request.getAttribute("list");

%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
	img{
		width:200px;
		height:200px;
		
	}
</style>




<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
/* 	//상품 옆에 있는 "삭제" 버튼을 누르면 해당 상품이 삭제되는 기능.
$(function(){
	$(".delete").click(function(){
		var deleteColor = $(".delete~.color").text();
		$("input").val(deleteColor);
		document.nextform.action="/kanye/CtmzDeleteAction.ct";
		document.nextform.submit();
	})
}) */

	//YZCUSTOMIZE 테이블에 있는 모든 상품들의 정보를 출력하는 기능.
	$(function(){
		<% 
			for(int i = 0 ; i < list.size() ; i++){
				YZMemberDTO memDTO = new YZMemberDTO();
				
				memDTO = (YZMemberDTO)list.get(i);
				
				String id = memDTO.getMEM_ID();
				String name = memDTO.getMEM_NAME();
				String email = memDTO.getMEM_EMAIL();
				String phone = memDTO.getMEM_PHONE();
				int grade = memDTO.getMEM_GRADE();
				Date date = memDTO.getDate();
				
		%>		
				$(".tr"+<%=i%>+" .id").html('<%=id%>');
				$(".tr"+<%=i%>+" .name").html('<%=name%>');
				$(".tr"+<%=i%>+" .email").html('<%=email%>');
				$(".tr"+<%=i%>+" .phone").html('<%=phone%>');
				$(".tr"+<%=i%>+" .grade").html('<%=grade%>');
				$(".tr"+<%=i%>+" .date").html('<%=date%>');
				
		<%
			}
		%>
	});

</script>
</head>
<body>
    <h1>회원 정보 확인</h1>
    
    <table>
    	<tr>
    		<td>MEM_ID</td>
    		<td>MEM_NAME</td>
    		<td>MEM_EMAIL</td>
    		<td>MEM_HOME</td>
    		<td>MEM_PHONE</td>
    		<td>MEM_GRADE</td>
    		<td>MEM_DATE</td>
    	</tr>
    	<tr class="tr0">
    		<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr1">
    		<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr2">
   		<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr3">
   		<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr4">
   		<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr5">
   		<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr6">
   			<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr7">
   			<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr8">
   			<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr9">
   			<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr10">
   			<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    	<tr class="tr11">
   			<td class="id"></td>
    		<td class="name"></td>
    		<td class="email"></td>
    		<td class="home"></td>
    		<td class="phone"></td>
    		<td class="grade"></td>
    		<td class="date"></td>
    	</tr>
    </table>
    
    
    
      <form action="/kanye/CtmzDeleteAction.ct" name="nextform">
         <input type="hidden" id="size_submit" name="ctsize">
      </form>
</body>
</html>

<!-- 현재 등록한 상품의 정보 확인하는 페이지 + 삭제하거나, 추가하는 기능. -->
