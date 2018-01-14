<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>融五金融</title>
<!--<link rel="icon" href="images/ico.png" type="image/x-icon">-->
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
				<div class="topbarleft">
					<i class="fa fa-chevron-left fa-fw"></i>
				</div>
				<div class="z-col topbarcenter">信贷经理工作认证</div>
				<div class="topbarright"></div>
			</div>
		</div>

		<div class=" pad15">
			<div class="z-row loginInput">
				<div class="sfzrzitemtxt">公司名称：</div>
				<div class="z-col">
					<input type="text" id="_gsmc" placeholder="请输入" class="zInput">
				</div>
			</div>
			<div class="z-row loginInput">
				<div class="sfzrzitemtxt">个人职位：</div>
				<div class="z-col">
					<input type="text" id="_grzw" placeholder="请输入" class="zInput">
				</div>
			</div>
			<div class="z-row loginInput">
				<div class="sfzrzitemtxt">所在城市：</div>
				<div class="z-col">
					<input type="text" id="_city" placeholder="请输入" class="zInput">
				</div>
			</div>
			<div class="z-row">
				<div class="z-col">
					<button class="layui-btn layui-btn-primary width100" id="scgzz">上传手持工作证照</button>
				</div>
			</div>
			<div class="z-row marT15">
				<div class="z-col">
					<button class="layui-btn width100" id="mysubmit">提交审核</button>
				</div>
			</div>
		</div>

	</div>
	<script>
		$(function() {
			var search = window.location.href;
			search = search.split("#")[1];
			if (search) {
				search = decodeURIComponent(search);
				if (search) {
					$("#_gsmc").val(getCookie("_gsmc"));
					$("#_grzw").val(getCookie("_grzw"));
					$("#scgzz").html("<font color='green'>" + search + "</font>");
					$("#scgzz").attr("sfzzp_ok", '10010');
					dosomething();
				}
			} else {
				var sjh = getCookie("_user");
				if (sjh) {
					$.ajax({
						url : "getstatusOfsqgzz", //判断申请状态
						type : "post",
						contentType : "application/x-www-form-urlencoded",
						data : {
							_sfrzsjh : sjh
						},
						success : function(code) {
							var _xm = getCookie("_xm") || "请输入名字";
							var _sfz = getCookie("_sfz") || "请输入身份证号";
							if (code == "10703") {
								dosomething();
							} else if (code == "10700") {
								$("#_xm").attr("placeholder", _xm);
								$("#_sfz").attr("placeholder", _sfz);
								$("#_xm").attr('disabled', "disabled");
								$("#_sfz").attr('disabled', "disabled");
								$("#djscsfz").attr('disabled', "disabled");
								$("#djscsfz").unbind("click");
								$(".sfzrztssr").text("身份证信息");
								$("#djscsfz").html("<font color='green'>身份信息已上传，审核中</font>");
								$("#_rz").fadeOut();
							} else if (code == "10701") {
								$("#_xm").attr("placeholder", _xm);
								$("#_sfz").attr("placeholder", _sfz);
								$("#_xm").attr('disabled', "disabled");
								$("#_sfz").attr('disabled', "disabled");
								$("#djscsfz").attr('disabled', "disabled");
								$("#djscsfz").unbind("click");
								$("#djscsfz").html("<font color='green'>审核通过</font>");
								$("#_rz").fadeOut();
							} else {
								$("#_xm").attr("placeholder", "请输入");
								$("#_sfz").attr("placeholder", "请输入");
								$("#djscsfz").html("<font color='red'>审核不通过，请检查后上传</font>");
								$("#_rz").fadeIn();
								dosomething();
							}
						},
						error : function(error) {}
					});
				}
			}
	
			function dosomething() {
				function check() {
					var _gsmc = $.trim($("#_gsmc").val());
					var _grzw = $.trim($("#_grzw").val());
					var _city = $.trim($("#	_city").val());
	
					if (_gsmc.length <= 0) {
						_msg("公司名称不能为空！");
						return false;
					}
					if (_grzw.length <= 0) {
						_msg("个人职位不能为空！");
						return false;
					}
					if (_city.length <= 0) {
						_msg("所在城市不能为空！");
						return false;
					}
					return true;
				}
	
				$("#scgzz").click(function() {
					if (check()) {
						setCookie("_gsmc", _gsmc);
						setCookie("_grzw", _grzw);
						setCookie("_city", _city);
						window.location.href = "scsfzzJsp";
					}
				});
	
				$("#mysubmit").click(function() {
					if (!$("#scgzz").attr("sfzzp_ok")) {
						_msg("请先上传工作证照片");return false;
					} else if (check()) {
						var sjh = getCookie("_user");
						var _gsmc = $.trim($("#_gsmc").val());
						var _grzw = $.trim($("#_grzw").val());
						var _city = $.trim($("#	_city").val());
						$.ajax({
							url : "saveInfoForuser", //判断申请状态
							type : "post",
							contentType : "application/x-www-form-urlencoded",
							data : {
								_gsmc : _gsmc,
								_grzw : _grzw,
								_city:_city,
								_sjh : sjh
							},
							success : function(code) {
								if (code == '10071') {
									alert("信息已提交！");
									setCookie("_xm", _xm);
									setCookie("_sfz", _sfz);
									window.location.href = '../rwjr/sjrz';
								}
							},
							error : function(error) {
								_msg("系统错误！");
							}
						});
					}
				});
	
			}
	
		})
	</script>
</body>
</html>