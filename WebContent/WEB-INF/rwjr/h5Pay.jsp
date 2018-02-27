<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<html>
<head>
<title>确认支付</title>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
</head>
<body>
	<input type="hidden" name="appId" value="${appId}">
	<input type="hidden" name="nonceStr" value="${nonceStr}">
	<input type="hidden" name="prepayId" value="${prepayId}">
	<input type="hidden" name="paySign" value="${paySign}">
	<input type="hidden" name="timeStamp" value="${timeStamp}">
	<input type="hidden" name="jine" value="${jine}">
</body>
<script>
	function onBridgeReady() {
		var appId = $("input[name='appId']").val();
		var nonceStr = $("input[name='nonceStr']").val();
		var prepayId = $("input[name='prepayId']").val();
		var paySign = $("input[name='paySign']").val();
		var timeStamp = $("input[name='timeStamp']").val();
		var jine = $("input[name='jine']").val();
		var data={
			"appId" : appId,
			"timeStamp" : timeStamp,
			"nonceStr" : nonceStr,
			"package" : prepayId,
			"signType" : "MD5",
			"paySign" : paySign
		};
		

		WeixinJSBridge.invoke('getBrandWCPayRequest',data , function(res) {
			if (res.err_msg == "get_brand_wcpay_request:ok") {
				alert("支付成功！");
				//存放数据库
                data.jine=jine;
                insetJl(data)
				//location.href = "http://wxpay.pes-soft.com/wxpay/";
			} else { //这里支付失败和支付取消统一处理
				location.href = "http://wxpay.pes-soft.com/wxpay/";
			}
		});
	}
	
	function insetJl(data){
	  //将记录存放数据库
	   	$.ajax({
		url : "weChat/insetJl",
		type : "post",
		contentType : "application/x-www-form-urlencoded",
		data :  data,
		success : function(d) {
		   		alert(d);  
		 }
	   })
	}

	$(document).ready(
		function() {
			if (typeof WeixinJSBridge == "undefined") {
				if (document.addEventListener) {
					document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
				} else if (document.attachEvent) {
					document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
					document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
				}
			} else {
				onBridgeReady();
			}
		});
</script>
</html>