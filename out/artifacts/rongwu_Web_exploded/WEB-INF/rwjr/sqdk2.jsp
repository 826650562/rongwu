<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>申请贷款</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<!--标准mui.css-->
<link rel="stylesheet"
	href="${basePath }/rwjr/mui-master/dist/css/mui.min.css">
<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet"
	type="text/css">
<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/app.css" />
<link
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.picker.css"
	rel="stylesheet" />
<link
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.poppicker.css"
	rel="stylesheet" />

<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet"
	type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet"
	type="text/css">
<!--App自定义的css-->
<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<script src="${basePath }/rwjr/js/dksq.js"></script>
<script src="${basePath }/rwjr/js/common.js"></script>
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

<body class="mui-fullscreen">
	<div id="account" class="mui-page">
		<div class="mui-navbar-inner mui-bar mui-bar-nav">
			<button type="button"
				class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
				<span href="javascript:history.back()"
					class="mui-icon mui-icon-left-nav"></span>
			</button>
			<h1 class="mui-center mui-title">贷款申请</h1>
		</div>
		<div class="mui-page-content">
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll"
					style="overflow-y: scroll;overflow-x: hidden;">


					<div class="dksqtishi">温馨提示：填写的资料越全越容易通过审核！</div>

					<div class="xxbcbox">

						<!--城市三级联动start-->
						<div id='showCityPicker3' class="mui-table-view-cell">
							<div class="z-row">
								<div class="xxbcltxt">所在城市</div>
								<div class="z-col ui-alert" id='cityResult3'>请选择</div>
								<div class="xxbcrjt">
									<i class="fa fa-angle-right fa-lg"></i>
								</div>
							</div>
						</div>
						<!--城市三级联动end-->
						<!-- 	<div class="dktxtinput">
							<div class="z-row">
								<div class="xxbcltxt">
									贷款金额<span>(0.1-1000万元)</span>
								</div>
								<div class="z-col">
									<input id="_sq_dkjine" placeholder="请填写" type="text" />
								</div>
								<div>万元</div>
							</div>
						</div> -->

						<div id='showUserPicker' class="mui-table-view-cell">
							<div class="z-row">
								<div class="xxbcltxt">职业身份</div>
								<div class="z-col ui-alert" id='userResult'>请选择</div>
								<div class="xxbcrjt">
									<i class="fa fa-angle-right fa-lg"></i>
								</div>
							</div>
						</div>

						<div id='showHaveHouse' class="mui-table-view-cell">
							<div class="z-row">
								<div class="xxbcltxt">名下是否有房</div>
								<div class="z-col ui-alert" id='haveHouseResult'>请选择</div>
								<div class="xxbcrjt">
									<i class="fa fa-angle-right fa-lg"></i>
								</div>
							</div>
						</div>

						<div id='showHaveCar' class="mui-table-view-cell">
							<div class="z-row">
								<div class="xxbcltxt">名下是否有车</div>
								<div class="z-col ui-alert" id='haveCarResult'>请选择</div>
								<div class="xxbcrjt">
									<i class="fa fa-angle-right fa-lg"></i>
								</div>
							</div>
						</div>

						<div id='showHaveSb' class="mui-table-view-cell">
							<div class="z-row">
								<div class="xxbcltxt">是否有本地社保</div>
								<div class="z-col ui-alert" id='haveSbResult'>请选择</div>
								<div class="xxbcrjt">
									<i class="fa fa-angle-right fa-lg"></i>
								</div>
							</div>
						</div>

						<div id='showHaveGjj' class="mui-table-view-cell">
							<div class="z-row">
								<div class="xxbcltxt">有无公积金</div>
								<div class="z-col ui-alert" id='haveGjjResult'>请选择</div>
								<div class="xxbcrjt">
									<i class="fa fa-angle-right fa-lg"></i>
								</div>
							</div>
						</div>

						<div id='showHaveXyqk' class="mui-table-view-cell">
							<div class="z-row">
								<div class="xxbcltxt">信用情况</div>
								<div class="z-col ui-alert" id='haveXyqkResult'>请选择</div>
								<div class="xxbcrjt">
									<i class="fa fa-angle-right fa-lg"></i>
								</div>
							</div>
						</div>

						<div class="dktxtinput">
							<div class="z-row">
								<div class="xxbcltxt">
									芝麻信用<span>（选填）</span>
								</div>
								<div class="z-col">
									<input placeholder="请填写" type="text" />
								</div>
								<div>分</div>
							</div>
						</div>


						<div class="dktxtinput">
							<div class="z-row">
								<div class="xxbcltxt">
									微粒贷额度<span>（选填）</span>
								</div>
								<div class="z-col">
									<input placeholder="请填写" type="text" />
								</div>
								<div>万元</div>
							</div>
						</div>


						<div id='showHaveYwrsbx' class="mui-table-view-cell">
							<div class="z-row">
								<div class="xxbcltxt">有无人寿保险</div>
								<div class="z-col ui-alert" id='haveYwrsbxResult'>请选择</div>
								<div class="xxbcrjt">
									<i class="fa fa-angle-right fa-lg"></i>
								</div>
							</div>
						</div>

						<div id='showHaveZgxl' class="mui-table-view-cell">
							<div class="z-row">
								<div class="xxbcltxt">最高学历</div>
								<div class="z-col ui-alert" id='haveZgxlResult'>请选择</div>
								<div class="xxbcrjt">
									<i class="fa fa-angle-right fa-lg"></i>
								</div>
							</div>
						</div>


						<div class="dktxtinput">
							<div class="z-row">
								<div class="xxbcltxt">身份证号码</div>
								<div class="z-col">
									<input placeholder="请填写" id="_sq_sfz" type="text" />
								</div>
							</div>
						</div>

					</div>

					<div class="dksqts">资料越完整申请成功概率越大，我们也将严格保密您的资料！</div>


					<div class="dktjsh">

						<div class="z-row marT15">
							<div class="z-col">
								<a href="#" class="layui-btn dktjshbtn">下一步</a>
							</div>
						</div>

					</div>


				</div>
			</div>
		</div>
	</div>

</body>

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
			///////////////////////////////////////////////////职业身份
			var userPicker = new $.PopPicker();
			userPicker.setData([ {
				value : 'sbz',
				text : '上班族'
			}, {
				value : 'gth',
				text : '个体户'
			}, {
				value : 'qyz',
				text : '企业主'
			}, {
				value : 'xs',
				text : '学生'
			}, {
				value : 'wgdzy',
				text : '无固定职业'
			} ]);
			var showUserPickerButton = doc.getElementById('showUserPicker');
			var userResult = doc.getElementById('userResult');
			showUserPickerButton.addEventListener('tap', function(event) {
				userPicker.show(function(items) {
					userResult.innerText = items[0].text;
				//return false;
				});

			}, false);
			///////////////////////////////////////////////////名下是否有房
			var haveHousePicker = new $.PopPicker();
			haveHousePicker.setData([ {
				value : 'spfydk',
				text : '商品房，有贷款'
			}, {
				value : 'spfwdk',
				text : '商品房，无贷款'
			}, {
				value : 'flf',
				text : '福利房'
			}, {
				value : 'jcf',
				text : '军产房'
			}, {
				value : 'bgl',
				text : '办公楼'
			}, {
				value : 'sp',
				text : '商铺'
			}, {
				value : 'cf',
				text : '厂房'
			}, {
				value : 'qtfc',
				text : '其他房产'
			}, {
				value : 'wfc',
				text : '无房产'
			} ]);
			var showHousePickerButton = doc.getElementById('showHaveHouse');
			var haveHouseResult = doc.getElementById('haveHouseResult');
			showHousePickerButton.addEventListener('tap', function(event) {
				haveHousePicker.show(function(items) {
					haveHouseResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				});

			}, false);
			///////////////////////////////////////////////////名下是否有车
			var haveCarPicker = new $.PopPicker();
			haveCarPicker.setData([ {
				value : 'wc',
				text : '无车'
			}, {
				value : 'qtc',
				text : '其他车'
			}, {
				value : 'dkc',
				text : '贷款车'
			}, {
				value : 'qkc',
				text : '全款车'
			} ]);
			var showCarPickerButton = doc.getElementById('showHaveCar');
			var haveCarResult = doc.getElementById('haveCarResult');
			showCarPickerButton.addEventListener('tap', function(event) {
				haveCarPicker.show(function(items) {
					haveCarResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				});

			}, false);
			///////////////////////////////////////////////////有无本地社保
			var haveSbPicker = new $.PopPicker();
			haveSbPicker.setData([ {
				value : 'ysb',
				text : '有社保'
			}, {
				value : 'wsb',
				text : '无社保'
			} ]);
			var showSbPickerButton = doc.getElementById('showHaveSb');
			var haveSbResult = doc.getElementById('haveSbResult');

			showSbPickerButton.addEventListener('tap', function(event) {
				haveSbPicker.show(function(items) {
					haveSbResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				});

			}, false);
			///////////////////////////////////////////////////有无公积金
			var haveGjjPicker = new $.PopPicker();
			haveGjjPicker.setData([ {
				value : 'ygjj',
				text : '有公积金'
			}, {
				value : 'wgjj',
				text : '无公积金'
			} ]);
			var showGjjPickerButton = doc.getElementById('showHaveGjj');
			var haveGjjResult = doc.getElementById('haveGjjResult');
			showGjjPickerButton.addEventListener('tap', function(event) {
				haveGjjPicker.show(function(items) {
					haveGjjResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				});

			}, false);
			///////////////////////////////////////////////////信用情况
			var haveXyqkPicker = new $.PopPicker();
			haveXyqkPicker.setData([ {
				value : 'xylh',
				text : '信用良好'
			}, {
				value : 'wxykhdk',
				text : '无信用卡或贷款'
			}, {
				value : 'ygyq',
				text : '有过逾期'
			} ]);
			var showXyqkPickerButton = doc.getElementById('showHaveXyqk');
			var haveXyqkResult = doc.getElementById('haveXyqkResult');
			showXyqkPickerButton.addEventListener('tap', function(event) {
				haveXyqkPicker.show(function(items) {
					haveXyqkResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				});

			}, false);
			///////////////////////////////////////////////////有无人寿保险
			var haveYwrsbxPicker = new $.PopPicker();
			haveYwrsbxPicker.setData([ {
				value : 'ybx',
				text : '有保险'
			}, {
				value : 'wbx',
				text : '无保险'
			} ]);
			var showYwrsbxPickerButton = doc.getElementById('showHaveYwrsbx');
			var haveYwrsbxResult = doc.getElementById('haveYwrsbxResult');
			showYwrsbxPickerButton.addEventListener('tap', function(event) {
				haveYwrsbxPicker.show(function(items) {
					haveYwrsbxResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				});

			}, false);
			///////////////////////////////////////////////////最高学历
			var haveZgxlPicker = new $.PopPicker();
			haveZgxlPicker.setData([ {
				value : 'gzjqyx',
				text : '高中及其以下'
			}, {
				value : 'dz',
				text : '大专'
			}, {
				value : 'bk',
				text : '本科'
			}, {
				value : 'yjsjys',
				text : '研究生及以上'
			} ]);
			var showZgxlPickerButton = doc.getElementById('showHaveZgxl');
			var haveZgxlResult = doc.getElementById('haveZgxlResult');
			showZgxlPickerButton.addEventListener('tap', function(event) {
				haveZgxlPicker.show(function(items) {
					haveZgxlResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				});

			}, false);

			//-----------------------------------------
			//					三级联动示例
			var cityPicker3 = new $.PopPicker({
				layer : 3
			});
			cityPicker3.setData(cityData3);
			var showCityPickerButton = doc.getElementById('showCityPicker3');
			var cityResult3 = doc.getElementById('cityResult3');
			showCityPickerButton.addEventListener('tap', function(event) {
				cityPicker3.show(function(items) {
					//cityResult3.innerText = "你选择的城市是:" + _getParam(items[0], 'text') + " " + _getParam(items[1], 'text') + " " + _getParam(items[2], 'text');
					cityResult3.innerText = _getParam(items[0], 'text') + " " + _getParam(items[1], 'text');
				//返回 false 可以阻止选择框的关闭
				//return false;
				});
			}, false);
		});
	})(mui, document);
</script>
<script>
	function checkout(cityResult3, userResult, haveHouseResult, haveCarResult, haveSbResult, haveGjjResult
		, haveXyqkResult, sq_zm, sq_wld, haveYwrsbxResult, haveZgxlResult, _sq_sfz) {
		if (cityResult3.length <= 0) {
			_msg("请选择所在城市！");return false;
		}
		if (userResult.length <= 0) {
			_msg("请选择职业！");return false;
		}

		if (haveHouseResult.length <= 0) {
			_msg("请选择房产状态！");return false;
		}

		if (haveCarResult.length <= 0) {
			_msg("请选择车辆状态！");return false;
		}

		if (haveSbResult.length <= 0) {
			_msg("请填写社保状态！");return false;
		}

		if (haveGjjResult.length <= 0) {
			_msg("请填写公积金状态！");return false;
		}

		if (haveXyqkResult.length <= 0) {
			_msg("请选择信用情况！");return false;
		}

		if (haveYwrsbxResult.length <= 0) {
			_msg("请选择保险！");return false;
		}

		if (haveZgxlResult.length <= 0) {
			_msg("请选择学历！");return false;
		}
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if (_sq_sfz.length <= 0 || reg.test(_sq_sfz) === false) {
			_msg("请输入正确的身份证号码！");return false;
		}
		return true;
	}
	function getValue(v) {
		if (v != "请选择" && v != null && v != "") {
			return v;
		} else {
			return "";
		}
	}
	$(".dktjshbtn").click(function() {
		var cityResult3 = getValue($.trim($("#cityResult3").text()));
		//var _sq_dkjine = getValue($.trim($("#_sq_dkjine").val()));
		var userResult = getValue($.trim($("#userResult").text()));
		var haveHouseResult = getValue($.trim($("#haveHouseResult").text()));
		var haveCarResult = getValue($.trim($("#haveCarResult").text()));
		var haveSbResult = getValue($.trim($("#haveSbResult").text()));
		var haveGjjResult = getValue($.trim($("#haveGjjResult").text()));
		var haveXyqkResult = getValue($.trim($("#haveXyqkResult").text()));
		var sq_zm = getValue($.trim($("#_sq_zm").val()));
		var sq_wld = getValue($.trim($("#_sq_wld").val()));
		var haveYwrsbxResult = getValue($.trim($("#haveYwrsbxResult").text()));
		var haveZgxlResult = getValue($.trim($("#haveZgxlResult").text()));
		var _sq_sfz = getValue($.trim($("#_sq_sfz").val()));

		if (checkout(cityResult3, userResult, haveHouseResult, haveCarResult, haveSbResult, haveGjjResult
				, haveXyqkResult, sq_zm, sq_wld, haveYwrsbxResult, haveZgxlResult, _sq_sfz)) {
			var data = {
				cityResult3 : cityResult3,
				userResult : userResult,
				haveHouseResult : haveHouseResult,
				haveCarResult : haveCarResult,
				haveSbResult : haveSbResult,
				haveGjjResult : haveGjjResult,
				haveXyqkResult : haveXyqkResult,
				haveYwrsbxResult : haveYwrsbxResult,
				sq_zm : sq_zm,
				sq_wld : sq_wld,
				haveZgxlResult : haveZgxlResult,
				_sq_sfz : _sq_sfz,
				_w_sjh : getCookie("sqdk_user"),
				_name_sq : getCookie("sqdk_name")
			};
			$.ajax({
				url : "sigin",
				type : "post",
				contentType : "application/x-www-form-urlencoded",
				data : data,
				success : function(code) {
					if (code == 'sdqk10010') {
						window.location.href='sqdk3'; 
					}
				},
				error : function(error) {
					 window.location.href='index';
				}
			});
		}
	});
</script>

<!------------------MUI 选项卡 js----------------------->
</html>