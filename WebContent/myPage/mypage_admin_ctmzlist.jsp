<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="bst.ctmz.db.CtmzDTO" %>
<% 
   List list = (List)request.getAttribute("list");

%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
	table, h1{
		margin-left:10px;
	}
	table img{
		width:120px;
		
	}
	td{
		width:100px;
	}
	table{
		text-align:center;
	}
	h1{
		margin:50px;
	}
	#top{
		font-weight:800;
		height:50px;
	}
	
</style>




<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	//YZCUSTOMIZE 테이블에 있는 모든 상품들의 정보를 출력하는 기능.
	$(function(){
		<% 
			for(int i = 0 ; i < list.size() ; i++){
				CtmzDTO ctmzDTO = new CtmzDTO();
				
				ctmzDTO = (CtmzDTO)list.get(i);
				
				int no = ctmzDTO.getCTMZ_NO();
				String model = ctmzDTO.getCTMZ_MODEL();
				String color = ctmzDTO.getCTMZ_COLOR();
				int price = ctmzDTO.getCTMZ_PRICE();
				String image1 = ctmzDTO.getCTMZ_IMAGE1();
				String image2 = ctmzDTO.getCTMZ_IMAGE2();
				
		%>		
				$(".tr"+<%=i%>+" .no").html('<%=no%>');
				$(".tr"+<%=i%>+" .model").html('<%=model%>');
				$(".tr"+<%=i%>+" .color").html('<%=color%>');
				$(".tr"+<%=i%>+" .price").html('<%=price%>');
				$(".tr"+<%=i%>+" .image1 img").attr("src","/kanye/image/"+'<%=image1%>');
				$(".tr"+<%=i%>+" .image2 img").attr("src","/kanye/image/"+'<%=image2%>');
		<%
			}
		%>
	});
	
	
	//상품 옆에 있는 "삭제" 버튼을 누르면 해당 상품이 삭제되는 기능.
/* 	$(function(){
		$(".delete").click(function(){
			var deleteColor = $(".delete~.color").text();
			$("input").val(deleteColor);
			document.nextform.action="/kanye/CtmzDeleteAction.ct";
			document.nextform.submit();
		})
	}) */


</script>
</head>
<body>
    <h1>상품 정보 확인</h1>
    
    <table>
    	<tr id="top">
    		<td>NO</td>
    		<td>MODEL</td>
    		<td>COLOR</td>
    		<td>PRICE</td>
    		<td>IMAGE1</td>
    		<td>IMAGE2</td>
    	</tr>
    	<tr class="tr0">
    		<td class="no">dfdf</td>
    		<td class="model"></td>
    		<td class="color"></td>
    		<td class="price"></td>
    		<td class="image1"><img></td>
    		<td class="image2"><img></td>
    	</tr>
    	<tr class="tr1">
    		<td class="no"></td>
    		<td class="model"></td>
    		<td class="color"></td>
    		<td class="price"></td>
    		<td class="image1"><img></td>
    		<td class="image2"><img></td>
    	</tr>
    	<tr class="tr2">
    		<td class="no"></td>
    		<td class="model"></td>
    		<td class="color"></td>
    		<td class="price"></td>
    		<td class="image1"><img></td>
    		<td class="image2"><img></td>
    	</tr>
    	<tr class="tr3">
    		<td class="no"></td>
    		<td class="model"></td>
    		<td class="color"></td>
    		<td class="price"></td>
    		<td class="image1"><img></td>
    		<td class="image2"><img></td>
    	</tr>
    	<tr class="tr4">
    		<td class="no"></td>
    		<td class="model"></td>
    		<td class="color"></td>
    		<td class="price"></td>
    		<td class="image1"><img></td>
    		<td class="image2"><img></td>
    	</tr>
    	<tr class="tr5">
    		<td class="no"></td>
    		<td class="model"></td>
    		<td class="color"></td>
    		<td class="price"></td>
    		<td class="image1"><img></td>
    		<td class="image2"><img></td>
    	</tr>
    </table>
    
    
    
      <form action="/kanye/CtmzDeleteAction.ct" name="nextform">
         <input type="hidden" id="size_submit" name="ctsize">
      </form>
</body>
</html>

<!-- 현재 등록한 상품의 정보 확인하는 페이지 + 삭제하거나, 추가하는 기능. -->
