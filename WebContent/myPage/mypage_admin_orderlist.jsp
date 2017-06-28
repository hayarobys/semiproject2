<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="bst.order.db.*" %>
<% List list = (List)request.getAttribute("list"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#inform{
		font-weight:800;
	}
	td{
		text-align:center;
	}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	
	//YZCUSTOMIZE 테이블에 있는 모든 상품들의 정보를 출력하는 기능.
	$(function(){
		<% 
			for(int i = 0 ; i < list.size() ; i++){
				YZOrderDTO orderDTO = new YZOrderDTO();
				
				orderDTO = (YZOrderDTO)list.get(i);
				
				int odno = orderDTO.getORDER_NO();
				int ctno = orderDTO.getCTMZ_NO();
				String id = orderDTO.getMEM_ID();
				int status = orderDTO.getORDER_STATUS();
				int phone = orderDTO.getORDER_PHONE();
				String address = orderDTO.getORDER_ADDRESS();
				String name = orderDTO.getORDER_NAME();
				String message = orderDTO.getORDER_MESSAGE();
				Date date = orderDTO.getORDER_DATE();
				int size = orderDTO.getORDER_SIZE();
				
				/* String id = memDTO.getMEM_ID();
				String name = memDTO.getMEM_NAME();
				String email = memDTO.getMEM_EMAIL();
				String phone = memDTO.getMEM_PHONE();
				int grade = memDTO.getMEM_GRADE();
				Date date = memDTO.getDate(); */
				
		%>		
				$(".tr"+<%=i%>+" .odno").html('<%=odno%>');
				$(".tr"+<%=i%>+" .ctno").html('<%=ctno%>');
				$(".tr"+<%=i%>+" .id").html('<%=id%>');
				$(".tr"+<%=i%>+" .status").html('<%=status%>');
				$(".tr"+<%=i%>+" .phone").html('<%=phone%>');
				$(".tr"+<%=i%>+" .address").html('<%=address%>');
				$(".tr"+<%=i%>+" .name").html('<%=name%>');
				$(".tr"+<%=i%>+" .message").html('<%=message%>');
				$(".tr"+<%=i%>+" .date").html('<%=date%>');
				$(".tr"+<%=i%>+" .size").html('<%=size%>');
				
		<%
			}
		%>
	});

</script>
</head>
<body>
    <h1>주문 정보 확인</h1>
    
    <table>
    	<tr id="inform">
    		<td>주문#</td>
    		<td>상품#</td>
    		<td>ID</td>
    		<td>STATUS</td>
    		<td>PHONE</td>
    		<td>ADDRESS</td>
    		<td>NAME</td>
    		<td>MESSAGE</td>
    		<td>DATE</td>
    		<td>SIZE</td>
    	</tr>
    	<tr class="tr0">
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr1">
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr2">
   		<td class="id"></td>
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr3">
   		<td class="id"></td>
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr4">
   		<td class="id"></td>
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr5">
   		<td class="id"></td>
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr6">
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr7">
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr8">
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr9">
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr10">
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    	<tr class="tr11">
    		<td class="odno"></td>
    		<td class="ctno"></td>
    		<td class="id"></td>
    		<td class="status"></td>
    		<td class="phone"></td>
    		<td class="address"></td>
    		<td class="name"></td>
    		<td class="message"></td>
    		<td class="date"></td>
    		<td class="size"></td>
    	</tr>
    </table>
</body>
</html>

<!-- 주문 목록 확인하고, 배송시작할 때 버튼 누르면 자동으로 orderstatus가 1로 바뀌는 기능. -->


