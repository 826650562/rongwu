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
					<button class="layui-btn width100">认证</button>
				</div>
			</div>


		</div>

	</div>
	<script>
		$(function() {
			var sjh = getCookie("_user");
			if (sjh) {
				$.ajax({
					url : "savePicsAndIpone", //判断是不是已发申请
					type : "post",
					contentType : "application/x-www-form-urlencoded",
					data : {
						serverIds : serverIds
					},
					success : function(code) {
						alert("上传完成2");
						var search = window.location.href;
						search = search.split("#")[1];
						//返回页面
						window.location.href = 'index#' + search + "," + encodeURIComponent("身份证照片已上传");
					},
					error : function(error) {}
				});
	
			}
	
	
	
	
			var search = window.location.href;
			search = search.split("#")[1];
			if (search) {
				search = decodeURIComponent(search);
				var searchs = search.split(",");
				if (searchs.length) {
					$("#_xm").val(searchs[0]);
					$("#_sfz").val(searchs[1]);
					$("#djscsfz").text(searchs[2]);
					$("#djscsfz").attr("sfzzp_ok", '10010');
					$('.hqyzm').unbind("click");
				}
			}
	
	
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
					alert(url);
					window.location.href = "scsfzzJsp#" + url;
				}
			});
	
	
		})
	</script>

</body>
</html>