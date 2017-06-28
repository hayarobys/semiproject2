<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="bst.order.action.*"%>
<%@ page import="bst.order.db.*"%>


<%
	String id=(String)session.getAttribute("id");
	List goods_order_list=(List)request.getAttribute("goods_order_list");
	System.out.println(goods_order_list);
%>




<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
   //YZMEMBER에서 해당 아이디의 주문 정보를 출력하는 기능.
   $(function(){
      <% 
      System.out.println("들어옴1");
      System.out.println(goods_order_list.size());
         for(int i = 0 ; i < goods_order_list.size() ; i++){
        	 System.out.println("들어옴5");
            YZOrderDTO order = new YZOrderDTO();
            System.out.println("들어옴2");
            order = (YZOrderDTO)goods_order_list.get(i);
            System.out.println("들어옴3");
            int orderNum = order.getORDER_NO();
            int goodsNum = order.getCTMZ_NO();
            String member = order.getMEM_ID();
            int status = order.getORDER_STATUS();
            int phone = order.getORDER_PHONE();
            String address = order.getORDER_ADDRESS();
            String name = order.getORDER_NAME();
            String message = order.getORDER_MESSAGE();
            Date date = order.getORDER_DATE();
            int size = order.getORDER_SIZE();
            
            System.out.println(orderNum);
            System.out.println(goodsNum);
            System.out.println(member);
            System.out.println(status);
            System.out.println(phone);
            System.out.println(address);
            System.out.println(orderNum);
 
        	String stat =null;
        	if (status == 0) {stat="입금 대기";
    		}else if (status == 1){stat="발송준비";
    		}else if (status == 2){stat="발송완료";
    		}else if (status == 3){stat="배송중";
    		}else if (status == 4){stat="배송완료";
	   	 	}else if (status == 5){stat="주문취소";
	    	}      
      %>      
            $(".tr"+<%=i%>+" .orderNum").html('<%=orderNum%>');
            $(".tr"+<%=i%>+" .goodsNum").html('<%=goodsNum%>');
            $(".tr"+<%=i%>+" .size").html('<%=size%>');
            $(".tr"+<%=i%>+" .name").html('<%=name%>');
            $(".tr"+<%=i%>+" .phone").html('<%=phone%>');
            $(".tr"+<%=i%>+" .address").html('<%=address%>');
            $(".tr"+<%=i%>+" .message").html('<%=message%>');
        	$(".tr"+<%=i%>+" .status").html('<%=stat%>');
            $(".tr"+<%=i%>+" .date").html('<%=date%>');
      <%
         }
         System.out.println("for문 빠져나옴.");
      %>
      
   });

<%--              $(".tr"+<%=i%>+" .image").attr("src","/kanye/image/"+'<%=image%>');    --%>
</script>

<style>
	#inform{
		display: inline-block;
	}
	#inform img{
		width:200px;
	}
</style>
</head>
<body>
	<h1>나의 주문내역 확인</h1>

	<table width="700" border="1" cellspacing="0" cellpadding="0">
	
		<tr>
			<td>주문 번호</td>
			<td>상품 코드</td>
			<td>사이즈</td>
			<td>받는 사람</td>
			<td>전화번호</td>
			<td>주소</td>
			<td>배송 메세지</td>
			<td>배송 현황</td>
			<td>주문 날짜</td>
		</tr>

		<tr class="tr0">
			<td class="orderNum"></td>
			<td class="goodsNum"></td>
			<td class="size"></td>
			<td class="name"></td>
			<td class="phone"></td>
			<td class="address"></td>
			<td class="message"></td>
			<td class="status"></td>
			<td class="date"></td>
		</tr>
		<tr class="tr1">
			<td class="orderNum"></td>
			<td class="goodsNum"></td>
			<td class="size"></td>
			<td class="name"></td>
			<td class="phone"></td>
			<td class="address"></td>
			<td class="message"></td>
			<td class="status"></td>
			<td class="date"></td>
		</tr>
		<tr class="tr2">
			<td class="orderNum"></td>
			<td class="goodsNum"></td>
			<td class="size"></td>
			<td class="name"></td>
			<td class="phone"></td>
			<td class="address"></td>
			<td class="message"></td>
			<td class="status"></td>
			<td class="date"></td>
		</tr>
		<tr class="tr3">
			<td class="orderNum"></td>
			<td class="goodsNum"></td>
			<td class="size"></td>
			<td class="name"></td>
			<td class="phone"></td>
			<td class="address"></td>
			<td class="message"></td>
			<td class="status"></td>
			<td class="date"></td>
		</tr>
		<tr class="tr4">
			<td class="orderNum"></td>
			<td class="goodsNum"></td>
			<td class="size"></td>
			<td class="name"></td>
			<td class="phone"></td>
			<td class="address"></td>
			<td class="message"></td>
			<td class="status"></td>
			<td class="date"></td>
		</tr>
		<tr class="tr5">
			<td class="orderNum"></td>
			<td class="goodsNum"></td>
			<td class="size"></td>
			<td class="name"></td>
			<td class="phone"></td>
			<td class="address"></td>
			<td class="message"></td>
			<td class="status"></td>
			<td class="date"></td>
		</tr>
	</table>
	
	<div id="inform">상품코드 1<img src="/kanye/image/yzy350mr5.png"></div>
	<div id="inform">상품코드 2<img src="/kanye/image/yzy350ta5.png"></div>
	<div id="inform">상품코드 3<img src="/kanye/image/yzy350pb5.png"></div>
	<div id="inform">상품코드 4<img src="/kanye/image/yzy350tw5.png"></div>
	<div id="inform">상품코드 5<img src="/kanye/image/yzy350td5.png"></div>

</body>
</html>
