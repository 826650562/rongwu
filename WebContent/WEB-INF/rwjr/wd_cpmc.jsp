<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>产品名称选择</title>
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
	<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<style>

.mui-table-view-cell:after {
	background-color: #fff;
}

input[type=color], input[type=date], input[type=datetime-local], input[type=datetime],
	input[type=email], input[type=month], input[type=number], input[type=password],
	input[type=search], input[type=tel], input[type=text], input[type=time],
	input[type=url], input[type=week], select, textarea {
	line-height: 21px;
	width: 100%;
	height: 40px;
	margin-bottom: 0px;
	padding: 10px;
	-webkit-user-select: text;
	border: 1px solid #e6e6e6;
}

.tag_contrial .active {
	display: inline-block;
	background-color: #fc4023;
	color: #fff;
	white-space: nowrap;
	text-align: center;
	font-size: 14px;
	border: none;
	border-radius: 2px;
	cursor: pointer;
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>

</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">产品标签添加</h1>
	</header>
	<div class="mui-content">
		<div class="szbox">

			<div class="z-row">
				<div class="z-col">
					<input type="text" id="tag_name" placeholder="其他添加">
				</div>
				<div class="padL10">
					<button class="layui-btn cpbqtjbtn">添加</button>
				</div>
			</div>

			<div class="z-row padT15">
				<div class="z-col tag_contrial">
					<c:forEach var="cur" items="${tage_names}">
						<span class="cptjbq mui-table-view-cell"><c:out
								value="${cur}"></c:out></span>
					</c:forEach>
					<!--  <span class="cptjbq cptjbgActive mui-table-view-cell">门槛低</span> -->
				</div>
			</div>

			<div class="z-row">
				<div class="z-col">
					<button class="layui-btn width100 add_cp_tag">确定</button>
				</div>
			</div>

		</div>
	</div>
	<script src="${basePath }/rwjr/js/common.js"></script>
	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
	<script>
		$(function() {
			$(".cpbqtjbtn").click(function() {
				var tag_name = $.trim($("#tag_name").val());
				if (tag_name.length <= 0) {
					return false;
				} else {
					$.ajax({
						url : "add_tage",
						type : "post",
						data : {
							tag : tag_name
						},
						success : function(data) {
							if (data == "wdInfo_101") {
								alert("名称已存在！");
							} else if (data == "wdInfo_100") {
								$(".tag_contrial").append("<span class='cptjbq mui-table-view-cell'>" + tag_name + "</span>");
							}
							addEventer();
						}
					})
				}
	
			});
	
			function addEventer() {
				$(".cptjbq").unbind().click(function() {
					$(".cptjbq").removeClass("active");
					$(this).addClass("active");
				});


                console.info(_getValue(window.location.search));
				$(".add_cp_tag").unbind().click(function() {
					var tag = $.trim($(".tag_contrial .active").text());
                    var info=_getValue(window.location.search);
                    info["tage1"]=tag;
                    window.location.href="tjgrcp?tage1="+info["tage1"]+"&tage2="+info["tage2"];
				});
			 
			}
			addEventer();
		})
	</script>
</body>
</html>