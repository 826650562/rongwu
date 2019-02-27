<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>融五金融-抢单详情</title>
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
<div class="main">

  <div class="topbar">
     <div class="z-row">
        <div class="topbarleft"><i class="fa fa-chevron-left fa-fw"></i></div>
        <div class="z-col topbarcenter">我要抢单</div>
        <div class="topbarright"></div>
     </div>
  </div>
  
  <div class="box">

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
  <ul class="layui-tab-title">
    <li class="layui-this">全部项目</li>
    <li>优质客户</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">

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
       <div class="z-row"><!----tiaojian start---->
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
       </div><!----tiaojian end---->
            
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
                <span class="qdxtb"><img src="images/qiang.png"></span>
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
                <span class="qdxtb"><img src="images/qiang.png"></span>
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
                <span class="qdxtb"><img src="images/qiang.png"></span>
                <a href="#" class="colorRed">20元抢单</a>
              </div>
           </div>
           </a>
         </div>     
       </div>
       
        <div class="bnavblank"> </div> <!----blank--->
     </div>
    
    </div><!---tab1 end--->
    <div class="layui-tab-item">
      
      <div class="qdlist">
       <div class="z-row"><!----tiaojian start---->
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
       </div><!----tiaojian end---->
            
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
                <span class="qdxtb"><img src="images/qiang.png"></span>
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
                <span class="qdxtb"><img src="images/qiang.png"></span>
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
                <span class="qdxtb"><img src="images/qiang.png"></span>
                <a href="#" class="colorRed">20元抢单</a>
              </div>
           </div>
           </a>
         </div>     
       </div>
       
        <div class="bnavblank"> </div> <!----blank--->
     </div>
      
    </div><!---tab2 end--->
  </div>
</div>
</div>
  
<div class="bottomnav"><!--bottom nav start-->
 <div class="z-row">
    <div class="z-col bnavitemActive"> 
       <div class="z-row">
          <div class="z-col bnavxtb"> <i class="fa fa-home"></i></div>
       </div>
       <div class="z-row">
          <div class="z-col bnavtxt">贷款客户</div>
       </div>
    </div>
    <div class="z-col bnavitem"> 
       <div class="z-row">
          <div class="z-col bnavxtb2"> <i class="fa fa-address-book"></i></div>
       </div>
       <div class="z-row">
          <div class="z-col bnavtxt">客户</div>
       </div>
    </div>
    <div class="z-col bnavitem"> 
       <div class="z-row">
          <div class="z-col bnavxtb"> <i class="fa fa-shopping-cart"></i></div>
       </div>
       <div class="z-row">
          <div class="z-col bnavtxt">微店</div>
       </div>
    </div>
    <div class="z-col bnavitem"> 
       <div class="z-row">
          <div class="z-col bnavxtb"> <i class="fa fa fa-user"></i></div>
       </div>
       <div class="z-row">
          <div class="z-col bnavtxt">我的</div>
       </div>
    </div>
 </div>
</div><!--bottom nav end-->
  
</div>  

<script type="text/javascript" src="layui/layui.js"></script>
<script>
layui.use(['form', 'element', 'laydate'], function(){
  var $ = layui.jquery
  ,form = layui.form
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
});
</script>
</body>
</html>