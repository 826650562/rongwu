<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
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
<link href="${basePath }/rwjr/layui/layer_mobile/layer.css"
	rel="stylesheet" type="text/css">
<!-------layui_mobile css--------->
<link rel="stylesheet" type="text/css"
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/app.css" />
<link
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.picker.css"
	rel="stylesheet" />
<link
	href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.poppicker.css"
	rel="stylesheet" />
<script>
	wxInfoId = "${wexinOpenId}";
</script>

<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/wyqd_index.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>

<link rel="stylesheet" type="text/css" href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.picker.min.css" />
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
</style>
<style>
.mui-table-view-cell {
	padding: 0px;
}

.layui-m-layerchild {
	border-radius: 2px;
}

.mui-table-view-cell
>
a
:not
 
(
.mui-btn
 
){
margin
:
 
0
px
;


}
.mui-table-view-cell:after {
	background-color: #fff;
}

/* input[type=color], input[type=date], input[type=datetime-local], input[type=datetime],
	input[type=email], input[type=month], input[type=number], input[type=password],
	input[type=search], input[type=tel], input[type=text], input[type=time],
	input[type=url], input[type=week], select, textarea {
	line-height: 45px;
	width: 100%;
	height: 45px;
	margin-bottom: 0px;
	padding: 0px 10px;
	border: none;
	outline: 0;
	border-radius: 5px;
} */

textarea {
	border: 1px solid #e6e6e6;
	resize: none !important;
	border-radius: 5px;
}

.mui-table-view-cell{padding:0px;}
.layui-m-layercont{padding:0px;border-radius:2px;}
.layui-m-layerchild {
    border-radius: 2px;
}
.mui-table-view-cell>a:not(.mui-btn){margin:0px;}
.mui-table-view-cell:after {
    background-color: #fff;
}


</style>

<script type="text/tmp" id="tmp7"> 
<div class="cztkbox">
  <div class="z-row">
   <div class="z-col jfbz">余额/积分不足</div>
 </div>
 <div class="z-row">
   <div class="z-col cztktxt">您当前的积分为：0</div>
 </div>
 <div class="z-row">
   <div class="z-col cztktxt">您当前的余额为：0</div>
 </div>
  <div class="z-row">
   <div class="z-col cztktxt">抢单将消耗&nbsp;&nbsp;<span class="colorRed">20积分</span>&nbsp;&nbsp;或者&nbsp;&nbsp;<span class="colorRed">10元</span></div>
 </div>
 <div class="z-row">
   <div class="z-col cztkzhujie">注：平台贷款由客户自己申请，抢单成功后费用不可退；特殊情况退款，5个工作日内核实处理<a href="#">查看详情</a></div>
 </div>
</div> 
 <div class="z-row" style="border-top:1px solid #e6e6e6;">
   <div class="z-col" style="border-right:1px solid #e6e6e6;"><button class="layui-btn tkbtn1">充值</button></div>
   <div class="z-col"><button class="layui-btn tkbtn2">微信支付</button></div>
 </div>
</script>



<script type="text/tmp" id="tmp2"> 
<div class="cztkbox">
 <div class="z-row">
   <div class="z-col cztktxt">您当前的积分为：100</div>
 </div>
 <div class="z-row">
   <div class="z-col cztktxt">您当前的余额为：50</div>
 </div>
  <div class="z-row">
   <div class="z-col cztktxt">抢单将消耗&nbsp;&nbsp;<span class="colorRed">20积分</span>&nbsp;&nbsp;或者&nbsp;&nbsp;<span class="colorRed">10元</span></div>
 </div>
 <div class="z-row">
   <div class="z-col cztkzhujie">注：平台贷款由客户自己申请，抢单成功后费用不可退；特殊情况退款，5个工作日内核实处理<a href="#">查看详情</a></div>
 </div>
</div> 
 <div class="z-row" style="border-top:1px solid #e6e6e6;">
   <div class="z-col" style="border-right:1px solid #e6e6e6;"><button class="layui-btn tkbtn3">20积分抢单</button></div>
   <div class="z-col"><button class="layui-btn tkbtn3">10元抢单</button></div>
 </div>
</script>


</head>

<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">我要抢单</h1>
	</header>

	<div class="mui-content">
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!---------第1页 tab 页 html start------------>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<div id="tabbar" class="mui-control-content mui-active">
			<div id="slider" class="mui-slider">
				<div id="sliderSegmentedControl"
					class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<a class="mui-control-item" href="#item1mobile">全部项目</a> <a
						class="mui-control-item" href="#item2mobile">优质客户</a>
				</div>
				<div id="sliderProgressBar"
					class="mui-slider-progress-bar mui-col-xs-6"></div>
				<div class="mui-slider-group">
					<div id="item1mobile"
						class="mui-slider-item mui-control-content mui-active">
						<div id="scroll1" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<!--tab cont1 start-->
								<div class="qdsx">
									<div class="z-row">
										<div class="z-col">
											<span class="zcsx" value="fangchan">有房产</span> <span
												class="zcsx" value="che">有车产</span> <span class="zcsx"
												value="shebao">有社保</span> <span class="zcsx" value="gjj">有公积金</span>
											<span class="zcsx" value="sbz">上班族</span>
										</div>
									</div>
								</div>

								<div class="qdlist">
									<div class="z-row">
										<!--tiaojian start-->
										<div class="z-col">
											<div class="z-row">
												<div class="z-col tabletitle">发布时间</div>
												<div class="pxxtb _dkfbsj">
													<i class="fa fa-caret-up fa-fw"></i> <i
														class="fa fa-caret-down fa-fw"></i>
												</div>
											</div>
										</div>
										<div class="z-col">
											<div class="z-row">
												<div class="z-col tabletitle">金额</div>
												<div class="pxxtb _dkjine">
													<i class="fa fa-caret-up fa-fw"></i> <i
														class="fa fa-caret-down fa-fw"></i>
												</div>
											</div>
										</div>
										<div class="z-col">
											<div class="z-row">
												<div class="z-col tabletitle">价格</div>
												<div class="pxxtb _dkjiage">
													<i class="fa fa-caret-up fa-fw"></i> <i
														class="fa fa-caret-down fa-fw"></i>
												</div>
											</div>
										</div>
										<div class="z-col">
											<div class="z-row">
												<div class="z-col tabletitle">上海市</div>
												<div class="diquxtb">
													<i class="fa fa-chevron-down fa-fw"></i>
												</div>
											</div>
										</div>
									</div>
									<!--tiaojian end-->

									<div class='ptkh'></div>


									<div class="bnavblank"></div>
									<!---blank-->
								</div>
								<!--tab cont1 end-->
							</div>
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div id="scroll2" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<!--tab cont2 start-->
								<div class="qdlist">
									<div class="z-row">
										<!--tiaojian start-->
										<div class="z-col">
											<div class="z-row">
												<div class="z-col tabletitle">发布时间</div>
												<div class="pxxtb _dkfbsj">
													<i class="fa fa-caret-up fa-fw"></i> <i
														class="fa fa-caret-down fa-fw"></i>
												</div>
											</div>
										</div>
										<div class="z-col">
											<div class="z-row">
												<div class="z-col tabletitle">金额</div>
												<div class="pxxtb _dkjine">
													<i class="fa fa-caret-up fa-fw"></i> <i
														class="fa fa-caret-down fa-fw"></i>
												</div>
											</div>
										</div>
										<div class="z-col">
											<div class="z-row">
												<div class="z-col tabletitle">价格</div>
												<div class="pxxtb _dkjiage">
													<i class="fa fa-caret-up fa-fw"></i> <i
														class="fa fa-caret-down fa-fw"></i>
												</div>
											</div>
										</div>
										<div class="z-col">
											<div class="z-row">
												<div class="z-col tabletitle">上海市</div>
												<div class="diquxtb">
													<i class="fa fa-chevron-down fa-fw"></i>
												</div>
											</div>
										</div>
									</div>
									<!--tiaojian end-->
									<div class='ptkh'></div>




									<div class="bnavblank"></div>
									<!--blank--->
								</div>
								<!--tab cont2 end-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!---------第1页 tab 页 html end------------>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!---------第2页 tab 页 html start------------>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<div id="tabbar-with-chat" class="mui-control-content">
			<div class="mui-content">









				<!-------------------------------------------->
				<!-------------------------------------------->
				<!---------第1页 tab 页 html start------------>
				<!-------------------------------------------->
				<!-------------------------------------------->
				<div class="khsx">
					<div class="z-row">
						<div class="z-col">
							<span class="khsxItemActive">待处理</span> <span class="khsxItem">跟进中</span>
							<span class="khsxItem">成功放款</span> <span class="khsxItem">不能做</span>
							<span class="khsxItem">退款处理</span>
						</div>
					</div>
				</div>

				<div class="ddtkgzbox">
					<div class="z-row szitem mui-table-view-cell" id="demo7"
						data-options="{&quot;type&quot;:&quot;hour&quot;,&quot;customData&quot;:{&quot;h&quot;:[{&quot;text&quot;:&quot;前1天&quot;,&quot;value&quot;:&quot;前1天&quot;},{&quot;text&quot;:&quot;前3天&quot;,&quot;value&quot;:&quot;前3天&quot;},{&quot;text&quot;:&quot;前1周&quot;,&quot;value&quot;:&quot;前1周&quot;}]},&quot;labels&quot;:[&quot;年&quot;, &quot;月&quot;, &quot;日&quot;, &quot;时段&quot;, &quot;分&quot;]}">
						<div class="xxbcltxt">抢单时间</div>
						<div class="z-col sztstxt ui-alert" id="result">请选择</div>
						<div class="xxbcrjt">
							<i class="fa fa-angle-right fa-lg"></i>
						</div>
					</div>
					<div class="z-row marT10">
						<div class="z-col khsearch">
							<input type="text" placeholder="输入客户姓名或手机号">
						</div>
						<div class="khsearchbtn">
							<button>
								<i class="fa fa-search fa-fw"></i>
							</button>
						</div>
					</div>
					<div class="z-row">
						<div class="z-col">
							<a href="#" class="ddtkgz">查看订单退款规则</a>
						</div>
					</div>
				</div>

				<div class="qdlist">
					<div class="z-row qdliitem">
						<div class="z-col">
							<div class="z-row wyqdtopbox">
								<div class="wyqdname">
									<strong>张先锋</strong>
								</div>
								<div class="z-col wyqdcash colorRed">1万元</div>
								<div class="wyqdwxxtb">
									<i class="fa fa-street-view fa-fw"></i>
								</div>
								<div class=" wyqdaddr">上海市--嘉定区</div>
							</div>
							<div class="z-row">
								<div class="z-col wyqditemcont">上班族，普通企业，29岁，男，月光族，月代发6000元，芝麻信用400分，有社保，信用良好</div>
							</div>
							<div class="z-row">
								<div class="z-col wyqdtime">申请时间：刚刚</div>
							</div>
							 
						</div>
					</div>
					<div class="bnavblank"></div>
				</div>
				<div></div>
 

				<!-------------------------------------------->
			</div>


		</div>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!---------第2页 tab 页 html end------------>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!---------第3页 tab 页 html start------------>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<div id="tabbar-with-contact" class="mui-control-content">
			<ul
				class="mui-table-view mui-table-view-striped mui-table-view-condensed">
				<div class="requestScope">${requestScope.key}</div>
			</ul>
			<div class="mui-content">




				<div class="wdydycont" style="display:block">
					<div class="z-row">
						<div class="z-col wdydytitle">创建信贷微店、扩大获客渠道</div>
					</div>
					<div class="z-row">
						<div class="z-col wdertitle">超过95%的信贷经理都创建了自己的微店</div>
					</div>


					<div class="padLR15">

						<div class="z-row marB10">
							<div class="z-col">
								<div class="z-row">
									<div class="z-col"></div>
									<div class="wdydyimgbox">
										<img src="${basePath }/rwjr/images/wdydyimg1.png">
									</div>
									<div class="z-col"></div>
								</div>
								<div class="z-row">
									<div class="z-col wdydyimgtxt">免费客户申请</div>
								</div>
							</div>
							<div class="z-col">
								<div class="z-row">
									<div class="z-col"></div>
									<div class="wdydyimgbox">
										<img src="${basePath }/rwjr/images/wdydyimg2.png">
									</div>
									<div class="z-col"></div>
								</div>
								<div class="z-row">
									<div class="z-col wdydyimgtxt">展现专业形象</div>
								</div>
							</div>
						</div>

						<div class="z-row marB15">
							<div class="z-col">
								<div class="z-row">
									<div class="z-col"></div>
									<div class="wdydyimgbox">
										<img src="${basePath }/rwjr/images/wdydyimg3.png">
									</div>
									<div class="z-col"></div>
								</div>
								<div class="z-row">
									<div class="z-col wdydyimgtxt">秀出行业地位</div>
								</div>
							</div>
							<div class="z-col">
								<div class="z-row">
									<div class="z-col"></div>
									<div class="wdydyimgbox">
										<img src="${basePath }/rwjr/images/wdydyimg4.png">
									</div>
									<div class="z-col"></div>
								</div>
								<div class="z-row">
									<div class="z-col wdydyimgtxt">社交更加及时</div>
								</div>
							</div>
						</div>

					</div>



					<div class="z-row loginInput">
						<div class="sfzrzitemtxt">日期望消费金额：</div>
						<div class="z-col">
							<input type="text" placeholder="请输入" id="rqwxfje" class="zInput">
						</div>
						<div class="sfzrzitemtxt">万元</div>
					</div>

					<div class="z-row loginInput">
						<div class="sfzrzitemtxt">日期望订单笔数：</div>
						<div class="z-col">
							<input type="text" placeholder="请输入" id="rqwddbs" class="zInput">
						</div>
						<div class="sfzrzitemtxt">笔</div>
					</div>

					<div class="z-row">
						<div class="z-col padB10">
							<i class="fa fa-edit fa-fw"></i>&nbsp;请填写店铺介绍
						</div>
					</div>

					<div class="z-row">
						<div class="z-col">
							<textarea placeholder="150字以内" id="wd_area"
								class="layui-textarea"></textarea>
						</div>
					</div>

					<div class="z-row marT15">
						<div class="z-col">
							<button class="layui-btn width100" id="ktwdwd">开通我的微店</button>
						</div>
					</div>

				</div>




				<div class="wdsybox" style="display:none">

					<div class="wdsytopbox">
						<div class="z-row">
							<div class="wdsyhead">
								<img src="${basePath }/rwjr/images/head.jpg">
							</div>
							<div class="z-col wdsyheadright">
								<div class="z-row">
									<div>
										<span class="wdsyheadName">秀水信贷人</span>
									</div>
									<div class="z-col">
										<span class="wdsyheadAddr"><i
											class="fa fa-street-view fa-fw"></i>九江市</span>
									</div>
								</div>
								<div class="z-row">
									<div class="z-col wdsyheadms">诚信经营的态度对待每一个咨询者</div>
								</div>
							</div>
						</div>
						<div class="wdsycont">
							<div class="wdsycontinner">
								<div class="z-row">
									<div class="z-col borRgray">
										<div class="rqwxfnumber" id="rqwxfjenumber">无上限</div>
										<div class="rqwxf">日期望消费金额</div>
									</div>
									<div class="z-col">
										<div class="rqwxfnumber" id="rqwxfbsnumber">无上限</div>
										<div class="rqwxf">日期望订单笔数</div>
									</div>
								</div>
							</div>
							<div class="wdsycontnavbox">

								<div class="z-row">
									<div id="grcp_wd"
										class="z-col pad15 borRBgray mui-table-view-cell">
										<div class="z-row">
											<div class="z-col"></div>
											<div class="wdsynavitem">
												<img src="${basePath }/rwjr/images/grcp.png">
											</div>
											<div class="z-col"></div>
										</div>
										<div class="z-row">
											<div class="z-col"></div>
											<div class="wdsynavtxt">个人产品</div>
											<div class="z-col"></div>
										</div>
									</div>
									<div id="fxwd_wd"
										class="z-col pad15 borBgray mui-table-view-cell">
										<div class="z-row">
											<div class="z-col"></div>
											<div class="wdsynavitem">
												<img src="${basePath }/rwjr/images/wdfx.png">
											</div>
											<div class="z-col"></div>
										</div>
										<div class="z-row">
											<div class="z-col"></div>
											<div class="wdsynavtxt">分享微店</div>
											<div class="z-col"></div>
										</div>
									</div>
								</div>

								<div class="z-row">
									<div id="wdph_wd"
										class="z-col pad15 borRgray mui-table-view-cell">
										<div class="z-row">
											<div class="z-col"></div>
											<div class="wdsynavitem">
												<img src="${basePath }/rwjr/images/wdph.png">
											</div>
											<div class="z-col"></div>
										</div>
										<div class="z-row">
											<div class="z-col"></div>
											<div class="wdsynavtxt">微店排行</div>
											<div class="z-col"></div>
										</div>
									</div>
									<div id="mjfk_wd"
										class="z-col pad15 borRgray mui-table-view-cell">
										<div class="z-row">
											<div class="z-col"></div>
											<div class="wdsynavitem">
												<img src="${basePath }/rwjr/images/mjfk.png">
											</div>
											<div class="z-col"></div>
										</div>
										<div class="z-row">
											<div class="z-col"></div>
											<div class="wdsynavtxt">民间风控</div>
											<div class="z-col"></div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

				</div>



			</div>



		</div>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!---------第3页 tab 页 html end------------>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!---------第4页 tab 页 html start------------>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<div id="tabbar-with-map" class="mui-control-content">

			<div class="mytopbox">
				<div class="z-row padT20">
					<div class="z-col"></div>
					<div class="mycenhead">
						<img src="${basePath }/rwjr/images/head.jpg">
					</div>
					<div class="z-col"></div>
				</div>
				<div class="z-row peocentxx">
					<div class="z-col"></div>
					<div>
						<strong id="_name_xd">经理</strong>
					</div>
					<div class="mycentzhye">
						<span>（</span>账户余额：0元<span>）</span>
					</div>
					<div class="z-col"></div>
				</div>
				<div class="z-row">
					<div class="z-col szcz">
						<div class="z-row szczcont">
							<div class="z-col">
								<button class="shezhibtn">
									<i class="fa fa-cny fa-fw"></i>充值
								</button>
							</div>
							<div class="z-col">
								<button class="chongzhibtn">
									<i class="fa fa-gear fa-fw"></i>设置
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>


			<ul class="mui-table-view mui-grid-view mui-grid-9">
				<li id='_sqrz'
					class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
					<span class="renzheng"><img id="shengqing_pic"
						img_url="${basePath }/rwjr/images/"
						src="${basePath }/rwjr/images/no_rz.png"> <!--<img src="${basePath }/rwjr/images/yes_rz.png">--></span>
					<a href="#"> <span class="mycenterxtb"><img
							src="${basePath }/rwjr/images/myxtb1.png"></span>
						<div class="mui-media-body" id="shenqing-status">申请认证</div>
				</a>
				</li>
				<li id='_khsq'
					class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
					<a href="#tabbar-with-chat"> <span class="mycenterxtb"><img
							src="${basePath }/rwjr/images/myxtb2.png"></span>
						<div class="mui-media-body">客户申请</div>
				</a>
				</li>
				<li id='_wdye'
					class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
					<a href="#"> <span class="mycenterxtb"><img
							src="${basePath }/rwjr/images/myxtb3.png"></span>
						<div class="mui-media-body">我的余额</div>
				</a>
				</li>
				<li id='_czjl'
					class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
					<a href="#"> <span class="mycenterxtb"><img
							src="${basePath }/rwjr/images/myxtb4.png"></span>
						<div class="mui-media-body">充值记录</div>
				</a>
				</li>
				<li id='_wdjf'
					class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
					<a href="#"> <span class="mycenterxtb"><img
							src="${basePath }/rwjr/images/myxtb5.png"></span>
						<div class="mui-media-body">我的积分</div>
				</a>
				</li>
			</ul>
		</div>
		<!-------------------------------------------->
		<!-------------------------------------------->
		<!---------第4页 tab 页 html end------------>
		<!-------------------------------------------->
		<!-------------------------------------------->
	</div>

	<!--底部nav html start-->
	<nav class="mui-bar mui-bar-tab">
		<a class="mui-tab-item mui-active" href="#tabbar"> <span
			class="mui-icon mui-icon-home"></span> <span class="mui-tab-label">贷款客户</span>
		</a> <a class="mui-tab-item" href="#tabbar-with-chat"> <span
			class="mui-icon mui-icon-email"></span> <span class="mui-tab-label">客户</span>
		</a> <a class="mui-tab-item" href="#tabbar-with-contact"> <span
			class="mui-icon mui-icon-contact"></span> <span class="mui-tab-label">微店</span>
		</a> <a class="mui-tab-item" href="#tabbar-with-map"> <span
			class="mui-icon mui-icon-gear"></span> <span class="mui-tab-label">我的</span>
		</a>
	</nav>
	<!--底部nav html end-->

	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
	<script src="${basePath }/rwjr/layui/layer_mobile/layer.js"></script>
	<script src="${basePath }/rwjr/mui-master/examples/hello-mui/js/mui.picker.min.js"></script>
	<!--------layui_moblile js--------->
	<script src="${basePath }/rwjr/js/jsRender.js"></script>

	<!------------------MUI 选项卡 js----------------------->
	<script>
		mui.init({
			swipeBack : true
		});
		(function($) {
			if ('${openid}') {
				setCookie("wexinOpenId", '${openid}');
			}
			$('.mui-scroll-wrapper').scroll({
				indicators : true //是否显示滚动条
			});
		})(mui);
	</script>
<script>
(function($) {
	$.init();
	var result = $('#result')[0];
	var btns = $('#demo7');
	btns.each(function(i, btn) {
		btn.addEventListener('tap', function() {
			var _self = this;
			if(_self.picker) {
				_self.picker.show(function (rs) {
					result.innerText = rs.text;
					_self.picker.dispose();
					_self.picker = null;
				});
			} else {
				var optionsJson = this.getAttribute('data-options') || '{}';
				var options = JSON.parse(optionsJson);
				var id = this.getAttribute('id');
				/*
				 * 首次显示时实例化组件
				 * 示例为了简洁，将 options 放在了按钮的 dom 上
				 * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
				 */
				_self.picker = new $.DtPicker(options);
				_self.picker.show(function(rs) {
					/*
					 * rs.value 拼合后的 value
					 * rs.text 拼合后的 text
					 * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
					 * rs.m 月，用法同年
					 * rs.d 日，用法同年
					 * rs.h 时，用法同年
					 * rs.i 分（minutes 的第二个字母），用法同年
					 */
					result.innerText = rs.text;
					/* 
					 * 返回 false 可以阻止选择框的关闭
					 * return false;
					 */
					/*
					 * 释放组件资源，释放后将将不能再操作组件
					 * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
					 * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
					 * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
					 */
					_self.picker.dispose();
					_self.picker = null;
				});
			}
			
		}, false);
	});
})(mui);
</script>
</body>
</html>