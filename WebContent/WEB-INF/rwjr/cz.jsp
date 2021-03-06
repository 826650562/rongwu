 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我要充值</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!--标准mui.css-->
<link rel="stylesheet" href="${basePath }/rwjr/mui-master/dist/css/mui.min.css">
<link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/css/style.css" rel="stylesheet" type="text/css">


<script type="text/javascript"
	src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<!--App自定义的css-->
<style type="text/css">
.mui-table-view-cell:after {
    background-color: #fff;
}
.mui-input-group {
    background-color: #f6f6f6;
}
.mui-input-group:before {
    background-color: #f6f6f6;
}
.mui-input-group:after {
    background-color: #f6f6f6;
}
.mui-input-group .mui-input-row:after {
    background-color: #f6f6f6;
}
</style>
</head>
<body>
<header class="mui-bar mui-bar-nav"> <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">充值</h1>
</header>
<div class="mui-content">

<div class="czhead">
    <div class="z-row">
       <div class="z-col czsyje">${yue}</div>
    </div>
    <div class="z-row">
       <div class="z-col czsyjetxt">账户余额（元）</div>
    </div>
</div>


<div class="czbox">
  

<div class="cztcli mui-table-view-cell cztcliActive">
    <div class="z-row">
       <div class="cztcje">50<span class="cztcjeyuan">元</span></div>
       <div class="z-col">
          <div class="z-row"> 
            <div class="z-col cztctitle">充值50</div>
          </div>
          <div class="z-row"> 
            <div class="z-col cztczshy">送10积分</div>
          </div>
       </div>  
    </div>
</div>

<div class="cztcli mui-table-view-cell ">
    <div class="z-row">
       <div class="cztcje">100<span class="cztcjeyuan">元</span></div>
       <div class="z-col">
          <div class="z-row"> 
            <div class="z-col cztctitle">充值100</div>
          </div>
          <div class="z-row"> 
            <div class="z-col cztczshy">送30积分</div>
          </div>
       </div>  
    </div>
</div>

<div class="cztcli mui-table-view-cell">
    <div class="z-row">
       <div class="cztcje">200<span class="cztcjeyuan">元</span></div>
       <div class="z-col">
          <div class="z-row"> 
            <div class="z-col cztctitle">充值200</div>
          </div>
          <div class="z-row"> 
            <div class="z-col cztczshy">送60积分</div>
          </div>
       </div>  
    </div>
</div>

<div class="cztcli mui-table-view-cell">
    <div class="z-row">
        <input type="text" name="title"  style=" width:80px;margin-top: 15px" class="layui-input">
       <div class="z-col">
          <div class="z-row"> 
            <div class="z-col cztctitle">自定义充值</div>
          </div>
          <div class="z-row"> 
            <div class="z-col cztczshy">送${jifenOfcz}积分</div>
          </div>
       </div>  
    </div>
</div>

<div class="z-row">
  <div class="z-col">
     <form class="mui-input-group">
        <div class="mui-input-row mui-checkbox mui-left">
            <div class="tytk">
           同意融五信息<a class="colorBlue" href="cztk.html">《充值协议》</a>
            </div>
            
            <input name="checkbox" checked="checked" value="Item 1" type="checkbox" style="left: 0px;">
        </div>
     </form>
</div>
</div>

<div class="z-row marT15" id="_wxcz">
  <div class="z-col">
     <a href="#account" class="layui-btn wxzf"><i class="fa fa-comments fa-lg"></i>&nbsp;&nbsp;微信支付充值</a>
  </div>
</div>



<div class="z-row">
   <div class="z-col">  </div>
</div>
  
    
</div>
  
  
<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>

<script>
	mui.init({
		swipeBack: true
	});
	$(function(){
	  $(".czbox").find(".cztcli").click(function(){
	      $(".czbox").find(".cztcli").removeClass("cztcliActive");
	      $(this).addClass("cztcliActive");
	  }); 
	
	})
</script>
<script>

$(function(){
  $("#_wxcz").click(function(){
      var realjine;
      var val=$(".cztcliActive").find("input").val();
      alert(val);
       if(val){
           realjine= parseFloat(val);
       }else{
           var jine=$(".cztcliActive").find(".cztcje").text();
           realjine=parseInt(jine);
       }
       var url="${payURL}".replace("MYURL","http://www.rongwu180.com"+"${basePath }"+"/weChat").replace("JINE", realjine).replace("MYTYPE", "充值");
      window.location.href=encodeURI(url);
  });
})
 
</script>	
</div>
</body>
</html>