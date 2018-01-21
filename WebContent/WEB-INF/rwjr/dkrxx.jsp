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
<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">贷款人信息</h1>
	</header>


	<div class="main">

		<!--<div class="topbar">
 <div class="z-row">
    <div class="topbarleft"><i class="fa fa-chevron-left fa-fw"></i></div>
    <div class="z-col topbarcenter">贷款人信息</div>
    <div class="topbarright"></div>
 </div>
</div>-->

		<div class="xxhead">

			<div class="xxheadbox">
				<div class="z-row padTB5">
					<div class="z-col"></div>
					<div class="xxheadName" id="_dkrName"></div>
					<div class="dqdts" id="_dkrStratus">待抢单</div>
					<div class="z-col"></div>
				</div>
				<div class="z-row xxheadPhone">
					<div class="z-col"></div>
					<div>
						<i class="fa fa-mobile fa-fw"></i>
					</div>
					<div id="_dkrSjh">187***643</div>
					<div class="z-col"></div>
				</div>
				<div class="z-row">
					<div class="z-col xxheadAddr" id="_dkrCity">城市：</div>
				</div>
				<div class="z-row xxinfo">
					<div class="xxheadblank"></div>
					<div class="z-col xxhlineright">
						<div class="z-row xxheadNum">
							<div class="z-col" id="_dkrSr">元</div>
						</div>
						<div class="z-row xxheadevery">
							<div class="z-col">月收入</div>
						</div>
					</div>
					<div class="z-col xxhlineright">
						<div class="z-row xxheadNum">
							<div class="z-col" id="_dkDkjine">0万元</div>
						</div>
						<div class="z-row xxheadevery">
							<div class="z-col">贷款额度</div>
						</div>
					</div>
					<div class="z-col">
						<div class="z-row xxheadNum">
							<div class="z-col" id="dk_qx">0个月</div>
						</div>
						<div class="z-row xxheadevery">
							<div class="z-col">贷款期限</div>
						</div>
					</div>
					<div class="xxheadblank"></div>
				</div>
			</div>

			<div class="xxcont">
				<!----infomation start---->

				<div class="z-row xxitembox">
					<div class="z-col">
						<div class="z-row xxitemTitle">
							<div class="xxitemxtb">
								<i class="fa fa-file-text-o fa-fw"></i>
							</div>
							<div class="z-col">基本信息</div>
						</div>
						<div class="z-row xxitemcont">
							<div class="z-col">
								<div class="z-row xxitemli">
									<div class="padR5">申请时间：</div>
									<div class="z-col" id="dk_sqsj"></div>
								</div>
								<div class="z-row xxitemli">
									<div class="padR5">职业身份：</div>
									<div class="z-col" id="dksq_sf"></div>
								</div>
								<div class="z-row xxitemli">
									<div class="padR5">工资发放形式：</div>
									<div class="z-col">现金</div>
								</div>
								<div class="z-row xxitemli">
									<div class="padR5">是否有公积金：</div>
									<div class="z-col" id="sq_gjj">有</div>
								</div>
								<div class="z-row xxitemli">
									<div class="padR5">是否有社保：</div>
									<div class="z-col" id="sq_sb">有</div>
								</div>
								<div class="z-row xxitemli">
									<div class="padR5">学历：</div>
									<div class="z-col" id="sq_xl"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="z-row xxitembox">
					<div class="z-col">
						<div class="z-row xxitemTitle">
							<div class="xxitemxtb">
								<i class="fa fa-credit-card fa-fw"></i>
							</div>
							<div class="z-col">资产信息</div>
						</div>
						<div class="z-row xxitemcont">
							<div class="z-col">
								<div class="z-row xxitemli">
									<div class="padR5">房产信息：</div>
									<div class="z-col" id="sq_fc">无房</div>
								</div>
								<div class="z-row xxitemli">
									<div class="padR5">车产信息：</div>
									<div class="z-col" id="sq_che"></div>
								</div>
								<div class="z-row xxitemli">
									<div class="padR5">每月车贷：</div>
									<div class="z-col" id="sq_cd"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="z-row xxitembox">
					<div class="z-col">
						<div class="z-row xxitemTitle">
							<div class="xxitemxtb">
								<i class="fa fa-id-card-o fa-fw"></i>
							</div>
							<div class="z-col">信用情况</div>
						</div>
						<div class="z-row xxitemcont">
							<div class="z-col">
								<div class="z-row xxitemli">
									<div class="padR5">芝麻信用：</div>
									<div class="z-col" id="sq_zmf">0分</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="z-row marT15">
					<div class="z-col">
						<button class="layui-btn width100">0元抢单</button>
					</div>
				</div>

			</div>
			<!----infomation end---->

		</div>
	</div>


	<script>
		layui.use(['form', 'element', 'laydate'], function(){
		  var $ = layui.jquery
		  ,form = layui.form
		  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
		});
      var package_number = "<%=request.getParameter("package")%>";  
      var user_dkxq= JSON.parse(getCookie("user_dkxq"));
      console.info(user_dkxq);
      if(user_dkxq){
         $("#_dkrName").text(user_dkxq.name);
         if(user_dkxq.status==1){
          $("#_dkrStratus").text("待抢单");
         }
         $("#_dkrSjh").text(user_dkxq.sjh.substr(0,3)+"***"+user_dkxq.sjh.substr(user_dkxq.sjh.length-3,3));
         $("#_dkrCity").text("城市："+user_dkxq.adress);
         $("#_dkrSr").text(user_dkxq.gz+"元");
         $("#_dkDkjine").text(user_dkxq.jine+"元");
         $("#dk_qx").text(user_dkxq.daikuanqixian+"个月");
         $("#dk_sqsj").text(user_dkxq.date);
         
         $("#dksq_sf").text(user_dkxq.gzffxs);
         if(user_dkxq.gjj==1){
         $("#sq_gjj").text("有公积金"); 
         }else{
           $("#sq_gjj").text("无公积金"); 
         }
          
        if(user_dkxq.shebao==1){
         $("#sq_sb").text("有社保"); 
         }else{
           $("#sq_sb").text("无社保"); 
         }
         
         $("#sq_xl").text(user_dkxq.xueli);
        if(user_dkxq.fangchan==1){
         $("#sq_fc").text("有房产"); 
         }else{
           $("#sq_fc").text("无房产"); 
         }
        if(user_dkxq.sq_che==1){
         $("#sq_che").text("有车"); 
         }else{
           $("#sq_che").text("无车"); 
         } 
          
         $("#sq_cd").text(user_dkxq.chedaijine);
         
         $("#sq_zmf").text(user_dkxq.zhima);
        
      }
     
     
     
     
     
     
</script>
</body>
</html>