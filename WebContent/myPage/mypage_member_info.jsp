<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="bst.member.action.*"%>
<%@ page import="bst.member.db.*"%>


<%
   String id=(String)session.getAttribute("user_id");
   List my_info=(List)request.getAttribute("my_info");
   System.out.println(my_info);
%>


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
   //YZMEMBER에서 해당 아이디의 주문 정보를 출력하는 기능.
   $(function(){
      <% 
      System.out.println("들어옴1");
      System.out.println(my_info.size());
         for(int i = 0 ; i < my_info.size() ; i++){
           System.out.println("들어옴5");
           YZMemberDTO info = new YZMemberDTO();
            System.out.println("들어옴2");
            info = (YZMemberDTO)my_info.get(i);
            System.out.println("들어옴3");
            String member = info.getMEM_ID();
            String pw = info.getMEM_PASSWORD();
            String name = info.getMEM_NAME();
            String email = info.getMEM_EMAIL();
            String home = info.getMEM_HOME();
            String phone = info.getMEM_PHONE();
            Date date = info.getDate();
            int grade = info.getMEM_GRADE();
            
            String grade_str=null;

           if (grade == 0) {grade_str="일반회원";
          }else if (grade == 1){grade_str="관리자";
          }      
      %>      
            $(".tr"+<%=i%>+" .name").html('<%=name%>');
            $(".tr"+<%=i%>+" .phone").html('<%=phone%>');
            $(".tr"+<%=i%>+" .email").html('<%=email%>');
            $(".tr"+<%=i%>+" .home").html('<%=home%>');
           $(".tr"+<%=i%>+" .date").html('<%=date%>');
            $(".tr"+<%=i%>+" .grade").html('<%=grade_str%>');
      <%
         }
         System.out.println("for문 빠져나옴.");
      %>
      
   });

</script>

<style>

      
   table, h1{
      margin-left:10px;
   }

   }
   td{
      width:150px;
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
</head>
<body>
   <h1>${user_id}님 정보입니다.</h1>

   <table width="700" border="1" cellspacing="0" cellpadding="0">
   
      <tr id="top">
      
         <td>이름</td>
         <td>전화 번호</td>
         <td>이메일</td>
         <td>주소</td>
         <td>가입날짜</td>
         <td>회원등급</td>
      </tr>

      <tr class="tr0">
         <td class="name"></td>
         <td class="phone"></td>
         <td class="email"></td>
         <td class="home"></td>
         <td class="date"></td>
         <td class="grade"></td>
      </tr>
   </table>
   
</body>
</html>