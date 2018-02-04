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
<title>职位修改</title>
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
<div class="main">

  <div class="topbar">
     <div class="z-row">
        <div class="topbarleft"><i class="fa fa-chevron-left fa-fw"></i></div>
        <div class="z-col topbarcenter">个人职位修改</div>
        <div class="topbarright"></div>
     </div>
  </div>
  
  <div class=" pad15">

   <div class="z-row loginInput">
      <div class="sfzrzitemtxt">
         个人职位：
      </div>
      <div class="z-col">
         <input type="text" placeholder="请输入" class="zInput">
      </div>
   </div>
   <div class="z-row marT15">
      <div class="z-col">
         <button class="layui-btn width100">确定</button>
      </div>
   </div>
   
  </div>
  
</div>  
</body>
</html>  