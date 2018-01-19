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

<!--标准mui.css-->
<link rel="stylesheet" href="${basePath }/rwjr/mui-master/dist/css/mui.min.css">
<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script> 
<script type="text/javascript" src="${basePath }/rwjr/js/wyqd_index.js"></script>
<!--App自定义的css-->

<style>
.mui-control-content .mui-loading {margin-top: 50px;}
html,body{height:100%;}
.mui-content{height:100%;}
.mui-slider{height:100%;}
.mui-slider-group{height:100%;}
.mui-control-content{height:100%;}



.mui-grid-view.mui-grid-9 {
    border-top: 1px solid #e6e6e6;
    border-left: 1px solid #e6e6e6;
    background-color: #fff;
}



</style>

</head>

<body>
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">我要抢单</h1>
</header>

<div class="mui-content">
<!-------------------------------------------->
<!-------------------------------------------->
<!---------第1页 tab 页 html start------------>
<!-------------------------------------------->
<!-------------------------------------------->
<div id="tabbar" class="mui-control-content mui-active">
<div id="slider" class="mui-slider">
<div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
<a class="mui-control-item" href="#item1mobile">全部项目</a>
<a class="mui-control-item" href="#item2mobile">优质客户</a>
</div>
<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-6"></div>
<div class="mui-slider-group">
<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
<div id="scroll1" class="mui-scroll-wrapper">
<div class="mui-scroll">
<!--tab cont1 start-->                                  
<div class="qdsx">
<div class="z-row">
<div class="z-col"> 
 <span class="zcsx">有房产</span>
 <span class="zcsx">有车产</span>
 <span class="zcsx">有社保</span>
 <span class="zcsxactive">有公积金</span>
 <span class="zcsx">上班族</span>
</div>
</div>
</div>

<div class="qdlist">
<div class="z-row"><!--tiaojian start-->
<div class="z-col">
 <div class="z-row">
    <div class="z-col tabletitle">发布时间</div>
    <div class="pxxtb">
       <i class="fa fa-caret-up fa-fw"></i>
       <i class="fa fa-caret-down fa-fw"></i>
    </div>
 </div>
</div>
<div class="z-col">
 <div class="z-row">
    <div class="z-col tabletitle">金额</div>
    <div class="pxxtb">
       <i class="fa fa-caret-up fa-fw"></i>
       <i class="fa fa-caret-down fa-fw"></i>
    </div>
 </div>
</div>
<div class="z-col">
 <div class="z-row">
    <div class="z-col tabletitle">价格</div>
    <div class="pxxtb">
       <i class="fa fa-caret-up fa-fw"></i>
       <i class="fa fa-caret-down fa-fw"></i>
    </div>
 </div>
</div>
<div class="z-col">
 <div class="z-row">
    <div class="z-col tabletitle">上海市</div>
    <div class="diquxtb">
       <i class="fa fa-chevron-down fa-fw"></i>
    </div>
 </div>
</div>
</div><!--tiaojian end-->

<div class="z-row qdliitem">
<div class="z-col">
<a href="dkrxx.html">
<div class="z-row wyqdtopbox">
  <div class="wyqdname"><strong>张先锋</strong></div>
  <div class="z-col wyqdcash colorRed">1万元</div>
  <div class="wyqdwxxtb"><i class="fa fa-street-view fa-fw"></i></div>
  <div class=" wyqdaddr">上海市--嘉定区</div>
</div>
<div class="z-row">
  <div class="z-col wyqditemcont">上班族，普通企业，29岁，男，月光族，月代发6000元，芝麻信用400分，有社保，信用良好</div>
</div>
<div class="z-row">
  <div class="z-col wyqdtime">申请时间：刚刚</div>
</div>
<div class="z-row wyqditemcz">
  <div class="z-col wyqdckxq"><a href="#">查看详情</a></div>
  <div class="z-col qdbutton">
    <span class="qdxtb"><img src="${basePath }/rwjr/images/qiang.png"></span>
    <a href="#" class="colorRed">20元抢单</a>
  </div>
</div>
</a>
</div>     
</div>

<div class="z-row qdliitem">
<div class="z-col">
<a href="dkrxx.html">
<div class="z-row wyqdtopbox">
  <div class="wyqdname"><strong>张先锋</strong></div>
  <div class="z-col wyqdcash colorRed">1万元</div>
  <div class="wyqdwxxtb"><i class="fa fa-street-view fa-fw"></i></div>
  <div class=" wyqdaddr">上海市--嘉定区</div>
</div>
<div class="z-row">
  <div class="z-col wyqditemcont">上班族，普通企业，29岁，男，月光族，月代发6000元，芝麻信用400分，有社保，信用良好</div>
</div>
<div class="z-row">
  <div class="z-col wyqdtime">申请时间：刚刚</div>
</div>
<div class="z-row wyqditemcz">
  <div class="z-col wyqdckxq"><a href="#">查看详情</a></div>
  <div class="z-col qdbutton">
    <span class="qdxtb"><img src="${basePath }/rwjr/images/qiang.png"></span>
    <a href="#" class="colorRed">20元抢单</a>
  </div>
</div>
</a>
</div>     
</div>

<div class="z-row qdliitem">
<div class="z-col">
<a href="dkrxx.html">
<div class="z-row wyqdtopbox">
  <div class="wyqdname"><strong>张先锋</strong></div>
  <div class="z-col wyqdcash colorRed">1万元</div>
  <div class="wyqdwxxtb"><i class="fa fa-street-view fa-fw"></i></div>
  <div class=" wyqdaddr">上海市--嘉定区</div>
</div>
<div class="z-row">
  <div class="z-col wyqditemcont">上班族，普通企业，29岁，男，月光族，月代发6000元，芝麻信用400分，有社保，信用良好</div>
</div>
<div class="z-row">
  <div class="z-col wyqdtime">申请时间：刚刚</div>
</div>
<div class="z-row wyqditemcz">
  <div class="z-col wyqdckxq"><a href="#">查看详情</a></div>
  <div class="z-col qdbutton">
    <span class="qdxtb"><img src="${basePath }/rwjr/images/qiang.png"></span>
    <a href="#" class="colorRed">20元抢单</a>
  </div>
</div>
</a>
</div>     
</div>

<div class="z-row qdliitem">
<div class="z-col">
<a href="dkrxx.html">
<div class="z-row wyqdtopbox">
  <div class="wyqdname"><strong>张先锋</strong></div>
  <div class="z-col wyqdcash colorRed">1万元</div>
  <div class="wyqdwxxtb"><i class="fa fa-street-view fa-fw"></i></div>
  <div class=" wyqdaddr">上海市--嘉定区</div>
</div>
<div class="z-row">
  <div class="z-col wyqditemcont">上班族，普通企业，29岁，男，月光族，月代发6000元，芝麻信用400分，有社保，信用良好</div>
</div>
<div class="z-row">
  <div class="z-col wyqdtime">申请时间：刚刚</div>
</div>
<div class="z-row wyqditemcz">
  <div class="z-col wyqdckxq"><a href="#">查看详情</a></div>
  <div class="z-col qdbutton">
    <span class="qdxtb"><img src="${basePath }/rwjr/images/qiang.png"></span>
    <a href="#" class="colorRed">20元抢单</a>
  </div>
</div>
</a>
</div>     
</div>

<div class="z-row qdliitem">
<div class="z-col">
<a href="dkrxx.html">
<div class="z-row wyqdtopbox">
  <div class="wyqdname"><strong>张先锋</strong></div>
  <div class="z-col wyqdcash colorRed">1万元</div>
  <div class="wyqdwxxtb"><i class="fa fa-street-view fa-fw"></i></div>
  <div class=" wyqdaddr">上海市--嘉定区</div>
</div>
<div class="z-row">
  <div class="z-col wyqditemcont">上班族，普通企业，29岁，男，月光族，月代发6000元，芝麻信用400分，有社保，信用良好</div>
</div>
<div class="z-row">
  <div class="z-col wyqdtime">申请时间：刚刚</div>
</div>
<div class="z-row wyqditemcz">
  <div class="z-col wyqdckxq"><a href="#">查看详情</a></div>
  <div class="z-col qdbutton">
    <span class="qdxtb"><img src="${basePath }/rwjr/images/qiang.png"></span>
    <a href="#" class="colorRed">20元抢单</a>
  </div>
</div>
</a>
</div>     
</div>

<div class="bnavblank"> </div> <!---blank-->
</div>
<!--tab cont1 end-->                  
</div>
</div>
</div>
<div id="item2mobile" class="mui-slider-item mui-control-content">
<div id="scroll2" class="mui-scroll-wrapper">
<div class="mui-scroll">
<!--tab cont2 start-->
<div class="qdlist">
<div class="z-row"><!--tiaojian start-->
<div class="z-col">
 <div class="z-row">
    <div class="z-col tabletitle">发布时间</div>
    <div class="pxxtb">
       <i class="fa fa-caret-up fa-fw"></i>
       <i class="fa fa-caret-down fa-fw"></i>
    </div>
 </div>
</div>
<div class="z-col">
 <div class="z-row">
    <div class="z-col tabletitle">金额</div>
    <div class="pxxtb">
       <i class="fa fa-caret-up fa-fw"></i>
       <i class="fa fa-caret-down fa-fw"></i>
    </div>
 </div>
</div>
<div class="z-col">
 <div class="z-row">
    <div class="z-col tabletitle">价格</div>
    <div class="pxxtb">
       <i class="fa fa-caret-up fa-fw"></i>
       <i class="fa fa-caret-down fa-fw"></i>
    </div>
 </div>
</div>
<div class="z-col">
 <div class="z-row">
    <div class="z-col tabletitle">上海市</div>
    <div class="diquxtb">
       <i class="fa fa-chevron-down fa-fw"></i>
    </div>
 </div>
</div>
</div><!--tiaojian end-->

<div class="z-row qdliitem">
<div class="z-col">
<a href="dkrxx.html">
<div class="z-row wyqdtopbox">
  <div class="wyqdname"><strong>张先锋</strong></div>
  <div class="z-col wyqdcash colorRed">1万元</div>
  <div class="wyqdwxxtb"><i class="fa fa-street-view fa-fw"></i></div>
  <div class=" wyqdaddr">上海市--嘉定区</div>
</div>
<div class="z-row">
  <div class="z-col wyqditemcont">上班族，普通企业，29岁，男，月光族，月代发6000元，芝麻信用400分，有社保，信用良好</div>
</div>
<div class="z-row">
  <div class="z-col wyqdtime">申请时间：刚刚</div>
</div>
<div class="z-row wyqditemcz">
  <div class="z-col wyqdckxq"><a href="#">查看详情</a></div>
  <div class="z-col qdbutton">
    <span class="qdxtb"><img src="${basePath }/rwjr/images/qiang.png"></span>
    <a href="#" class="colorRed">20元抢单</a>
  </div>
</div>
</a>
</div>     
</div>

<div class="z-row qdliitem">
<div class="z-col">
<a href="dkrxx.html">
<div class="z-row wyqdtopbox">
  <div class="wyqdname"><strong>张先锋</strong></div>
  <div class="z-col wyqdcash colorRed">1万元</div>
  <div class="wyqdwxxtb"><i class="fa fa-street-view fa-fw"></i></div>
  <div class=" wyqdaddr">上海市--嘉定区</div>
</div>
<div class="z-row">
  <div class="z-col wyqditemcont">上班族，普通企业，29岁，男，月光族，月代发6000元，芝麻信用400分，有社保，信用良好</div>
</div>
<div class="z-row">
  <div class="z-col wyqdtime">申请时间：刚刚</div>
</div>
<div class="z-row wyqditemcz">
  <div class="z-col wyqdckxq"><a href="#">查看详情</a></div>
  <div class="z-col qdbutton">
    <span class="qdxtb"><img src="${basePath }/rwjr/images/qiang.png"></span>
    <a href="#" class="colorRed">20元抢单</a>
  </div>
</div>
</a>
</div>     
</div>

<div class="z-row qdliitem">
<div class="z-col">
<a href="dkrxx.html">
<div class="z-row wyqdtopbox">
  <div class="wyqdname"><strong>张先锋</strong></div>
  <div class="z-col wyqdcash colorRed">1万元</div>
  <div class="wyqdwxxtb"><i class="fa fa-street-view fa-fw"></i></div>
  <div class=" wyqdaddr">上海市--嘉定区</div>
</div>
<div class="z-row">
  <div class="z-col wyqditemcont">上班族，普通企业，29岁，男，月光族，月代发6000元，芝麻信用400分，有社保，信用良好</div>
</div>
<div class="z-row">
  <div class="z-col wyqdtime">申请时间：刚刚</div>
</div>
<div class="z-row wyqditemcz">
  <div class="z-col wyqdckxq"><a href="#">查看详情</a></div>
  <div class="z-col qdbutton">
    <span class="qdxtb"><img src="${basePath }/rwjr/images/qiang.png"></span>
    <a href="#" class="colorRed">20元抢单</a>
  </div>
</div>
</a>
</div>     
</div>

<div class="bnavblank"> </div> <!--blank--->
</div>
<!--tab cont2 end-->
</div>
</div>
</div>				
</div>
</div>
</div>
<!-------------------------------------------->
<!-------------------------------------------->
<!---------第1页 tab 页 html end------------>
<!-------------------------------------------->
<!-------------------------------------------->
<!-------------------------------------------->
<!-------------------------------------------->
<!---------第2页 tab 页 html start------------>
<!-------------------------------------------->
<!-------------------------------------------->
    <div id="tabbar-with-chat" class="mui-control-content">
        <div class="title">客户</div>

        
    </div>
<!-------------------------------------------->
<!-------------------------------------------->
<!---------第2页 tab 页 html end------------>
<!-------------------------------------------->
<!-------------------------------------------->
<!-------------------------------------------->
<!-------------------------------------------->
<!---------第3页 tab 页 html start------------>
<!-------------------------------------------->
<!-------------------------------------------->
    <div id="tabbar-with-contact" class="mui-control-content">
        <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed">
        微店

        
    </ul>
    </div>
<!-------------------------------------------->
<!-------------------------------------------->
<!---------第3页 tab 页 html end------------>
<!-------------------------------------------->
<!-------------------------------------------->
<!-------------------------------------------->
<!-------------------------------------------->
<!---------第4页 tab 页 html start------------>
<!-------------------------------------------->
<!-------------------------------------------->
<div id="tabbar-with-map" class="mui-control-content">

  <div class="mytopbox">
   <div class="z-row padT20">
     <div class="z-col"> </div>
     <div class="mycenhead"><img src="${basePath }/rwjr/images/head.jpg"></div>
     <div class="z-col"> </div>
   </div>
   <div class="z-row peocentxx">
     <div class="z-col"> </div>
     <div><strong>赵经理</strong></div>
     <div class="mycentzhye"><span>（</span>账户余额：0元<span>）</span></div>
     <div class="z-col"> </div>
   </div>
   <div class="z-row">
     <div class="z-col szcz">
        <div class="z-row szczcont">
         <div class="z-col"><button class="shezhibtn"><i class="fa fa-gear fa-fw"></i>设置</button></div>
         <div class="z-col"><button class="chongzhibtn"><i class="fa fa-cny fa-fw"></i>充值</button></div>
        </div>
     </div>
   </div>
  </div>


   <ul class="mui-table-view mui-grid-view mui-grid-9">
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
        <span class="renzheng"><img src="${basePath }/rwjr/images/no_rz.png"><!--<img src="${basePath }/rwjr/images/yes_rz.png">--></span>
        <a href="#">
           <span class="mycenterxtb"><img src="${basePath }/rwjr/images/myxtb1.png"></span>
           <div class="mui-media-body">申请认证</div>
        </a>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
        <a href="#">
            <span class="mycenterxtb"><img src="${basePath }/rwjr/images/myxtb2.png"></span>
            <div class="mui-media-body">客户申请</div>
        </a>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
        <a href="#">
            <span class="mycenterxtb"><img src="${basePath }/rwjr/images/myxtb3.png"></span>
            <div class="mui-media-body">我的余额</div>
        </a>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
        <a href="#">
            <span class="mycenterxtb"><img src="${basePath }/rwjr/images/myxtb4.png"></span>
            <div class="mui-media-body">充值记录</div>
        </a>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
        <a href="#">
            <span class="mycenterxtb"><img src="${basePath }/rwjr/images/myxtb5.png"></span>
            <div class="mui-media-body">我的积分</div>
            </a>
        </li>
    </ul>
</div>
<!-------------------------------------------->
<!-------------------------------------------->
<!---------第4页 tab 页 html end------------>
<!-------------------------------------------->
<!-------------------------------------------->
</div>

<!--底部nav html start-->
<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item mui-active" href="#tabbar">
        <span class="mui-icon mui-icon-home"></span>
        <span class="mui-tab-label">贷款客户</span>
    </a>
    <a class="mui-tab-item" href="#tabbar-with-chat">
        <span class="mui-icon mui-icon-email"></span>
        <span class="mui-tab-label">客户</span>
    </a>
    <a class="mui-tab-item" href="#tabbar-with-contact">
        <span class="mui-icon mui-icon-contact"></span>
        <span class="mui-tab-label">微店</span>
    </a>
    <a class="mui-tab-item" href="#tabbar-with-map">
        <span class="mui-icon mui-icon-gear"></span>
        <span class="mui-tab-label">我的</span>
    </a>
</nav>
<!--底部nav html end-->

<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>

<!------------------MUI 选项卡 js----------------------->
<script>
	mui.init({
		swipeBack: true
	});
	(function($) {
		$('.mui-scroll-wrapper').scroll({
			indicators: true //是否显示滚动条
		});
	})(mui);
</script>

</body>
</html>