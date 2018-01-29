<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Hello MUI</title>
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
<!--App自定义的css-->
	<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<script src="${basePath }/rwjr/js/common.js"></script>
<style>
.mui-plus .plus {
	display: inline;
}

.plus {
	display: none;
}

#topPopover {
	position: fixed;
	top: 16px;
	right: 6px;
	top: 35px !important;
}

#topPopover .mui-popover-arrow {
	left: auto;
	right: 6px;
}

.mui-popover {
	height: 40px;
}

.mui-popover .mui-popover-arrow:after {
	top: 19px;
	left: 0;
	width: 16px;
	height: 16px;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	border-radius: 3px;
}

.mui-popover {
	width: 100px;
	border-radius: 3px;
}

.dkxxdown {
	padding: 0px !important;
	margin: 0px !important;
	height: 25px;
	line-height: 25px;
	width: 100%;
	text-align: center;
}

.mui-table-view-cell {
	padding: 0px;
	margin: 0px;
}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">贷款信息</h1>
		<!--<a class="mui-icon mui-icon-plusempty mui-pull-right" id="open">fa-ellipsis-v</a>-->
		<a href="#topPopover" id="menu"
			class="mui-icon mui-pull-right topbarright"><i
			class="fa fa-ellipsis-h fa-fw"></i></a>

	</header>
	<div class="mui-content">
		<div class="dkxxbox">


			<div id="topPopover" class="mui-popover">
				<div class="mui-popover-arrow"></div>
				<div class="mui-scroll-wrapper">
					<div class="mui-scroll">
						<ul class="mui-table-view">
							<li class="mui-table-view-cell"><a href="#" class="dkxxdown">再次申请</a>
						</ul>
					</div>
				</div>
			</div>

			<div class="dkxx_box_">

				<div class="z-row dkxxitem" style="display:none">
					<div class="z-col">
						<div class="dkxxyz">
							<img src="${basePath }/rwjr/images/wbqd.png">
						</div>
						<div class="z-row">
							<div class="z-col dkxxcont">
								申请金额：<span class="colorRed">3万</span>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col dkxxtime">申请时间：2018-01-02 12:23:43</div>
						</div>
						<div class="z-row" class="_cance_dingdan" style="display:none">
							<div class="z-col">
								<button class="layui-btn qxddbtn">取消订单</button>
							</div>
						</div>
					</div>
				</div>


				<%-- <div class="z-row dkxxitem">
<div class="z-col">
<div class="dkxxyz"><img src="${basePath }/rwjr/images/ybqd.png"></div>
<div class="z-row">
  <div class="z-col dkxxcont">申请金额：<span class="colorRed">3万</span></div>
</div>
<div class="z-row">
  <div class="z-col dkxxtime">申请时间：2018-01-02 12:23:43</div>
</div>
</div>     
</div>
 --%>


			</div>
		</div>
	</div>


	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
	<script>
		mui.init();
	
		mui.plusReady(function() {});
	
		mui('.mui-scroll-wrapper').scroll();
		mui('body').on('shown', '.mui-popover', function(e) {
			//console.log('shown', e.detail.id);//detail为当前popover元素
		});
		mui('body').on('hidden', '.mui-popover', function(e) {
			//console.log('hidden', e.detail.id);//detail为当前popover元素
		});
	</script>
	<script type="text/javascript">
 $(function(){
    var sjh = getCookie("sqdk_user");
    var name=getCookie("sqdk_name");
    
    if(sjh.length<=0 || name.length<=0){
      window.location.href = 'index';
    }
   	$.ajax({
				url : "getsqdk_list",
				type : "post",
				contentType : "application/x-www-form-urlencoded",
				data : {
					name : name,
					_w_sjh : sjh
				},
				success : function(code) {
					 console.info(code);
				},
				error : function(error) {
					 _msg("内部错误！");
				}
			});
   
 })
 
</script>

</body>
</html>