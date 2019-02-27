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

<link href="${basePath }/rwjr/rwjrht/layui/css/layui.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/rwjrht/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/rwjrht/css/z-layout.css" rel="stylesheet" type="text/css">
<link href="${basePath }/rwjr/rwjrht/css/style.css" rel="stylesheet" type="text/css">
<!--App自定义的css-->
<style type="text/css">
html,body{height:100%;}
.layui-body{height:100%;}
.layui-table img {
    max-width: 100%;
}
</style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">融五金融后台管理</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          admin
        </a>
        <dl class="layui-nav-child">
          <dd><a href="LoginOut">退出</a></dd>
        </dl>
      </li>
      <!--<li class="layui-nav-item"><a href="">退出</a></li>-->
    </ul>
  </div>


    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a href="xdjlsfshsq">信贷经理身份审核申请</a>
                </li>
                <li class="layui-nav-item  ">
                    <a href="dksqkhList">贷款申请客户</a>
                </li>
                <li class="layui-nav-item">
                    <a href="xdjlgl">信贷经理管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="qdzdkh">抢单中的客户</a>
                </li>
                <li class="layui-nav-item ">
                    <dl class="layui-nav-child">
                        <dd><a href="xdjlsqtz">设置</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
  <div class="layui-body">
    <div class="pad15">
       <div class="z-row">
          <div class="z-col">

<table class="layui-table">
    <colgroup>
      <col>
      <col width="200">
    </colgroup>
    <thead>
      <tr>
        <th><strong>消息</strong></th>
        <th><strong>操作</strong></th>
      </tr> 
    </thead>
    <tbody>
      <tr>
        <td>贷款申请通知内容</td>
        <td>
        <a href="#" class="layui-btn layui-btn-primary layui-btn-xs"><i class="fa fa-eye fa-fw"></i>查看详情</a>
        </td>
      </tr>
       <tr>
        <td>贷款申请通知内容</td>
        <td>
        <a href="#" class="layui-btn layui-btn-primary layui-btn-xs"><i class="fa fa-eye fa-fw"></i>查看详情</a>
        </td>
      </tr>
       <tr>
        <td>贷款申请通知内容</td>
        <td>
        <a href="#" class="layui-btn layui-btn-primary layui-btn-xs"><i class="fa fa-eye fa-fw"></i>查看详情</a>
        </td>
      </tr>
    </tbody>
  </table>



          </div>
       </div>
       <div class="z-row"><div class="z-col bottomblank"> </div></div><!--blank-->
    </div>
  </div>
  
  
  
  <div class="layui-footer">
     <div id="pagebox"></div>
  </div>
  
</div>
<script src="${basePath }/rwjr/rwjrht/layui/layui.js"></script>
<script>
layui.use(['element','laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

  



 
  laypage.render({
    elem: 'pagebox'
    ,count: 1000
    ,layout: ['page', 'count']
  });
 
 


});
</script>

</body>
</html>










