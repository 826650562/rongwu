<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>产品标签</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!--标准mui.css-->
<link rel="stylesheet" href="${basePath }/rwjr/mui-master/dist/css/mui.min.css">
<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="${basePath }/rwjr/mui-master/examples/hello-mui/css/app.css" />
<link href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.picker.css" rel="stylesheet" />
<link href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.poppicker.css" rel="stylesheet" />

<style>
.mui-table-view-cell:after {
    background-color: #fff;
}
input[type=color], input[type=date], input[type=datetime-local], input[type=datetime], input[type=email], input[type=month], input[type=number], input[type=password], input[type=search], input[type=tel], input[type=text], input[type=time], input[type=url], input[type=week], select, textarea {
    line-height: 21px;
    width: 100%;
    height: 40px;
    margin-bottom: 0px;
    padding: 10px;
    -webkit-user-select: text;
    border: 1px solid #e6e6e6;
}
</style>

</head>
<body>
<header class="mui-bar mui-bar-nav"> <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">产品标签添加</h1>
</header>
<div class="mui-content">
  <div class="szbox">

       <div class="z-row">
          <div class="z-col"> <input type="text" placeholder="其他添加"></div>
          <div class="padL10"><button class="layui-btn cpbqtjbtn">添加</button></div>
       </div>
            
       <div class="z-row padT15">
          <div class="z-col">
             <span class="cptjbq mui-table-view-cell">到账快</span>
             <span class="cptjbq cptjbgActive mui-table-view-cell">门槛低</span>
             <span class="cptjbq mui-table-view-cell">额度高</span>
             <span class="cptjbq mui-table-view-cell">灵活还款</span>
             <span class="cptjbq mui-table-view-cell">无抵押</span>
             <span class="cptjbq mui-table-view-cell">最快2小时到款</span>
             <span class="cptjbq mui-table-view-cell">全程网络操作</span>
             <span class="cptjbq mui-table-view-cell">月入2k就可放款</span>
          </div>
        </div>
        
        <div class="z-row">
           <div class="z-col"><button class="layui-btn width100">确定</button></div>
        </div>
  </div>
</div>

<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>

</body>
</html>