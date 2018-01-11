<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>融五金融-申请认证</title>
<!--<link rel="icon" href="images/ico.png" type="image/x-icon">-->
<link href="layui/css/layui.css" rel="stylesheet" type="text/css">
<link href="fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/z-layout.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->   
</head>
<body>

<!--
<div class="z-row">
    <div class="z-col"> </div>
</div>
-->


<div class="main">

  <div class="topbar">
     <div class="z-row">
        <div class="topbarleft"><i class="fa fa-chevron-left fa-fw"></i></div>
        <div class="z-col topbarcenter">申请认证</div>
        <div class="topbarright"></div>
     </div>
  </div>
  
  <div class="pad15">


      <a href="#">  
      <div class="z-row rzsq">
        <div class="sjrzxtb"><img src="images/sfzxtb.png"></div>
        <div class="z-col rzsqtxt">身份认证</div>
        <div class="rzsqjt" id="_sfzsqrz"><i class="fa fa-angle-right fa-2x"></i></div>
      </div>
      </a>

      
     <a href="#">  
      <div class="z-row rzsq">
        <div class="sjrzxtb"> <img src="images/gpxtb.png"></div>
        <div class="z-col rzsqtxt">工作认证</div>
        <div class="rzsqjt"><i class="fa fa-angle-right fa-2x"></i></div>
      </div>
      </a>
      

      

  </div>
</div>  
<script>
$(function(){
  $("#_sfzsqrz").click(function(){
      window.location.href="../sfzyz/index";
  });
})
</script>

</body>
</html>