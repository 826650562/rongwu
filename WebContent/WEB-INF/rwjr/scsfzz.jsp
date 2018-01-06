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
        <div class="z-col topbarcenter">上传身份证照</div>
        <div class="topbarright"></div>
     </div>
  </div>
  
  <div class=" pad15">
    
    
       <div class="z-row">
          <div class="z-col">
             <div class="z-row">
               <div class="z-col sfzzimg">
                  <img src="images/sfzzm.png"> 
               </div>
             </div>
             <div class="z-row">
               <div class="z-col pszptxt">
                  请拍摄身份证正面照   
               </div>
             </div>
          </div>
          <div class="sfzzblank"></div>
          <div class="z-col">
             <div class="z-row">
               <div class="z-col sfzzimg">
                  <img src="images/sfzfm.png"> 
               </div>
             </div>
             <div class="z-row">
               <div class="z-col pszptxt">
                  请拍摄身份证反面照   
               </div>
             </div>
          </div>
       </div>
       
       <div class="z-row padT15">
          <div class="z-col">
             <div class="z-row">
               <div class="z-col sfzzimg">
                  <img src="images/scsfzz.png"> 
               </div>
             </div>
             <div class="z-row">
               <div class="z-col pszptxt">
                  请拍摄个人清晰头像   
               </div>
             </div>
          </div>
          <div class="sfzzblank"></div>
          <div class="z-col"> </div>
       </div>
       
       
       <div class="z-row padT15 scsfzztishi">
          <div class="z-col">
             <div class="z-row">
                 <div class="z-col">
                  <strong class="scsfzztitle">温馨提示</strong>
                 </div>
             </div>
             <div class="z-row">
                 <div class="z-col">
                  （1）请确保拍摄的身份证信息清晰并真实有效
                 </div>
             </div>
             <div class="z-row">
                 <div class="z-col">
                  （2）若发现身份证信息非本人，将导致无法办理业务
                 </div>
             </div>
             <div class="z-row">
                 <div class="z-col">
                  （3）如有任何疑问，请拨打客服热线：1234234
                 </div>
             </div>
             <div class="z-row">
                 <div class="z-col">
                  （4）工作日9：00-18：00
                 </div>
             </div>
          </div>
       </div>

   
       
       
      
       
       <div class="z-row marT15">
          <div class="z-col">
             <button class="layui-btn width100">保存</button>
          </div>
       </div>
      

    

    
    
    
  </div>
  
</div>  


</body>
</html>