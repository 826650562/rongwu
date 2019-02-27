<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    pageContext.setAttribute("basePath", request.getContextPath());
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <title>融五金融-申请认证</title>
    <!--<link rel="icon" href="images/ico.png" type="image/x-icon">-->
    <link href="layui/css/layui.css" rel="stylesheet" type="text/css">
    <link href="fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/z-layout.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<!--
<div class="z-row">
    <div class="z-col"> </div>
</div>
-->


<div class="main">

    <div class="topbar">
        <div class="z-row">
            <a href="sjrz">
                <div class="topbarleft">
                    <i class="fa fa-chevron-left fa-fw"> </i>
                    <script language="javascript">
                        //防止页面后退
                        history.pushState(null, null, "${basePath }/rwjr/sqrz");
                    </script>
                </div>
            </a>
            <div class="z-col topbarcenter">申请认证</div>
            <div class="topbarright"></div>
        </div>
    </div>

    <div class="pad15">


        <a href="#" id="_sfzsqrz">
            <div class="z-row rzsq">
                <div class="sjrzxtb"><img src="${basePath }/rwjr/images/sfzxtb.png"></div>
                <div class="z-col rzsqtxt colorRed">身份认证</div>
                <div class="rzsqjt"><i class="fa fa-angle-right fa-2x"></i></div>
            </div>
        </a>


        <a href="#" id="_gzzrz">
            <div class="z-row rzsq">
                <div class="sjrzxtb"><img src="${basePath }/rwjr/images/gpxtb.png"></div>
                <div class="z-col rzsqtxt colorZise">工作认证</div>
                <div class="rzsqjt"><i class="fa fa-angle-right fa-2x"></i></div>
            </div>
        </a>

    </div>


    <div class="z-row">
        <div class="z-col topbarcenter notg" style="display:none; float: left; width: 100%"><font color="red">审核失败,请根据失败信息重新填写！</font></div>
    </div>

    <div class="z-row">
        <div class="z-col topbarcenter notgMsg" style="display:none; float: left; width: 100%"><font></font></div>    </div>

    <div class="z-row">
        <div class="z-col topbarcenter yestg"  style="display:none;  float: left;width: 100%"><font color="green">审核已通过！</font></div>    </div>

    <div class="z-row">
        <div class="z-col topbarcenter tging"  style="display:none; float: left; width: 100%"><font color="green">提交信息审核中！</font></div>    </div>

</div>
<script>
    $(function () {
        var passInfo="${passInfo}";
        var ispass="${ispass}";

       if(passInfo && ispass ){
           switch(ispass)
           {
               case '0':
                   //审核中
                   $(".tging").css("display","block");
                   break;
               case '1':
                   $(".notg").css("display","block");
                   $(".notgMsg").css("display","block").find("font").text("审核返回内容："+passInfo);
                   break;
               case '2':
                   $(".yestg").css("display","block");
                   break;
               default:

           }
       }


        $("#_sfzsqrz").click(function () {
            window.location.href = "${basePath }/sfzyz/sfzrz";
        });

        $("#_gzzrz").click(function () {
            window.location.href = "${basePath }/gzyz/index";
        });
    })
</script>

</body>
</html>