<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>设置</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!--标准mui.css-->
<link rel="stylesheet"
	href="${basePath }/rwjr/mui-master/dist/css/mui.min.css">
<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet"
	type="text/css">
<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet"
	type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" type="text/css"
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/app.css" />
<link
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.picker.css"
	rel="stylesheet" />
<link
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.poppicker.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
<style>
.mui-table-view-cell:after {
	background-color: #fff;
}
</style>

</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">设置</h1>
	</header>
	<div class="mui-content">
		<div class="szbox">


			<div class="z-row szitem">
				<div class="xxbcltxt">手机号码</div>
				<div class="z-col sztstxt" id="user_sjh">000</div>
			</div>

			<div class="z-row szitem  mui-table-view-cell" hf="grxx_xg">
				<div class="xxbcltxt">个人信息</div>
				<div class="z-col sztstxt">立即修改</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>

			<div class="z-row szitem  mui-table-view-cell"  hf="mmsz_xg">
				<div class="xxbcltxt">登录密码设置</div>
				<div class="z-col sztstxt">立即设置</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>

			<div class="z-row szitem  mui-table-view-cell"  hf="zfmm_xg">
				<div class="xxbcltxt">支付密码设置</div>
				<div class="z-col sztstxt">立即设置</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>

			<div class="z-row marT15">
				<div class="z-col">
					<a href="#account" class="layui-btn width100">退出登录</a>
				</div>
			</div>
		</div>
	</div>
	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
	<script>
		$(function() {
			var usersjh = getCookie("USER_SHOUJIHAO");
			$("#user_sjh").text(usersjh);
			
			$(".mui-table-view-cell").click(function(){
			    var hf=$(this).attr("hf");
			    window.location.href=hf;
			});
			
		})
	</script>

</body>
</html>