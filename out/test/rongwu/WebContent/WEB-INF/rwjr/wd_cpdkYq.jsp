<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>贷款要求</title>
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

<style>
.mui-card .mui-table-view .mui-table-view-cell:last-child, .mui-card .mui-table-view .mui-table-view-divider:last-child
	{
	border-radius: 2px;
}

.mui-card .mui-table-view .mui-table-view-cell:first-child, .mui-card .mui-table-view .mui-table-view-divider:first-child
	{
	border-radius: 2px;
}

.mui-table-view-cell:after {
	background-color: #e6e6e6;
	left: 0px;
}

.mui-input-group .mui-input-row:after {
	left: 0px;
}

.mui-checkbox.mui-left label, .mui-radio.mui-left label {
	padding-left: 50px;
}

.mui-input-group:before {
	background-color: #f6f6f6;
}

.mui-input-group:after {
	background-color: #f6f6f6;
}

.mui-input-group {
	background: #f6f6f6;
}

.mui-table-view-cell.mui-collapse .mui-collapse-content {
	padding: 10px 15px 0px 15px;
}

.mui-input-group input {
	border: 1px solid #e6e6e6;
}

.mui-card {
	margin: 10px 15px 0px 15px;
}
</style>

</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a href="grcp_wd" class="  mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">所需材料</h1>
	</header>

	<div class="mui-content">
		<div class="mui-card">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">职业身份</a>
					<div class="mui-collapse-content">
						<div class="z-row">
							<div class="z-col wd_zysf">
								<!-- bgspanActive -->
								<span class="bqspan mui-table-view-cell">上班族</span> <span
									class="bqspan  mui-table-view-cell ">无固定职业</span> <span
									class="bqspan mui-table-view-cell">企业主</span> <span
									class="bqspan mui-table-view-cell">个体户</span>
							</div>
						</div>
					</div></li>
				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">年龄</a>
					<div class="mui-collapse-content">
						<div class="z-row wd_nl">
							<div class="z-col">
								<input type="text" class="marB10" placeholder="最小年龄">
							</div>
							<div class="padLR15" style=" line-height:40px;">至</div>
							<div class="z-col">
								<input type="text" class="marB10" placeholder="最大年龄">
							</div>
						</div>
					</div></li>
				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">社保要求</a>
					<div class="mui-collapse-content">
						<div class="z-row">
							<div class="z-col wd_sbyq">
								<span class="bqspan mui-table-view-cell">五社保要求</span> <span
									class="bqspan mui-table-view-cell">有社保要求</span>
							</div>
						</div>
					</div></li>

				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">公积金要求</a>
					<div class="mui-collapse-content">
						<div class="z-row">
							<div class="z-col wd_gjjyq">
								<span class=" mui-table-view-cell">无公积金要求</span> <span
									class="bqspan mui-table-view-cell">有公积金要求</span>
							</div>
						</div>
					</div></li>
				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">房产要求</a>
					<div class="mui-collapse-content">
						<div class="z-row wd_fcyq">
							<div class="z-col wd_fcyq">
								<span class="bqspan mui-table-view-cell">商品房（有贷款）</span> <span
									class="bqspan mui-table-view-cell">商品房（无贷款）</span> <span
									class="bqspan mui-table-view-cell">办公楼</span> <span
									class="bqspan mui-table-view-cell">商铺</span> <span
									class="bqspan mui-table-view-cell">其他房产</span>
							</div>
						</div>
					</div></li>
				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">车产要求</a>
					<div class="mui-collapse-content">
						<div class="z-row">
							<div class="z-col wd_ccyq">
								<span class="bqspan mui-table-view-cell">贷款车</span> <span
									class="bqspan mui-table-view-cell">全款车</span>
							</div>
						</div>
					</div></li>
				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">信用情况</a>
					<div class="mui-collapse-content">
						<div class="z-row">
							<div class="z-col wd_xyzk">
								<span class="bqspan mui-table-view-cell">信用良好</span> <span
									class="bqspan mui-table-view-cell">无信用卡或贷款</span> <span
									class="bqspan mui-table-view-cell">一年内逾期超过3次且少于90天</span> <span
									class="bqspan mui-table-view-cell">一年内逾期超过3次或少于90天</span>
							</div>
						</div>
					</div></li>
				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">保险缴费方式</a>
					<div class="mui-collapse-content">
						<div class="z-row">
							<div class="z-col wd_bxyq">
								<span class="bqspan mui-table-view-cell">按月缴</span> <span
									class="bqspan mui-table-view-cell">按年缴</span>
							</div>
						</div>
					</div></li>
				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">芝麻信用</a>
					<div class="mui-collapse-content">
						<div class="z-row">
							<div class="z-col wd_xyyq">
								<span class="bqspan mui-table-view-cell">400分以下</span> <span
									class="bqspan mui-table-view-cell">400-500分</span> <span
									class="bqspan mui-table-view-cell">500-600分</span> <span
									class="bqspan mui-table-view-cell">600-700分</span> <span
									class="bqspan mui-table-view-cell">700分以上</span>
							</div>
						</div>
					</div></li>
				<li class="mui-table-view-cell mui-collapse"><a
					class="mui-navigate-right" href="#">微粒贷</a>
					<div class="mui-collapse-content">
						<div class="z-row">
							<div class="z-col wd_wldyq">
								<span class="bqspan mui-table-view-cell">0.5万一下</span> <span
									class="bqspan mui-table-view-cell">0.5-1万</span> <span
									class="bqspan mui-table-view-cell">1万-3万</span> <span
									class="bqspan mui-table-view-cell">3万-5万</span> <span
									class="bqspan mui-table-view-cell">5万-10万</span> <span
									class="bqspan mui-table-view-cell">10万以上</span>
							</div>
						</div>
					</div></li>
			</ul>
		</div>

		<div class="pad15">
			<div class="z-row">
				<div class="z-col">
					<button id="submit_wd" class="layui-btn width100">提交</button>
				</div>
			</div>
		</div>
	</div>

	<script language="javascript">
        //防止页面后退
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
	</script>
	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
	<script type="text/javascript"
		src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
	<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
	<script src="${basePath }/rwjr/js/common.js"></script>
	<script>
		$(function() {
			var _id = "${_id}";
			if (_id) {
				$.ajax({
					url : "searchcp_wd",
					type : "post",
					data : {
						id : _id
					},
					success : function(data) {
						var d = JSON.parse(data);
						fullText(d[0]);
					}
				})
			}
	
			function fullText(d) {
				console.info(d);
				if (d.zysf ) {
					$(".wd_zysf span").each(function(index, item) {
						if ($(item).text() == d.zysf) {
							$(item).addClass("bgspanActive");
						}
					});
				}
	
				if (d.sbyq ) {
					$(".wd_sbyq span").each(function(index, item) {
						if ($(item).text() == d.sbyq) {
							$(item).addClass("bgspanActive");
						}
					});
				}
				if (d.gjjyq ) {
					$(".wd_gjjyq span").each(function(index, item) {
						if ($(item).text() == d.gjjyq) {
							$(item).addClass("bgspanActive");
						}
					});
				}
	
				if (d.fcyq ) {
					$(".wd_fcyq span").each(function(index, item) {
						if ($(item).text() == d.fcyq) {
							$(item).addClass("bgspanActive");
						}
					});
				}
	
				if (d.xyqk ) {
					$(".wd_xyzk span").each(function(index, item) {
						if ($(item).text() == d.xyqk) {
							$(item).addClass("bgspanActive");
						}
					});
				}
	
				if (d.bxjffs ) {
					$(".wd_bxyq span").each(function(index, item) {
						if ($(item).text() == d.bxjffs) {
							$(item).addClass("bgspanActive");
						}
					});
				}
	
				if (d.zmxy ) {
					$(".wd_xyyq span").each(function(index, item) {
						if ($(item).text() == d.zmxy) {
							$(item).addClass("bgspanActive");
						}
					});
				}
	
				if (d.wld ) {
					$(".wd_wldyq span").each(function(index, item) {
						if ($(item).text() == d.wld) {
							$(item).addClass("bgspanActive");
						}
					});
				}
	
	
	
	
			}
	
	
			$("#submit_wd").click(function() {
				var value = {
					wd_zysf : $(".wd_zysf ").find(".bgspanActive").text(),
					wd_sbyq : $(".wd_sbyq ").find(".bgspanActive").text(),
					wd_gjjyq : $(".wd_gjjyq ").find(".bgspanActive").text(),
					wd_fcyq : $(".wd_fcyq ").find(".bgspanActive").text(),
					wd_ccyq : $(".wd_ccyq ").find(".bgspanActive").text(),
					wd_xyzk : $(".wd_xyzk ").find(".bgspanActive").text(),
					wd_bxyq : $(".wd_bxyq ").find(".bgspanActive").text(),
					wd_xyyq : $(".wd_xyyq ").find(".bgspanActive").text(),
					wd_wldyq : $(".wd_wldyq ").find(".bgspanActive").text(),
					wd_nl : $(".wd_nl").find("input").eq(0).val() + "-" + $(".wd_nl").find("input").eq(1).val()
				}
				if (_id) {
					value["_id"] = _id;
				}
				$.ajax({
					url : "addcpYq_wd",
					type : "post",
					data : value,
					success : function(data) {
						if (data == "wdInfo_101") {
							_msg("错误！");
						} else if (data == "wdInfo_100") {
							window.location.href = "grcp_wd";
						}
					}
				})
				
			});
	
			$(".wd_zysf span").click(function() {
				switchClass(this, ".wd_zysf span");
			})
	
			$(".wd_sbyq span").click(function() {
				switchClass(this, ".wd_sbyq span");
			})
	
			$(".wd_gjjyq span").click(function() {
				switchClass(this, ".wd_gjjyq span");
			})
	
			$(".wd_fcyq span").click(function() {
				switchClass(this, ".wd_fcyq span");
			})
	
			$(".wd_ccyq span").click(function() {
				switchClass(this, ".wd_ccyq span");
			})
	
			$(".wd_xyzk span").click(function() {
				switchClass(this, ".wd_xyzk span");
			})
	
			$(".wd_bxyq span").click(function() {
				switchClass(this, ".wd_bxyq span");
			})
	
			$(".wd_xyyq span").click(function() {
				switchClass(this, ".wd_xyyq span");
			})
	
			$(".wd_wldyq span").click(function() {
				switchClass(this, ".wd_wldyq span");
			})
	
			function switchClass(_s, name) {
				if ($(_s).hasClass("bgspanActive")) {
					$(_s).removeClass("bgspanActive");
				} else {
					$(name).removeClass("bgspanActive");
					$(_s).addClass("bgspanActive");
				}
			}
	
			var inputs = $(".wd_nl").find("input");
	
	
	
	
		})
	</script>

</body>
</html>