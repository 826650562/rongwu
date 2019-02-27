<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("basePath", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <li class="layui-nav-item layui-this">
          <a href="qdzdkh">抢单中的客户</a>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
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
      <col width="120">
      <col width="120">
      <col width="120">
      <col width="150">
      <col width="120">
      <col width="120">
      <col width="120">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th><strong>申请人</strong></th>
        <th><strong>申请金额</strong></th>
        <th><strong>抢单方式</strong></th>
        <th><strong>申请时间</strong></th>
        <th><strong>抢单人</strong></th>
        <th><strong>单子状态</strong></th>
        <th><strong>抢单时间</strong></th>

      </tr> 
    </thead>
    <tbody>

        <c:forEach items="${yh_dk2}" var="v">
        <tr>
          <td>${v.name }</td>
          <td>${v.jine }万元</td>
          <td>${v.beizhu }</td>
          <td>${v.sqdate }</td>
          <td>${v.realname }</td>
          <td>${v.kh_status }</td>
          <td>${v.qddate }</td>
        </tr>
      </c:forEach>


    </tbody>
  </table>
          </div>
       </div>
       <div class="z-row"><div class="z-col bottomblank"> </div></div><!--blank-->
    </div>
  </div>
  
<%--

  <div class="layui-footer">
     <div id="pagebox"></div>
  </div>
--%>

  
</div>
<script src="${basePath }/rwjr/rwjrht/layui/layui.js"></script>
<script>
layui.use(['element','laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

  
 $("#ckxq").click(function(){
   //页面层
	layer.open({
	  type: 1,
	  skin: 'layui-layer-rim', //加上边框
	  area: ['420px', '350px'], //宽高
	  title :'申请中的客户',
	  btn: ['确定'],
	  content: '<div class="tckcont">'
	  +'<div class="z-row tkitem"><div>'+'申请人：'+'</div>'+'<div class="z-col">'+'闲心'+'</div>'+'</div>'
	  +'<div class="z-row tkitem"><div>'+'申请金额：'+'</div>'+'<div class="z-col">'+'2万元'+'</div>'+'</div>'
	  +'<div class="z-row tkitem"><div>'+'姓名：'+'</div>'+'<div class="z-col">'+'1989-10-14'+'</div>'+'</div>'
	  +'<div class="z-row tkitem"><div>'+'申请时间：'+'</div>'+'<div class="z-col">'+'2万元'+'</div>'+'</div>'
	  +'<div class="z-row tkitem"><div>'+'抢单人：'+'</div>'+'<div class="z-col">'+'闲心'+'</div>'+'</div>'
	  +'<div class="z-row tkitem"><div>'+'抢单时间：'+'</div>'+'<div class="z-col">'+'2万元'+'</div>'+'</div>'
	  +'</div>'
	});
 }) 
  
 
 
  laypage.render({
    elem: 'pagebox'
    ,count: 1000
    ,layout: ['page', 'count']
  });
 
 


});
</script>

</body>
</html>










