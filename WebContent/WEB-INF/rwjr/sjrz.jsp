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
<title>融五金融</title>
<!--<link rel="icon" href="images/ico.png" type="image/x-icon">-->
<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>

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
        <div class="z-col topbarcenter">商家入驻</div>
        <div class="topbarright"></div>
     </div>
  </div>
  
  <div class="pad15">


      <a href="#">  
      <div class="z-row sjrzitem">
        <div class="sjrzxtb"><img src="images/xdxtb.png"></div>
        <div class="z-col sjrzitemtxt"> 信贷经理入驻</div>
        <div class="sjrzjt"><i class="fa fa-angle-right fa-2x"></i></div>
      </div>
      </a>

      
     <a href="#">  
      <div class="z-row sjrzitem">
        <div class="sjrzxtb"> <img src="images/qcxtb.png"></div>
        <div class="z-col sjrzitemtxt">二手车商入驻</div>
        <div class="sjrzjt"><i class="fa fa-angle-right fa-2x"></i></div>
      </div>
      </a>
      
      
      <a href="#"> 
      <div class="z-row sjrzitem">
        <div class="sjrzxtb"> <img src="images/zjxtb.png"></div>
        <div class="z-col sjrzitemtxt"> 房产中介入驻</div>
        <div class="sjrzjt"><i class="fa fa-angle-right fa-2x"></i></div>
      </div>
      </a>
      

  </div>
</div>  
<script>
  $(".sjrzjt").click(function(){
     window.location.href = 'sqrz';
  });
</script>

</body>
</html>