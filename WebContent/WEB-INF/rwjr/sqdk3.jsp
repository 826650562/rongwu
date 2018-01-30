<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>贷款金额</title>
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
<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/app.css" />
<link
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.picker.css"
	rel="stylesheet" />
<link
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.poppicker.css"
	rel="stylesheet" />
	<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
	<script src="${basePath }/rwjr/js/common.js"></script>
<!--App自定义的css-->
<style>
.mui-control-content .mui-loading {
	margin-top: 50px;
}

html, body {
	height: 100%;
}

.mui-content {
	height: 100%;
}

.mui-slider {
	height: 100%;
}

.mui-slider-group {
	height: 100%;
}

.mui-control-content {
	height: 100%;
}

.mui-grid-view.mui-grid-9 {
	border-top: 1px solid #e6e6e6;
	border-left: 1px solid #e6e6e6;
	background-color: #fff;
}

.mui-input-group:before {
	background-color: #fff;
}

.mui-input-group:after {
	background-color: #fff;
}

.mui-input-group .mui-input-row:after {
	background-color: #fff;
}

.mui-fullscreen .mui-segmented-control ~.mui-slider-group {
	top: 45px;
}

.mui-views, .mui-view, .mui-pages, .mui-page, .mui-page-content {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	background-color: #efeff4;
}

.mui-pages {
	top: 46px;
	height: auto;
}

.mui-scroll-wrapper, .mui-scroll {
	background-color: #efeff4;
	height: 100%;
}

.mui-page.mui-transitioning {
	-webkit-transition: -webkit-transform 300ms ease;
	transition: transform 300ms ease;
}

.mui-page-left {
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.mui-navbar {
	position: fixed;
	right: 0;
	left: 0;
	z-index: 10;
	height: 44px;
	background-color: #f7f7f8;
}

.mui-navbar .mui-bar {
	position: absolute;
	background: transparent;
	text-align: center;
}

.mui-navbar .mui-btn-nav {
	-webkit-transition: none;
	transition: none;
	-webkit-transition-duration: .0s;
	transition-duration: .0s;
}

.mui-navbar .mui-bar .mui-title {
	display: inline-block;
	width: auto;
}

.mui-navbar-inner.mui-transitioning, .mui-navbar-inner .mui-transitioning
	{
	-webkit-transition: opacity 300ms ease, -webkit-transform 300ms ease;
	transition: opacity 300ms ease, transform 300ms ease;
}

.mui-page {
	display: none;
}

.mui-pages .mui-page {
	display: block;
}

.mui-btn {
	font-size: 16px;
	padding: 8px;
	margin: 3px;
}

h5.mui-content-padded {
	margin-left: 3px;
	margin-top: 20px !important;
}

h5.mui-content-padded:first-child {
	margin-top: 12px !important;
}

.ui-alert {
	text-align: center;
	padding: 20px 10px;
	font-size: 16px;
}

.mui-table-view-cell {
	border-bottom: 1px solid #e2e2e2;
	padding: 0px;
	height: 45px;
	line-height: 45px;
	cursor: pointer;
}

.ui-alert {
	text-align: right;
	padding: 0px;
	font-size: 15px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.mui-table-view-cell:after {
	background: none;
}
</style>

</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">贷款申请</h1>
	</header>
	<div class="mui-content">
		<div class="dksqaabox">



			<div class="z-row rzzqInput">
				<div class="dksqinputtxt">贷款金额</div>
				<div class="z-col">
					<input type="text" placeholder="请输入" id="dkjine" class="zInput">
				</div>
				<div class="dkdw">（万元）</div>
			</div>


			<div id='showHaveDknx' class="z-row rzzqInput mui-table-view-cell">
				<div class="dksqinputtxt">贷款期限</div>
				<div id='DknxResult' class="z-col padLR15">请选择</div>
				<div class="dkjiantou">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>


			<div class="z-row marT15">
				<div class="z-col">
					<a href="javascript:;" id="dksq_submit" class="layui-btn width100">提交申请</a>
				</div>
			</div>



		</div>
	</div>

	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
	<script
		src="${basePath }/rwjr/mui-master/examples/hello-mui/js/mui.view.js"></script>
	<script
		src="${basePath }/rwjr/mui-master/examples/hello-mui/js/feedback.js"></script>

	<script
		src="${basePath }/rwjr/mui-master/examples/hello-mui/js/mui.picker.js"></script>
	<script
		src="${basePath }/rwjr/mui-master/examples/hello-mui/js/mui.poppicker.js"></script>


	<!--<script src="mui-master/examples/hello-mui/js/city.data.js" type="text/javascript" charset="utf-8"></script>-->
	<script
		src="${basePath }/rwjr/mui-master/examples/hello-mui/js/city.data-3.js"
		type="text/javascript" charset="utf-8"></script>


	<script>
		(function($, doc) {
			$.init();
			$.ready(function() {
				/**
				 * 获取对象属性的值
				 * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
				 * @param {Object} obj 对象
				 * @param {String} param 属性名
				 */
				var _getParam = function(obj, param) {
					return obj[param] || '';
				};
	
	
				var DknxPicker = new $.PopPicker();
				DknxPicker.setData([ {
					value : 'bn',
					text : '半年'
				}, {
					value : 'yn',
					text : '1年'
				}, {
					value : 'ln',
					text : '2年'
				}, {
					value : 'enys',
					text : '其他'
				} ]);
				var DknxPickerButton = doc.getElementById('showHaveDknx');
				var DknxResult = doc.getElementById('DknxResult');
				DknxPickerButton.addEventListener('tap', function(event) {
					DknxPicker.show(function(items) {
						DknxResult.innerText = items[0].text;
					//返回 false 可以阻止选择框的关闭
					//return false;
					});
	
				}, false);
	
				//-----------------------------------------
	
			});
		})(mui, document);
	
		$("#dksq_submit").click(function() {
			var jine = $.trim($("#dkjine").val());
			var qixian = getValue($.trim($("#DknxResult").text()));
			var sjh = getCookie("sqdk_user");
			var name =getCookie("sqdk_name");
			if (jine.length <= 0) {
				_msg("请填写意向贷款金额！");
				return false;
			}
			if (qixian.length <= 0) {
				_msg("请填写意向贷款期限");
				return false;
			}
			if (sjh.length <= 0 || name.length <= 0 ) {
				window.location.href = 'index';
			}
			$.ajax({
				url : "dk_submit",
				type : "post",
				contentType : "application/x-www-form-urlencoded",
				data : {
					jine : jine,
					qixian : qixian,
					_w_sjh : sjh,
					name:name
				},
				success : function(code) {
					if (code == 'sdqk30010') {
						window.location.href = 'sqdk_list';
					}
				},
				error : function(error) {
					window.location.href = 'index';
				}
			});
	
	
	
		});
	
		function getValue(v) {
			if (v != "请选择" && v != null && v != "") {
				return v;
			} else {
				return "";
			}
		}
	</script>
</body>
</html>