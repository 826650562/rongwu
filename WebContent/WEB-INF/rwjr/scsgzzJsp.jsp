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
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/zgrz2.js"></script>

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
        <div class="z-col topbarcenter">工作认证</div>
        <div class="topbarright"></div>
     </div>
  </div>
  
  <div class=" pad15">
       <div class="z-row scsfzcont">
          <div class="z-col scsfzzimg"><img src="${basePath }/rwjr/images/scsfzz.jpg"> </div>
       </div>
       
       <div class="z-row scsfzztishi">
          <div class="z-col">
             <div class="z-row">
                 <div class="z-col">
                  （1）请确保拍摄的身份证信息清晰并真实有效
                 </div>
             </div>
             <div class="z-row">
                 <div class="z-col">
                  （2）若发现证件信息非本人，将导致无法办理业务
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
             <button class="layui-btn width100" id="gzzj_upload">保存</button>
          </div>
       </div>
  </div>
  
</div>  
</body>
</html>