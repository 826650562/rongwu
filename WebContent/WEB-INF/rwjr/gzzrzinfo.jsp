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
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>


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
		    var sjh = "${auto_login_user}".split("_")[1];
			if (!$.trim($("#_city").val())) {
				$.ajax({
					url : "scPics",
					type : "post",
					contentType : "application/x-www-form-urlencoded",
					data : {
						url : "http://www.80wangjian.com/springmvc/gzyz/index"
					},
					success : function(data) {
						var res = JSON.parse(data)[0];
						wx.config({
							debug : false,
							appId : 'wxc3691f09dbfd769d',
							timestamp : res.timestamp,
							nonceStr : res.noncestr,
							signature : res.signature,
							jsApiList : [ 'chooseImage', 'uploadImage', 'downloadImage',
								'previewImage', 'openLocation', 'getLocation',
								'scanQRCode', 'checkJsApi', 'onMenuShareTimeline',
								'onMenuShareAppMessage', 'onMenuShareQQ',
								'onMenuShareWeibo', 'onMenuShareQZone' ]
						});
						wx.ready(function() {
							wx.getLocation({
								type : 'gcj02',
								success : function(res) {
									var longitude = res.longitude
									var latitude = res.latitude
									var latLng = new qq.maps.LatLng(latitude, longitude);
									//调用获取位置方法
									geocoder = new qq.maps.Geocoder({
										complete : function(result) {
											$("#_city").val(result.detail.address)
										}
									});
									geocoder.getAddress(latLng);
								}
							})
						})
	
					}
				})
			}
	
	
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
				var _gsmc = getCookie("_gsmc")
				var _grzw = getCookie("_grzw")
				var _city = getCookie("_city")
				if (sjh) {
					$.ajax({
						url : "getstatusOfsqgzz", //判断申请状态
						type : "post",
						contentType : "application/x-www-form-urlencoded",
						data : {
							_sfrzsjh : sjh
						},
						success : function(code) {
							if (code == "10703") {
								dosomething();
							} else if (code == "10700") {
								$("#_gsmc").attr("placeholder", _gsmc);
								$("#_grzw").attr("placeholder", _grzw);
								$("#_city").attr("placeholder", _city);
								
								$("#_gsmc").attr('disabled', "disabled");
								$("#_grzw").attr('disabled', "disabled");
								$("#_city").attr('disabled', "disabled");
								$("#scgzz").attr('disabled', "disabled");
								
								$("#scgzz").unbind("click");
								$(".sfzrztssr").text("身份证信息");
								$("#scgzz").html("<font color='green'>身份信息已上传，审核中</font>");
								$("#mysubmit").fadeOut();
							} else if (code == "10701") {
									$("#_gsmc").attr("placeholder", _gsmc);
								$("#_grzw").attr("placeholder", _grzw);
								$("#_city").attr("placeholder", _city);
								
								$("#_gsmc").attr('disabled', "disabled");
								$("#_grzw").attr('disabled', "disabled");
								$("#_city").attr('disabled', "disabled");
								$("#scgzz").attr('disabled', "disabled");
								
								$("#scgzz").unbind("click");
								$(".sfzrztssr").text("身份证信息");
								$("#scgzz").html("<font color='green'>审核通过</font>");
								$("#mysubmit").fadeOut();
							} else {
								$("#_gsmc").attr("placeholder", "请输入");
								$("#_grzw").attr("placeholder", "请输入");
								$("#_city").attr("placeholder", "请输入");
								
								$("#scgzz").html("<font color='red'>审核不通过，请检查后上传</font>");
								$("#mysubmit").fadeIn();
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
					var _city = $.trim($("#_city").val());
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
					setCookie("_gsmc", _gsmc);
					setCookie("_grzw", _grzw);
					setCookie("_city", _city);
					return true;
				}
	
				$("#scgzz").click(function() {
					if (check()) {
						window.location.href = "scsgzzJsp";
					}
				});
	
				$("#mysubmit").click(function() {
					if (!$("#scgzz").attr("sfzzp_ok")) {
						_msg("请先上传工作证照片");return false;
					} else if (check()) {
						var _gsmc = $.trim($("#_gsmc").val());
						var _grzw = $.trim($("#_grzw").val());
						var _city = $.trim($("#_city").val());
						$.ajax({
							url : "saveInfoForuser", //判断申请状态
							type : "post",
							contentType : "application/x-www-form-urlencoded",
							data : {
								_gsmc : _gsmc,
								_grzw : _grzw,
								_city : _city,
								_sjh : sjh
							},
							success : function(code) {
								if (code == '10071') {
									_msg("信息已提交！",function(){
										window.location.href = '/springmvc/rwjr/sjrz';
									});
								
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