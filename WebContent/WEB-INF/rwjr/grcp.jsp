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
.mui-table-view-cell:after {background-color: #fff;}
.mui-table-view-cell {padding: 0px;}
</style>

</head>
<body>
<header class="mui-bar mui-bar-nav"> <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">个人产品</h1>
</header>
<div class="mui-content">

<div class="grcptixx">
 <i class="fa fa-info-circle fa-fw"></i>提示：个人产品最多添加6个
</div>

<div class="grcpbox">
 
<div class="grcpitem mui-table-view-cell">
 <div class="z-row gixtbbox">
    <div class="cpitemxtb"> <img src="${basePath }/rwjr/images/gjj.png"></div>
    <div class="z-col cpmc">公积金贷</div>
    <div class="z-col">  </div>
 </div>
 <div class="cjkk">
     <div class="z-row cjktxt">
        <div>预计排名：</div>
        <div class="z-col">出价可看</div>
     </div>
     <div class="z-row cjktxt">
        <div>底价：</div>
        <div class="z-col"><span class="colorRed">40</span>元/单</div>
     </div>
 </div>
 <div class="z-row cpitembtnbox">
    <div class="z-col"><button class="cpitemleftbtn layui-btn"><i class="fa fa-edit fa-fw"></i>编辑</button></div>
    <div class="z-col"><button class="cpitemrightbtn layui-btn"><i class="fa fa-trash fa-fw"></i>删除</button></div>
 </div>
</div> 
  

<div class="grcpitem mui-table-view-cell">
 <div class="z-row gixtbbox">
    <div class="cpitemxtb"> <img src="${basePath }/rwjr/images/xin.png"></div>
    <div class="z-col cpmc">信用贷</div>
    <div class="z-col">  </div>
 </div>
 <div class="cjkk">
     <div class="z-row cjktxt">
        <div>预计排名：</div>
        <div class="z-col">出价可看</div>
     </div>
     <div class="z-row cjktxt">
        <div>底价：</div>
        <div class="z-col"><span class="colorRed">40</span>元/单</div>
     </div>
 </div>
 <div class="z-row cpitembtnbox">
    <div class="z-col"><button class="cpitemleftbtn layui-btn"><i class="fa fa-edit fa-fw"></i>编辑</button></div>
    <div class="z-col"><button class="cpitemrightbtn layui-btn"><i class="fa fa-trash fa-fw"></i>删除</button></div>
 </div>
</div> 



<div class="grcpitem mui-table-view-cell">
 <div class="z-row gixtbbox">
    <div class="cpitemxtb"> <img src="${basePath }/rwjr/images/fang.png"></div>
    <div class="z-col cpmc">房贷</div>
    <div class="z-col">  </div>
 </div>
 <div class="cjkk">
     <div class="z-row cjktxt">
        <div>预计排名：</div>
        <div class="z-col">出价可看</div>
     </div>
     <div class="z-row cjktxt">
        <div>底价：</div>
        <div class="z-col"><span class="colorRed">40</span>元/单</div>
     </div>
 </div>
 <div class="z-row cpitembtnbox">
    <div class="z-col"><button class="cpitemleftbtn layui-btn"><i class="fa fa-edit fa-fw"></i>编辑</button></div>
    <div class="z-col"><button class="cpitemrightbtn layui-btn"><i class="fa fa-trash fa-fw"></i>删除</button></div>
 </div>
</div>



<div class="grcpitem mui-table-view-cell">
 <div class="z-row gixtbbox">
    <div class="cpitemxtb"> <img src="${basePath }/rwjr/images/che.png"></div>
    <div class="z-col cpmc">车贷</div>
    <div class="z-col">  </div>
 </div>
 <div class="cjkk">
     <div class="z-row cjktxt">
        <div>预计排名：</div>
        <div class="z-col">出价可看</div>
     </div>
     <div class="z-row cjktxt">
        <div>底价：</div>
        <div class="z-col"><span class="colorRed">40</span>元/单</div>
     </div>
 </div>
 <div class="z-row cpitembtnbox">
    <div class="z-col"><button class="cpitemleftbtn layui-btn"><i class="fa fa-edit fa-fw"></i>编辑</button></div>
    <div class="z-col"><button class="cpitemrightbtn layui-btn"><i class="fa fa-trash fa-fw"></i>删除</button></div>
 </div>
</div>



</div>



<div class="cpjsbox">
  <div class="smsgrcp">
      <div class="z-row">
         <div class="z-col smscptitle">什么是产品?</div>
      </div>
      <div class="z-row">
         <div class="z-col smscptxt">推广个人产品前，信贷经理需通过个人实名和工作认证；设置的客户条件越宽松，获取的客户几率越大；如有任何疑问，请拨打客服热线：021-000000（工作时间：9:00-18:00）</div>
      </div>
  </div>
  <div class="wxtsbox">
      <div class="z-row">
         <div class="z-col grcpwxtstitle"><i class="fa fa-info-circle fa-fw"></i>温馨提示：</div>
      </div>
      <div class="z-row">
         <div class="z-col grcpwxtstxt">推广个人产品前，信贷经理需通过个人实名和工作认证；设置的客户条件越宽松，获取的客户几率越大；如有任何疑问，请拨打客服热线：021-000000（工作时间：9:00-18:00）</div>
      </div>
  </div>
</div>


<div class="z-row tjcpbtnbox">
  <div class="z-col">
     <button class="layui-btn width100">添加产品</button>
  </div>
</div>


</div>

<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>

</body>
</html>