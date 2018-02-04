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
<title>设置公司名称</title>
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
	<div class="main">

		<div class="topbar">
			<div class="z-row">
				<div class="topbarleft">
					<i class="fa fa-chevron-left fa-fw"></i>
				</div>
				<div class="z-col topbarcenter">公司名称修改</div>
				<div class="topbarright"></div>
			</div>
		</div>

		<div class=" pad15">

			<div class="z-row loginInput">
				<div class="sfzrzitemtxt">公司名称：</div>
				<div class="z-col">
					<input type="text" placeholder="请输入" class="zInput">
				</div>
			</div>
			<div class="z-row marT15">
				<div class="z-col">
					<button class="layui-btn width100" id='submit'>确定</button>
				</div>
			</div>

		</div>

	</div>
</body>
<script>
	$(function() {
		var search = window.location.href.split("#")[1];
		var searchs=search.split(",");
		if (search && searchs) {
			$(".zInput").val(searchs[0]);
		}

		$("#submit").click(function() {
			var text = $(".zInput").val()
			if ($.trim(text).length > 0) {
				$.ajax({
					url : "updateInfo?date=" + new Date(),
					type : "post",
					contentType : "application/x-www-form-urlencoded",
					data : {
						value : text,
						info:'gsmc',
						id:searchs[1]
					},
					success : function(code) {
						console.info(code);
						if(code=='updateInfo_100'){
						 _msg("修改成功！",function(){
						   window.location.href='grxx_xg';
						 })
						  window.location.href='grxx_xg';
						} 
					},
					error : function(error) {
						_msg("系统错误！");
					}
				});
			} else {
				_msg("公司名称不能为空！");
			}
		});

	})
</script>



</html>