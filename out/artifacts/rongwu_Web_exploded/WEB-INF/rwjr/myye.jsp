<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的余额</title>
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
<a href="${basePath }/wyqd/chongzhiJL" class="mui-pull-right czmxright">充值明细</a>
  <h1 class="mui-title">我的余额</h1>
</header>
<div class="mui-content">

<div class="wdyebox">

<div class="czjltopcont">
    <div class="z-row czjltxt">
       <div class="z-col"></div>
       <div>当前余额：<span class="wdyetoptxt">${yue}</span>元 </div>
       <div class="z-col"></div>
    </div>
</div>

</div>


<div class="wdyebtn">
<a href="${basePath }/wyqd/_cz"><button class="layui-btn width100">充值</button></a>
</div>
    
</div>
  
  
<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>

<script>
	mui.init({
		swipeBack: true
	});
</script>
</div>
</body>
</html>