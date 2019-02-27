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
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
    <script type="text/javascript"
            src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<link href="${basePath }/rwjr/rwjrht/layui/css/layui.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/rwjrht/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/rwjrht/css/z-layout.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/rwjrht/css/style.css" rel="stylesheet" type="text/css">
<!--App自定义的css-->
<style type="text/css">
  html,body{height:100%;}
  body{background:url(${basePath }/rwjr/rwjrht/images/htloginbg.jpg) no-repeat top center;}
</style>
</head>
<body>


<div class="z-row loginbox">
  <div class="z-col"></div>
  <div>
     <div class="logincentbox">
        <div class="logintitle">系统登录</div>
        <div class="loginmain">
          <div class="z-row loginInput">
             <div class="loginInputXtb">
                 <i class="fa fa-user-circle-o fa-fw"></i>
              </div>
              <div class="z-col">
                 <input type="text" placeholder="用户名" class="loginTxtInput loginTxtInputUser">
              </div>
          </div>
          <div class="z-row loginInput">
             <div class="loginInputXtb">
                 <i class="fa fa-key fa-fw"></i>
              </div>
              <div class="z-col">
                 <input type="password" placeholder="密码" class="loginTxtInput loginTxtInputParrword">
              </div>
          </div>
          <div class="z-row marT20">
          <div class="z-col">
             <button class="layui-btn width100  chekout_login">登录</button>
          </div>
       </div>
        </div>
     </div>
  </div>
  <div class="z-col"> </div>
</div>

<script>
   $(function () {
        $(".chekout_login").unbind().click(function () {
            $.ajax({
                url : "checkLogin?date=" + new Date(),
                type : "post",
                contentType : "application/x-www-form-urlencoded",
                data:{
                    user: $(".loginTxtInputUser").val(),
                    Parrword:$(".loginTxtInputParrword").val()
                },
                success : function() {
                     window.location.href="xdjlsfshsq";
                },
                error : function(error) {
                    alert("系统错误！");
                }
            });

        });
   })
    
</script>
</body>
</html>










