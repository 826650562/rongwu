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
<title>重置密码</title>
<!--<link rel="icon" href="images/ico.png" type="image/x-icon">-->
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
<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
input[type=color], input[type=date], input[type=datetime-local], input[type=datetime],
	input[type=email], input[type=month], input[type=number], input[type=password],
	input[type=search], input[type=tel], input[type=text], input[type=time],
	input[type=url], input[type=week], select, textarea {
	line-height: 21px;
	width: 100%;
	height: 45px;
	margin-bottom: 0px;
	padding: 10px 15px;
	border: none;
	border-radius: 0px;
	background-color: #fff;
}
</style>
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
				<div class="topbarleft">
					<i class="fa fa-chevron-left fa-fw"></i>
				</div>
				<div class="z-col topbarcenter">支付密码设置</div>
				<div class="topbarright"></div>
			</div>
		</div>
		<div class="box">



			<div class="loginbox">
				<div class="z-row loginInput">
					<div class="loginInputXtb">
						<i class="fa fa-mobile fa-lg"></i>
					</div>
					<div class="z-col">
						<input type="text" value="" id="user_sjh" disabled="disabled"
							placeholder="手机号码" class="zInput">
					</div>
				</div>
				<div class="z-row loginInput">
					<div class="loginInputXtb">
						<i class="fa fa-file-photo-o fa-fw"></i>
					</div>
					<div class="z-col">
						<input type="text" placeholder="图形验证码" class="zInput">
					</div>
					<div class="tpyzm">
						<img class="getyzm" src="" width="80" height="35">
					</div>
					<div class="tpyzmsx">
						<i class="fa fa-refresh fa-fw"></i>
					</div>
				</div>
				<div class="z-row loginInput">
					<div class="loginInputXtb">
						<i class="fa fa-commenting fa-fw"></i>
					</div>
					<div class="z-col">
						<input type="text" placeholder="短信验证码" class="zInput">
					</div>
					<div class="hqyzm mui-table-view-cell">获取验证码</div>
				</div>
				<div class="z-row loginInput">
					<div class="loginInputXtb">
						<i class="fa fa-unlock-alt fa-fw"></i>
					</div>
					<div class="z-col">
						<input type="text" placeholder="请输入新密码" class="zInput">
					</div>
				</div>
				<div class="z-row marT15">
					<div class="z-col">
						<button class="layui-btn width100">确定</button>
					</div>
				</div>
			</div>

		</div>
	</div>


	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>

	<script>
		mui.init({
			swipeBack : true
		});
	
		$(function() {
			var usersjh = getCookie("USER_SHOUJIHAO");
			$("#user_sjh").val(usersjh);
			function getYzm() {
				$(".getyzm").attr("src", '../rwjr/yzm');
				$('.tpyzmsx').click(function() {
					$(".getyzm").attr("src", '../rwjr/yzm?time=' + new Date().getTime());
				});
			}
			getYzm(); //验证码 
		})
	</script>



</body>
</html>