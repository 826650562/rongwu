<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登陆授权</title>
</head>
<body>
	<script>
		//请求用户基本信息
		var url = encodeURI("http://www.80wangjian.com/springmvc/wyqd/getuserInfo");
		url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc3691f09dbfd769d&redirect_uri=" + url + "&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
		window.location.href = url;
	</script>
</body>
</html>