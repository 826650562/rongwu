<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人产品</title>
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

<style>
.mui-table-view-cell:after {
	background-color: #fff;
}

.mui-table-view-cell {
	padding: 0px;
}
</style>

</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a href="wyqdjsp" class=" mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">个人产品</h1>
	</header>
	<div class="mui-content">

		<div class="grcptixx">
			<i class="fa fa-info-circle fa-fw"></i>提示：个人产品最多添加6个
		</div>

		<div class="grcpbox"></div>



		<div class="cpjsbox">
			<div class="smsgrcp">
				<div class="z-row">
					<div class="z-col smscptitle">什么是产品?</div>
				</div>
				<div class="z-row">
					<div class="z-col smscptxt">个人产品是客户可以直观看到的客户经理的代理业务的说明。</div>
				</div>
			</div>
			<div class="wxtsbox">
				<div class="z-row">
					<div class="z-col grcpwxtstitle">
						<i class="fa fa-info-circle fa-fw"></i>温馨提示：
					</div>
				</div>
				<div class="z-row">
					<div class="z-col grcpwxtstxt">推广个人产品前，信贷经理需通过个人实名和工作认证；设置的客户条件越宽松，获取的客户几率越大；如有任何疑问，请拨打客服热线：021-000000（工作时间：9:00-18:00）</div>
				</div>
			</div>
		</div>


		<div class="z-row tjcpbtnbox">
			<div class="z-col">
				<a href="${basePath }/wyqd/tjgrcp"><button
						class="layui-btn width100">添加产品</button></a>
			</div>
		</div>

	</div>

	<script language="javascript">
        //防止页面后退
        history.pushState(null, null, document.URL);

	</script>
	<script type="text/javascript"
		src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
	<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
	<script src="${basePath }/rwjr/js/common.js"></script>
	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
	<script>
		$(function() {
			function getinfo() {
				$.ajax({
					url : "searchcp_wd",
					type : "post",
					success : function(data) {
						var d = JSON.parse(data);
						if (d.length >= 6) {
							$(".tjcpbtnbox").hide();
						} else
							$(".tjcpbtnbox").show();
						var h = "";
						d.map(function(d1) {
							h += getHtml(d1);
						});
						$(".grcpbox").append(h);
						addeventlisert();
					}
				})
			}
	
	
			function getHtml(data) {
			     
				return '<div _id=' + data.id + ' class="grcpitem mui-table-view-cell">' +
					'<div class="z-row gixtbbox">' +
					'<div class="cpitemxtb">' +
					'<div class="imgcirlce">'+data.cpmc[0]+'</div> </div> <div class="z-col cpmc" >' + data.cpmc + '</div>' +
					'<div class="z-col"></div> </div>' +
					'<div class="cjkk">' +
					'<div class="z-row cjktxt">' +
					'<div>服务类型：</div> <div class="z-col">'+data.dkfs+'</div></div>' +
					'<div class="z-row cjktxt"> <div>特点：</div> <div class="z-col">' +
					'<span class="colorRed">'+data.cptd+'</span> </div> </div> </div>' +
					'<div class="z-row cpitembtnbox">' +
					'<div class="z-col">' +
					'<button class="cpitemleftbtn layui-btn  cpitemleftbtn_edit">' +
					'<i class="fa fa-edit fa-fw" ></i>编辑 </button> </div>' +
					'<div class="z-col"> <button class="cpitemrightbtn layui-btn cpitemleftbtn_delete" >' +
					'<i class="fa fa-trash fa-fw"></i>删除 </button> </div> </div> </div>';
			}
	
			function addeventlisert() {
				$(".cpitemleftbtn_edit").unbind().click(function() {
					var id = $(this).parents(".grcpitem").attr("_id");
					window.location.href = 'tjgrcp?_id=' + id;
				});
				$(".cpitemleftbtn_delete").unbind().click(function() {
					var id = $(this).parents(".grcpitem").attr("_id");
					xunwenkuang("是否确认删除？", [ "确认", "取消" ], function(index) {
						layer.close(index);
						$.ajax({
							url : "deletecp_wd",
							type : "post",
							data : {
								_id : id
							},
							success : function(data) {
								var d = JSON.parse(data);
								if (d.length >= 6) {
									$(".tjcpbtnbox").hide();
								} else
									$(".tjcpbtnbox").show();
								$(".grcpbox").html("");
								var h = "";
								d.map(function(d1) {
									h += getHtml(d1);
								});
								$(".grcpbox").append(h);
								addeventlisert();
							}
						})
	
					}, function() {})
	
				});
	
			}
	
			getinfo();
		})
	</script>

</body>
</html>