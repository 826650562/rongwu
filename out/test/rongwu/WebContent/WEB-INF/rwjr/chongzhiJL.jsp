<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>充值记录</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!--标准mui.css-->
<link rel="stylesheet" href="${basePath }/rwjr/mui-master/dist/css/mui.min.css">
<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript"
            src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<!--App自定义的css-->
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <a href="wyqdjsp" class="  mui-icon mui-icon-left-nav mui-pull-left"></a>
    <script language="javascript">
        //防止页面后退
        history.pushState(null, null, "wyqdjsp");
    </script>
  <h1 class="mui-title">充值记录</h1>
</header>
<div class="mui-content">

<div class="czjlbox">
  
<c:forEach items="${value}" var="v">  
   <div class="czjlitem">
    <div class="z-row czjltxt">
       <div class="z-col"> 充值：<span class="colorRed">${v.jine }</span>元 </div>
       <div class="czjltime"> ${v.timeStamp }</div>
    </div>
</div>
</c:forEach>  
    
</div>
  
  
<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>

<script>
	mui.init({
		swipeBack: true
	});
    function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y+M+D+h+m+s;
    }
    $(".czjltime").each(function (index,item) {
        var s= timestampToTime(parseInt($.trim($(item).text())));
        $(item).text(s)
    })
</script>
</div>
</body>
</html>