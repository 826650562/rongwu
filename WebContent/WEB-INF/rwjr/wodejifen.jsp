<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的积分</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!--标准mui.css-->
<link rel="stylesheet" href="${basePath }/rwjr/mui-master/dist/css/mui.min.css">
<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet" type="text/css">
<!--App自定义的css-->
</head>
<body>
<header class="mui-bar mui-bar-nav"> 
<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">我的积分</h1>
</header>
<div class="mui-content">

<div class="wdjfbox">



<div class="wdjfitem">

<div class="z-row wdjfyecont">
   <div class="z-col"></div>
   <div>当前积分：<span class="wdyetoptxt">234</span> </div>
   <div class="z-col"></div>
</div>

<div class="jfjlcont">
    <div class="z-row czjltxt">
       <div class="z-col"> 积分：<span class="colorRed">234</span> </div>
       <div class="czjltime"> 2017-12-03 12:09:23</div>
    </div>
    <div class="z-row czjltxt">
       <div class="z-col">注册用户：<span class="colorRed">+10</span>&nbsp;积分 </div>
    </div>
</div> 
<div class="jfjlcont">
    <div class="z-row czjltxt">
       <div class="z-col">积分：&nbsp;<span class="colorRed">234</span> </div>
       <div class="czjltime"> 2017-12-03 12:09:23</div>
    </div>
    <div class="z-row czjltxt">
       <div class="z-col">抢单：&nbsp;<span class="colorRed">-100</span>&nbsp;积分 </div>
    </div>
</div>  
<div class="jfjlcont">
    <div class="z-row czjltxt">
       <div class="z-col"> 积分：&nbsp;<span class="colorRed">234</span> </div>
       <div class="czjltime"> 2017-12-03 12:09:23</div>
    </div>
    <div class="z-row czjltxt">
       <div class="z-col">抢单：&nbsp;<span class="colorRed">-100</span>&nbsp;积分 </div>
    </div>
</div>  
<div class="jfjlcont">
    <div class="z-row czjltxt">
       <div class="z-col"> 积分：&nbsp;<span class="colorRed">234</span> </div>
       <div class="czjltime"> 2017-12-03 12:09:23</div>
    </div>
    <div class="z-row czjltxt">
       <div class="z-col">抢单：&nbsp;<span class="colorRed">-100</span>&nbsp;积分 </div>
    </div>
</div>   
 
    
</div>



</div>
</div>
  
  
<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>

<script>
	mui.init({
		swipeBack: true
	});
</script>

</body>
</html>