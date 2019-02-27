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

<link rel="stylesheet" href="${basePath }/rwjr/mui-master/dist/css/mui.min.css">

<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet"
	type="text/css">
<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet"
	type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet"
	type="text/css">
	
<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/sjrz.js"></script>
<style>
.zInput{width:100%;font-family: 'microsoft yahei', Arial, Helvetica, sans-serif; font-size:14px; 
height:45px !important;border:none !important;
 border-top-right-radius:4px !important; 
border-bottom-right-radius:4px !important; margin:0px !important; padding-left:0px !important;}
.mui-input-row {
	height: 40px;
}
.mui-input-group:before{    background-color: #f6f6f6;}
.mui-input-group:after{    background-color: #f6f6f6;}
.mui-input-group{ background:none;}

.mui-checkbox, .mui-radio {
	position: relative;
}

#_sq_tyjr {
	position: absolute;
	top: 4px;
	right: 20px;
	display: inline-block;
	width: 28px;
	height: 26px;
	border: 0;
	outline: 0 !important;
	background-color: transparent;
	-webkit-appearance: none;
}

#_sq_tyjr:checked:before {
	content: '\e442';
}

#_sq_tyjr:checked:before {
	color: #fc4023;
}

#_sq_tyjr:before {
	content: '\e411';
}
#_sq_tyjr:after {
    background-color: #fff;
}
#_sq_tyjr:after {
    position: absolute;
    right: 0;
    bottom: 0;
    left: 15px;
    height: 1px;
    content: '';
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5);
    background-color: #c8c7cc;
}
#_sq_tyjr:before
	{
	font-family: Muiicons;
	font-size: 28px;
	font-weight: 400;
	line-height: 1;
	text-decoration: none;
	color: #aaa;
	border-radius: 0;
	background: 0 0;
	-webkit-font-smoothing: antialiased;
}

</style>
</head>
<body>




	<div class="main">
		<div class="topbar">
			<div class="z-row">
				<div class="topbarleft">
					<i class="fa fa-chevron-left fa-fw"></i>
				</div>
				<div class="z-col topbarcenter">登录</div>
				<div class="topbarright"></div>
			</div>
		</div>
		<div class="box">



			<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				<ul class="layui-tab-title">
					<li class="layui-this">手机号登录</li>
				<%--	<li>密码登录</li>--%>
				</ul>
				<div class="layui-tab-content">  
					<div class="layui-tab-item layui-show">
						<div class="loginbox">
							<div class="z-row loginInput">
								<div class="loginInputXtb">
									<i class="fa fa-mobile fa-lg"></i>
								</div>
								<div class="z-col">
									<input type="text" id='_sjh'   placeholder="手机号码" class="zInput">
								</div>
							</div>
							<div class="z-row loginInput">
								<div class="loginInputXtb">
									<i class="fa fa-file-photo-o fa-fw"></i>
								</div>
								<div class="z-col">
									<input type="text" placeholder="图形验证码" id="_txyzm"
										class="zInput">
								</div>
								<div class="tpyzm">
									<img class='_yzm' src="" width="80" height="35">
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
									<input type="text" id="dxyzm" placeholder="短信验证码"
										class="zInput">
								</div>
								<div class="hqyzm">获取验证码</div>
							</div>
							<div class="z-row">
								<div class="z-col">
									<form class="mui-input-group">
										<div class="mui-input-row mui-checkbox mui-left">
											<a class="tytk" href="${basePath }/sqdk/tk">同意融五金融《服务协议》</a>
											<input name="checkbox" checked="checked" value="Item 1"
												id="_sq_tyjr" type="checkbox" style="left: 0px;">
										</div>
									</form>
								</div>
							</div>
							<div class="z-row marT15">
								<div class="z-col">
									<button class="layui-btn width100" id="_login">进入系统</button>
								</div>
							</div>
						</div>
					</div>
				<%--
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
									<input type="text" placeholder="图形验证码" id="_txyzm"
										class="zInput">
								</div>
								<div class="tpyzm">
									<img src="" width="80" height="35">
								</div>
								<div class="tpyzmsx">
									<i class="fa fa-refresh fa-fw"></i>
								</div>
							</div>
							<div class="z-row loginInput">
								<div class="loginInputXtb">
									<i class="fa fa-lock fa-fw"></i>
								</div>
								<div class="z-col">
									<input type="text" placeholder="请输入密码" class="zInput">
								</div>
							</div>
							<div class="z-row marT15">
								<div class="z-col">
									<button class="layui-btn width100">登录</button>
								</div>
							</div>
						</div>
					</div>
					--%>

				</div>
			</div>
		</div>
	</div>



	<script>
		layui.use('element', function() {
			var $ = layui.jquery,
				element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
		});
	</script>
</body>
</html>