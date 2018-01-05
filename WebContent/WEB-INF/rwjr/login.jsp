<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>融五金融</title>
<!--<link rel="icon" href="images/ico.png" type="image/x-icon">-->
<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet" type="text/css">
 
<script type="text/javascript" src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/sjrz.js"></script>

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
        <div class="z-col topbarcenter">登录</div>
        <div class="topbarright"></div>
     </div>
  </div>
  <div class="box">
    
    
    
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
  <ul class="layui-tab-title">
    <li class="layui-this">手机号登录</li>
    <li>密码登录</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
     <div class="loginbox">    
       <div class="z-row loginInput">
          <div class="loginInputXtb">
             <i class="fa fa-mobile fa-lg"></i>
          </div>
          <div class="z-col">
             <input type="text" id='_sjh' placeholder="手机号码" class="zInput">
          </div>
       </div>
       <div class="z-row loginInput">
          <div class="loginInputXtb">
             <i class="fa fa-file-photo-o fa-fw"></i>
          </div>
          <div class="z-col">
             <input type="text" placeholder="图形验证码" id="_txyzm" class="zInput">
          </div>
          <div class="tpyzm"><img class='_yzm' src="" width="80" height="35"> </div>
          <div class="tpyzmsx">
             <i class="fa fa-refresh fa-fw"></i>
          </div>
       </div>
       <div class="z-row loginInput">
          <div class="loginInputXtb">
             <i class="fa fa-commenting fa-fw"></i>
          </div>
          <div class="z-col">
             <input type="text"  id="dxyzm"  placeholder="短信验证码" class="zInput">
          </div>
          <div class="hqyzm">
             获取验证码
          </div>
       </div>
       <div class="z-row marT15">
          <div class="z-col">
             <button class="layui-btn width100" id="_login">登录</button>
          </div>
       </div>
     </div>       
    </div>
    <div class="layui-tab-item">
      <div class="loginbox">    
       <div class="z-row loginInput">
          <div class="loginInputXtb">
             <i class="fa fa-mobile fa-lg"></i>
          </div>
          <div class="z-col">
             <input type="text" placeholder="手机号码" class="zInput">
          </div>
       </div>
       <div class="z-row loginInput">
          <div class="loginInputXtb">
             <i class="fa fa-file-photo-o fa-fw"></i>
          </div>
          <div class="z-col">
             <input type="text" placeholder="图形验证码请问权威" id="_txyzm" class="zInput">
          </div>
          <div class="tpyzm"><img src="images/txyzm.jpg" width="80" height="35"> </div>
          <div class="tpyzmsx">
             <i class="fa fa-refresh fa-fw"></i>
          </div>
       </div>
       <div class="z-row loginInput">
          <div class="loginInputXtb">
             <i class="fa fa-lock fa-fw"></i>
          </div>
          <div class="z-col">
             <input type="text"   placeholder="请输入密码" class="zInput">
          </div>
       </div>
       <div class="z-row marT15">
          <div class="z-col">
             <button class="layui-btn width100" >登录</button>
          </div>
       </div>
     </div>
    </div>
  </div>
</div> 
  </div>
</div>  



<script>
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
});
</script>
</body>
</html>