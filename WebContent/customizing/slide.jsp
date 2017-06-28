<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

   <meta charset = "UTF-8">
   <title>slide up menu</title>
   
   <style type="text/css">
      #slide{
         background-color: orange;
         display: inline-block;
         
         width: 50px;
         height: 50px;
         
         position: absolute;
         bottom: 0px;
      }
      
      #slide:hover{
         height: 300px;
         transition: all .5s ease-in-out;
      }
   </style>
   
</head>
<body>

   <div id="slide">
      <button>1</button>
      <button>2</button>
      <button>3</button>
      <button>3</button>
      <button>3</button>
      <button>3</button>
      <button>3</button>
      <button>3</button>
      <button>3</button>
   </div>
   
</body>
</html>