<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加微店产品</title>
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
</style>

</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a href="grcp_wd" class="mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">添加微店产品</h1>
	</header>
	<div class="mui-content">
		<div class="szbox">

			<div class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">产品名称</div>
				<div class="z-col sztstxt" id="project_name">
					<a href="javascript:;"  >请填写</a>
				</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>

			<div class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">产品特点</div>
				<div class="z-col sztstxt" id="project_td">
					<a href="javascript:;" >请填写</a>
				</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>


			<div id='showFuWu' class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">服务种类</div>
				<div id='fuWuResult' class="z-col sztstxt">请选择</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>

			<div id='showDaiKuan' class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">贷款方式</div>
				<div id='daiKuanResult' class="z-col sztstxt">请选择</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>

			<div class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">月利率范围</div>
				<div class="z-col sztstxt" id='_ylvfw'>面议</div>
			 <div class="xxbcrjt">
				 &nbsp;&nbsp;&nbsp;
				</div>
			</div>

			<div class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">一次性办理手续费</div>
				<div class="z-col sztstxt" id='ycxsf'>面议</div>
			  <div class="xxbcrjt">
				  &nbsp;&nbsp;&nbsp;
				</div>
			</div>

		<%--	<div class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">
					所需材料<span class="color666">（可多选）</span>
				</div>
				<div class="z-col sztstxt" id='sxcl'>无要求可不选</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>--%>

			<div id='showUserPicker' class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">放款额度</div>
				<div id='userResult' class="z-col sztstxt ui-alert">请选择</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>


			<div id='showSendTime' class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">放款时间</div>
				<div id='sendTimeResult' class="z-col sztstxt">请选择</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>

			<div id='showDaiQi' class="z-row szitem  mui-table-view-cell">
				<div class="xxbcltxt">贷款期限</div>
				<div id='daiQiResult' class="z-col sztstxt">请选择</div>
				<div class="xxbcrjt">
					<i class="fa fa-angle-right fa-lg"></i>
				</div>
			</div>


			<div class="z-row marT15">
				<div class="z-col">
					<a href="javascript:;" id="submit_cp" class="layui-btn width100">下一步</a>
				</div>
			</div>

		</div>
	</div>

	<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
	<script type="text/javascript"
		src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
	<script
		src="${basePath }/rwjr/mui-master/examples/hello-mui/js/mui.picker.js"></script>
	<script
		src="${basePath }/rwjr/mui-master/examples/hello-mui/js/mui.poppicker.js"></script>
	<script
		src="${basePath }/rwjr/mui-master/examples/hello-mui/js/city.data.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${basePath }/rwjr/mui-master/examples/hello-mui/js/city.data-3.js"
		type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
	<script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
	<script src="${basePath }/rwjr/js/common.js"></script>
	<script language="javascript">
        //防止页面后退
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
	</script>
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
	
				//服务种类
				var fuWuPicker = new $.PopPicker();
				fuWuPicker.setData([ {
					value : 'ywj',
					text : '出借服务'
				}, {
					value : 'aaa',
					text : '中介服务'
				}, {
					value : 'lj',
					text : '担保服务'
				} ]);
				var showFuWuButton = doc.getElementById('showFuWu');
				var fuWuResult = doc.getElementById('fuWuResult');
				showFuWuButton.addEventListener('tap', function(event) {
					fuWuPicker.show(function(items) {
						fuWuResult.innerText = items[0].text;
					//返回 false 可以阻止选择框的关闭
					//return false;
					});
				}, false);
	
	
				//贷款方式
				var daiKuanPicker = new $.PopPicker();
				daiKuanPicker.setData([ {
					value : 'ywj',
					text : '信用贷款'
				}, {
					value : 'aaa',
					text : '企业贷款'
				}, {
					value : 'lj',
					text : '房产贷款'
				}, {
					value : 'aaa',
					text : '车产贷款'
				}, {
					value : 'lj',
					text : '应急贷款'
				}, {
					value : 'aaa',
					text : '担保贷'
				}, {
					value : 'lj',
					text : '信用卡'
				} ]);
				var showDaiKuanButton = doc.getElementById('showDaiKuan');
				var daiKuanResult = doc.getElementById('daiKuanResult');
				showDaiKuanButton.addEventListener('tap', function(event) {
					daiKuanPicker.show(function(items) {
						daiKuanResult.innerText = items[0].text;
					//返回 false 可以阻止选择框的关闭
					//return false;
					});
				}, false);
	
	
				//放款额度
				var userPicker = new $.PopPicker();
				userPicker.setData([ {
					value : 'ywj',
					text : '1-5万'
				}, {
					value : 'aaa',
					text : '5-10万'
				}, {
					value : 'lj',
					text : '10-15万'
				}, {
					value : 'ymt',
					text : '15-20万'
				}, {
					value : 'shq',
					text : '20-25万'
				}, {
					value : 'zhbh',
					text : '25-30万'
				}, {
					value : 'zhy',
					text : '30-35万'
				}, {
					value : 'gyf',
					text : '35-40万'
				}, {
					value : 'zhz',
					text : '40-45万'
				}, {
					value : 'gezh',
					text : '45-50万'
				} ]);
				var showUserPickerButton = doc.getElementById('showUserPicker');
				var userResult = doc.getElementById('userResult');
				showUserPickerButton.addEventListener('tap', function(event) {
					userPicker.show(function(items) {
						userResult.innerText = items[0].text;
					//返回 false 可以阻止选择框的关闭
					//return false;
					});
				}, false);

				//放款时间
				var sendTime = new $.PopPicker();
				sendTime.setData([ {
					value : 'ywj',
					text : '5-10天'
				}, {
					value : 'aaa',
					text : '5-15天'
				}, {
					value : 'lj',
					text : '5-20天'
				}, {
					value : 'ymt',
					text : '5-25天'
				} ]);
				var showSendTimeButton = doc.getElementById('showSendTime');
				var sendTimeResult = doc.getElementById('sendTimeResult');
				showSendTimeButton.addEventListener('tap', function(event) {
					sendTime.show(function(items) {
						sendTimeResult.innerText = items[0].text;
					//返回 false 可以阻止选择框的关闭
					//return false;
					});
				}, false);

				//贷款期限
				var daiQi = new $.PopPicker();
				daiQi.setData([ {
					value : 'ywj',
					text : '1-5个月'
				}, {
					value : 'aaa',
					text : '1-10个月'
				}, {
					value : 'lj',
					text : '1-15个月'
				}, {
					value : 'ymt',
					text : '1-20个月'
				}, {
					value : 'shq',
					text : '1-25个月'
				}, {
					value : 'zhbh',
					text : '1-30个月'
				} ]);
				var showDaiQiButton = doc.getElementById('showDaiQi');
				var daiQiResult = doc.getElementById('daiQiResult');
				showDaiQiButton.addEventListener('tap', function(event) {
					daiQi.show(function(items) {
						daiQiResult.innerText = items[0].text;
					//返回 false 可以阻止选择框的关闭
					//return false;
					});
				}, false);
	
			});
		})(mui, document);
	</script>
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
				$("#project_name").find("a").text(d.cpmc);
				$("#project_td").find("a").text(d.cptd);
				$("#fuWuResult").text(d.fwzl);
				$("#daiKuanResult").text(d.dkfs);
				$("#_ylvfw").text(d.llfw);
				$("#ycxsf").text(d.sxf);
				$("#sxcl").text(d.sxcl);
				$("#userResult").text(d.ed);
				$("#daiQiResult").text( d.fksj);
				$("#sendTimeResult").text(d.dkqx);
			}


            var info=_getValue(window.location.search);
			var tage1=decodeURI(info["tage1"]);
            var tage2=decodeURI(info["tage2"]);
			if(tage1=="undefined"){
                tage1="请选择"
			}
            if(tage2=="undefined"){
                tage2="请选择"
            }

			$("#project_name").find("a").text(tage1);
			$("#project_td").find("a").text(tage2);


			 $("#project_name").click(function () {
                var info=_getValue(window.location.search);
                if(!info["tage1"]){
                    info["tage1"]='';
				}
                 if(!info["tage2"]){
                     info["tage2"]='';
                 }
				window.location.href="proect_name?tage1="+info["tage1"]+"&tage2="+info["tage2"];
            });

            $("#project_td").click(function () {
                var info=_getValue(window.location.search);
                if(!info["tage1"]){
                    info["tage1"]='';
                }
                if(!info["tage2"]){
                    info["tage2"]='';
                }
                window.location.href="proect_tedian?tage1="+info["tage1"]+"&tage2="+info["tage2"];
            });

			$("#submit_cp").unbind().click(function() {
				var v = checkout();
				if (v) {
					if (_id) {
						v['id'] = _id;
						$.ajax({
							url : "updatecp_wd",
							type : "post",
							data : v,
							success : function(data) {
								if (data == "wdInfo_101") {
									_msg("错误！");
								} else if (data == "wdInfo_100") {
									window.location.href = "wd_cpdkYq?_id="+_id;
								}
							}
						})
	
					} else {
						$.ajax({
							url : "addcp_wd",
							type : "post",
							data : v,
							success : function(data) {
								if (data == "wdInfo_101") {
									_msg("错误！");
								} else if (data == "wdInfo_100") {
									window.location.href = "wd_cpdkYq";
								}
							}
						})
					}
				}
	
			});
	
			function checkout() {
				var issubmit = true;
				var name = $.trim($("#project_name").find("a").text());
				var project_td = $.trim($("#project_td").find("a").text());
				var fuWuResult = $.trim($("#fuWuResult").text());
				var daiKuanResult = $.trim($("#daiKuanResult").text());
	
				var _ylvfw = $.trim($("#_ylvfw").text());
				var ycxsf = $.trim($("#ycxsf").text());
				var sxcl = $.trim($("#sxcl").text());
				var ed = $.trim($("#userResult").text());
	
				var showDaiQi = $.trim($("#daiQiResult").text());
				var sendTimeResult = $.trim($("#sendTimeResult").text());
	
				if (name == "请选择" || name == "") {
					_msg("产品名称不能为空！");
					issubmit = false;
				}
				if (project_td == "请选择" || project_td == "") {
					_msg("产品特点不能为空！");
					issubmit = false;
				}
				if (fuWuResult == "请选择" || fuWuResult == "") {
					_msg("服务种类不能为空！");
					issubmit = false;
				}
	
				if (daiKuanResult == "请选择" || daiKuanResult == "") {
					_msg("贷款方式不能为空！");
					issubmit = false;
				}
	
				var name = $.trim($("#project_name").find("a").text());
				var project_td = $.trim($("#project_td").find("a").text());
				var fuWuResult = $.trim($("#fuWuResult").text());
				var daiKuanResult = $.trim($("#daiKuanResult").text());
	
	
				var _ylvfw = $.trim($("#_ylvfw").text());
				var ycxsf = $.trim($("#ycxsf").text());
				var sxcl = $.trim($("#sxcl").text());
				var ed = $.trim($("#userResult").text());
	
				var showDaiQi = $.trim($("#daiQiResult").text());
				var sendTimeResult = $.trim($("#sendTimeResult").text());
	
				var value = {
					name : name,
					project_td : project_td,
					fuWuResult : fuWuResult,
					daiKuanResult : daiKuanResult,
					_ylvfw : _ylvfw == '面议' ? '' : _ylvfw,
					ycxsf : ycxsf == '面议' ? '' : ycxsf,
					sxcl : sxcl == '无要求可不选' ? '' : sxcl,
					ed : ed == '请选择' ? '' : ed,
					showDaiQi : showDaiQi == '请选择' ? '' : showDaiQi,
					sendTimeResult : sendTimeResult == '请选择' ? '' : sendTimeResult
				}
				if (issubmit)
					return value;
				else
					return issubmit;
			}
	
		})
	</script>
</body>
</html>