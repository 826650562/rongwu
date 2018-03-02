<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>分享微店</title>
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
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<style>
.mui-table-view-cell:after {
	background-color: #fff;
}

.mui-table-view-cell {
	padding: 0px;
}

.mui-slider-item {
	padding: 0px 15px 30px 15px;
}

.mui-slider-indicator .mui-active.mui-indicator {
	background: #fc4023;
}
</style>

</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">分享微店</h1>
	</header>
	<div class="mui-content">





		<div class="fxwdtopbox">
			<div class="z-row">
				<div class="z-col"></div>
				<div class="fxwdtopbtnbox">
					<button class="phoneGreenbtn">
						<i class="fa fa-phone fa-lg"></i>
					</button>
				</div>
				<div class="z-col"></div>
				<div class="fxwdhead">
					<img src="${basePath }/rwjr/images/head.jpg">
				</div>
				<div class="z-col"></div>
				<div class="fxwdtopbtnbox">
					<button class="shareYllowbtn">
						<i class="fa fa-share-alt fa-fw"></i>
					</button>
				</div>
				<div class="z-col"></div>
			</div>
			<div class="z-row fxwdtopaddr">
				<div class="z-col"></div>
				<div>
					<i class="fa fa-street-view fa-fw"></i>上海市普陀区
				</div>
				<div class="z-col"></div>
			</div>
		</div>

		<!-------------------------滑动卡片 start---------------------------->

		<div class="scollbox">

			<div id="Gallery" class="mui-slider">
				<div class="mui-slider-group">


					<!----车贷------>

					<div class="mui-slider-item">
						<div class="CDbox mui-table-view-cell">
							<div class="z-row gixtbbox">
								<div class="cpitemxtb">
									<img src="${basePath }/rwjr/images/che.png">
								</div>
								<div class="z-col wdfxcpmc">车贷</div>
								<div class="ffqh">六块可见切换</div>
							</div>
							<div class="z-row">
								<div class="z-col wdfxlabelbox">
									<span class="wdfxlabel">最快两小时房款</span> <span class="wdfxlabel">门槛低</span>
								</div>
							</div>
							<div class="cjkk">
								<div class="z-row wdfxtxt">
									<div>额度：</div>
									<div class="z-col">
										<strong>10-100</strong>
									</div>
								</div>
								<div class="z-row wdfxtxt">
									<div>期限：</div>
									<div class="z-col">
										<strong>3-36</strong>个月
									</div>
								</div>
							</div>
						</div>
					</div>

					<!------房贷---->
					<div class="mui-slider-item">
						<div class="FDbox mui-table-view-cell">
							<div class="z-row gixtbbox">
								<div class="cpitemxtb">
									<img src="${basePath }/rwjr/images/fang.png">
								</div>
								<div class="z-col wdfxcpmc">车贷</div>
								<div class="ffqh">六块可见切换</div>
							</div>
							<div class="z-row">
								<div class="z-col wdfxlabelbox">
									<span class="wdfxlabel">最快两小时房款</span> <span class="wdfxlabel">门槛低</span>
								</div>
							</div>
							<div class="cjkk">
								<div class="z-row wdfxtxt">
									<div>额度：</div>
									<div class="z-col">
										<strong>10-100</strong>
									</div>
								</div>
								<div class="z-row wdfxtxt">
									<div>期限：</div>
									<div class="z-col">
										<strong>3-36</strong>个月
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-----公积金贷----->

					<div class="mui-slider-item ">
						<div class="GJJbox mui-table-view-cell">
							<div class="z-row gixtbbox">
								<div class="cpitemxtb">
									<img src="${basePath }/rwjr/images/gjj.png">
								</div>
								<div class="z-col wdfxcpmc">公积金贷</div>
								<div class="ffqh">六块可见切换</div>
							</div>
							<div class="z-row">
								<div class="z-col wdfxlabelbox">
									<span class="wdfxlabel">最快两小时房款</span> <span class="wdfxlabel">门槛低</span>
								</div>
							</div>
							<div class="cjkk">
								<div class="z-row wdfxtxt">
									<div>额度：</div>
									<div class="z-col">
										<strong>10-100</strong>
									</div>
								</div>
								<div class="z-row wdfxtxt">
									<div>期限：</div>
									<div class="z-col">
										<strong>3-36</strong>个月
									</div>
								</div>
							</div>
						</div>
					</div>

					<!----信用贷------>

					<div class="mui-slider-item">
						<div class="XDbox mui-table-view-cell">
							<div class="z-row gixtbbox ">
								<div class="cpitemxtb">
									<img src="${basePath }/rwjr/images/xin.png">
								</div>
								<div class="z-col wdfxcpmc">信用贷</div>
								<div class="ffqh">六块可见切换</div>
							</div>
							<div class="z-row">
								<div class="z-col wdfxlabelbox">
									<span class="wdfxlabel">最快两小时房款</span> <span class="wdfxlabel">门槛低</span>
								</div>
							</div>
							<div class="cjkk">
								<div class="z-row wdfxtxt">
									<div>额度：</div>
									<div class="z-col">
										<strong>10-100</strong>
									</div>
								</div>
								<div class="z-row wdfxtxt">
									<div>期限：</div>
									<div class="z-col">
										<strong>3-36</strong>个月
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>
				<!----卡片个数提示点 start------>
				<div class="mui-slider-indicator">
					<div class="mui-indicator mui-active"></div>
					<div class="mui-indicator"></div>
					<div class="mui-indicator"></div>
					<div class="mui-indicator"></div>
				</div>
				<!----卡片个数提示点 end------>
			</div>

		</div>

		<!-------------------------滑动卡片 end---------------------------->

		<div class="dkfwlxbox">
			<div class="z-row">
				<div class="z-col jkzxfwlx">借款咨询服务类型</div>
			</div>
			<div class="z-row">
				<div class="z-col">
					<div class="jkzxbtnitem">
						<button class="jkzxbtn">微粒贷</button>
					</div>
					<div class="jkzxbtnitem">
						<button class="jkzxbtn">抵押贷</button>
					</div>
					<div class="jkzxbtnitem">
						<button class="jkzxbtn">抵押贷</button>
					</div>
					<div class="jkzxbtnitem">
						<button class="jkzxbtn">企业贷</button>
					</div>
					<div class="jkzxbtnitem">
						<button class="jkzxbtn">卡易贷</button>
					</div>
					<div class="jkzxbtnitem">
						<button class="jkzxbtn">信用贷</button>
					</div>
				</div>
			</div>
		</div>


	</div>

	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
	<script>
		mui.init();
		mui.ready(function() {
			var slider = document.getElementById('Gallery');
			var group = slider.querySelector('.mui-slider-group');
			var items = mui('.mui-slider-item', group);
			//克隆第一个节点
			var first = items[0].cloneNode(true);
			first.classList.add('mui-slider-item-duplicate');
			//克隆最后一个节点
			var last = items[items.length - 1].cloneNode(true);
			last.classList.add('mui-slider-item-duplicate');
			//处理是否循环逻辑，若支持循环，需支持两点：
			//1、在.mui-slider-group节点上增加.mui-slider-loop类
			//2、重复增加2个循环节点，图片顺序变为：N、1、2...N、1
			var sliderApi = mui(slider).slider();
	
			function toggleLoop(loop) {
				if (loop) {
					group.classList.add('mui-slider-loop');
					group.insertBefore(last, group.firstChild);
					group.appendChild(first);
					sliderApi.refresh();
					sliderApi.gotoItem(0);
				} else {
					group.classList.remove('mui-slider-loop');
					group.removeChild(first);
					group.removeChild(last);
					sliderApi.refresh();
					sliderApi.gotoItem(0);
				}
			}
		/* 	//按下“循环”按钮的处理逻辑；
			document.getElementById('Gallery_Toggle').addEventListener('toggle', function(e) {
				var loop = e.detail.isActive;
				toggleLoop(loop);
			}); */
		});
	</script>

	<script>
		$(function() {
			var userInfo = "${userInfo}";
			var userinfos = userInfo.split("_");
			function isIosBrowser() {
				var isIos = null;
				isIos = !!navigator.userAgent.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
				return isIos
			}
			$(".phoneGreenbtn").click(function() {
				if (isIosBrowser) {
					var a = document.createElement('a');
					a.href = 'tel:' + userinfos[1];
					a.style.visibility = 'hidden';
					document.body.appendChild(a);
					a.click();
				} else {
					window.location.href = 'tel:' + userinfos[1];
				}
			});
	
			$(".shareYllowbtn").click(function() {
				if (isIosBrowser) {
					var a = document.createElement('a');
					a.href = 'sms:' + userinfos[1];
					a.style.visibility = 'hidden';
					document.body.appendChild(a);
					a.click();
				} else {
					window.location.href = 'sms:' + userinfos[1];
				}
			});
	
	
	
	
	
			$.ajax({
				url : "scPics",
				type : "post",
				contentType : "application/x-www-form-urlencoded",
				data : {
					url : "http://www.80wangjian.com/springmvc/wyqd/fxwd_wd"
				},
				success : function(data) {
					var res = JSON.parse(data)[0];
					wx.config({
						debug : false,
						appId : 'wxc3691f09dbfd769d',
						timestamp : res.timestamp,
						nonceStr : res.noncestr,
						signature : res.signature,
						jsApiList : [
							"onMenuShareTimeline",
							"onMenuShareAppMessage",
							"onMenuShareQQ"
						]
					});
					wx.ready(function() {
						wx.checkJsApi({
							jsApiList : [
								'onMenuShareTimeline',
								'onMenuShareAppMessage',
								'onMenuShareQQ',
								'onMenuShareWeibo',
								'onMenuShareQZone'
							]
						});
						wx.checkJsApi({
							jsApiList : [
								'onMenuShareTimeline',
								'onMenuShareAppMessage',
								'onMenuShareQQ',
								'onMenuShareWeibo',
								'onMenuShareQZone'
							]
						});
						/*分享到朋友圈*/
						wx.onMenuShareTimeline({
							title : '我的信贷微店', // 分享标题  
							desc : '欢迎打开我的信贷微店-融五金融平台', // 分享描述  
							link : window.location.href, // 分享链接  
							imgUrl : 'http://wx.qlogo.cn/mmopen/icTdbqWNOwNQ8xricfTKoVPwJ7SPlvAGdkfKmMmv5m34r5asQPI3IbibfGKumYUOxgnlbXHTWUtu55s4icllCqdbq1bTreRBTHL2/64', // 分享图标  
							success : function() {
								// 用户确认分享后执行的回调函数  
							},
							cancel : function() {
								// 用户取消分享后执行的回调函数  
							}
						});
						/*分享给朋友*/
						wx.onMenuShareAppMessage({
							title : '我的信贷微店', // 分享标题  
							desc : '欢迎打开我的信贷微店-融五金融平台', // 分享描述  
							link : window.location.href, // 分享链接  
							imgUrl : 'http://wx.qlogo.cn/mmopen/icTdbqWNOwNQ8xricfTKoVPwJ7SPlvAGdkfKmMmv5m34r5asQPI3IbibfGKumYUOxgnlbXHTWUtu55s4icllCqdbq1bTreRBTHL2/64', // 分享图标  
							type : 'link', // 分享类型,music、video或link，不填默认为link  
							dataUrl : '', // 如果type是music或video，则要提供数据链接，默认为空  
							success : function() {
								// 用户确认分享后执行的回调函数  
								alert("您已分享");
							},
							cancel : function() {
								// 用户取消分享后执行的回调函数  
								alert('您已取消分享');
							}
						});
	
	
	
						wx.onMenuShareQQ({
							title : '我的信贷微店', // 分享标题  
							desc : '欢迎打开我的信贷微店-融五金融平台', // 分享描述  
							link : window.location.href, // 分享链接  
							imgUrl : 'http://wx.qlogo.cn/mmopen/icTdbqWNOwNQ8xricfTKoVPwJ7SPlvAGdkfKmMmv5m34r5asQPI3IbibfGKumYUOxgnlbXHTWUtu55s4icllCqdbq1bTreRBTHL2/64', // 分享图标  
							success : function() {
								// 用户确认分享后执行的回调函数  
							},
							cancel : function() {
								// 用户取消分享后执行的回调函数  
							}
						});
						wx.onMenuShareWeibo({
							title : '我的信贷微店', // 分享标题  
							desc : '欢迎打开我的信贷微店-融五金融平台', // 分享描述  
							link : window.location.href, // 分享链接  
							imgUrl : 'http://wx.qlogo.cn/mmopen/icTdbqWNOwNQ8xricfTKoVPwJ7SPlvAGdkfKmMmv5m34r5asQPI3IbibfGKumYUOxgnlbXHTWUtu55s4icllCqdbq1bTreRBTHL2/64', // 分享图标  
							success : function() {
								// 用户确认分享后执行的回调函数  
							},
							cancel : function() {
								// 用户取消分享后执行的回调函数  
							}
						});
						wx.onMenuShareQZone({
							title : '我的信贷微店', // 分享标题  
							desc : '欢迎打开我的信贷微店-融五金融平台', // 分享描述  
							link : window.location.href, // 分享链接  
							imgUrl : 'http://wx.qlogo.cn/mmopen/icTdbqWNOwNQ8xricfTKoVPwJ7SPlvAGdkfKmMmv5m34r5asQPI3IbibfGKumYUOxgnlbXHTWUtu55s4icllCqdbq1bTreRBTHL2/64', // 分享图标  
							success : function() {
								// 用户确认分享后执行的回调函数  
							},
							cancel : function() {
								// 用户取消分享后执行的回调函数  
							}
						});
					});
	
					wx.error(function(res) {
						// config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。  
						alert("抱歉，服务器初始化错误。");
					});
				},
				error : function(xhr, type, errorThrown) {
					//异常处理；  
					alert(xhr);
					console.log(type);
					console.log(errorThrown);
				}
			});
	
	
	
		})
	</script>

</body>
</html>