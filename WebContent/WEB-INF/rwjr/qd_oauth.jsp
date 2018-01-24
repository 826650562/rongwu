<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>抢单登陆授权</title>
<script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
</head>
<body>
	<script>
		//请求用户基本信息
		if (!getCookie("wexinOpenId")) {
			var url = encodeURI("http://www.80wangjian.com/springmvc/wyqd/getuserInfo");
			url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc3691f09dbfd769d&redirect_uri=" + url + "&response_type=code&scope=snsapi_userinfo&state=index.html#wechat_redirect";
		    window.location.href=url
		}
	</script>
</body>
</html>