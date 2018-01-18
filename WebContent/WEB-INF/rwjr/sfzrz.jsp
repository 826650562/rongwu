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
<title>融五金融-身份证认证</title>
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
				<div class="topbarleft">
					<i class="fa fa-chevron-left fa-fw"></i>
				</div>
				<div class="z-col topbarcenter">身份证认证</div>
				<div class="topbarright"></div>
			</div>
		</div>

		<div class=" pad15">


			<div class="z-row">
				<div class="z-col sfzrztssr">请输入身份证信息</div>
			</div>


			<div class="z-row loginInput">
				<div class="sfzrzitemtxt">姓名：</div>
				<div class="z-col">
					<input type="text" id="_xm" placeholder="请输入" class="zInput">
				</div>
			</div>

			<div class="z-row loginInput">
				<div class="sfzrzitemtxt">身份证：</div>
				<div class="z-col">
					<input type="text" id="_sfz" placeholder="请输入" class="zInput">
				</div>
			</div>

			<div class="z-row">
				<div class="z-col">
					<button class="layui-btn layui-btn-primary width100" id='djscsfz'>点击上传身份证照</button>
				</div>
			</div>

			<div class="z-row marT15">
				<div class="z-col">
					<button class="layui-btn width100" id="_rz">认证</button>
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
				var searchs = search.split(",");
				if (searchs.length) {
					$("#_xm").val(searchs[0]);
					$("#_sfz").val(searchs[1]);
					$("#djscsfz").html("<font color='green'>" + searchs[2] + "</font>");
					$("#djscsfz").attr("sfzzp_ok", '10010');
					dosomething();
				}
			} else {
				var sjh = getCookie("_user");
				if (sjh) {
					$.ajax({
						url : "getstatusOfsq", //判断申请状态
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
					var _xm = $.trim($("#_xm").val());
					var _sfz = $.trim($("#_sfz").val());
					var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
					if (_xm.length <= 0) {
						_msg("姓名不能为空！");
						return false;
					}
					if (_sfz.length <= 0) {
						_msg("身份证不能为空！");
						return false;
					}
					if (reg.test(_sfz) === false) {
						_msg("身份证输入不合法");
						return false;
					}
					return true;
				}
	
				$("#djscsfz").click(function() {
					if (check()) {
						var url = encodeURIComponent($.trim($("#_xm").val()) + "," + $.trim($("#_sfz").val()));
						window.location.href = "scsfzzJsp#" + url;
					}
				});
	
				$("#_rz").click(function() {
					if (!$("#djscsfz").attr("sfzzp_ok")) {
						_msg("请先上传身份证照片");return false;
					} else {
						var _xm = $.trim($("#_xm").val());
						var _sfz = $.trim($("#_sfz").val());
					    var sjh = getCookie("_user");
						if (_xm.length <= 0) {
							_msg("姓名不能为空！"); return false;
						}
						if (_sfz.length <= 0) {
							_msg("身份证号不能为空！"); return false;
						}
						$.ajax({
							url : "saveInfoForuser", //判断申请状态
							type : "post",
							contentType : "application/x-www-form-urlencoded",
							data : {
								_xm : _xm,
								_sfz : _sfz,
								_sjh : sjh
							},
							success : function(code) {
								if (code == '10071') {
									setCookie("_xm", _xm);
									setCookie("_sfz", _sfz);
									_msg("信息已提交！",function(){
								    	window.location.href = '../rwjr/sjrz';
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