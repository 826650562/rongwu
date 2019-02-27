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
  <script type="text/javascript"
          src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
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
        <li class="layui-nav-item  layui-this">
          <a href="xdjlsfshsq">信贷经理身份审核申请</a>
        </li>
        <li class="layui-nav-item ">
          <a href="dksqkhList">贷款申请客户</a>
        </li>
        <li class="layui-nav-item">
          <a href="xdjlgl">信贷经理管理</a>
        </li>
        <li class="layui-nav-item">
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
<table class="layui-table" lay-skin="line">
  <colgroup>
    <col width="120">
    <col width="350">
    <col width="350">
    <col>
  </colgroup>
  <tbody>

  <c:forEach items="${user}" var="v">
   <%-- <tr >
      <td class="htnewbox">${v.gsmc }<span class="htnew"></span></td>--%>

    <tr>
      <td class="tdxxright">公司名称：</td>
      <td colspan="3">${v.gsmc }</td>
    </tr>
    <tr>
      <td class="tdxxright">个人职位：</td>
      <td colspan="3">${v.grzw }</td>
    </tr>
    <tr>
      <td class="tdxxright">所在城市：</td>
      <td colspan="3">${v.city }</td>
    </tr>
    <tr>
      <td class="tdxxright">注册身份证号：</td>
      <td colspan="3">${v.sfz }</td>
    </tr>
    <tr>
      <td class="tdxxright">注册手机号：</td>
      <td colspan="3" class="_sjh">${v.sjh }</td>
    </tr>
    <tr>
      <td class="tdxxright">身份证照：</td>
      <td>
        <div class="z-row">
          <div class="z-col sfzcont"><img src="${basePath }/rwjr/temp_img/${v._beforpic }"></div>
        </div>
        <div class="z-row">
          <div class="z-col textCenter">身份证照(1)</div>
        </div>
      </td>
      <td>
        <div class="z-row">
          <div class="z-col sfzcont"><img src="${basePath }/rwjr/temp_img/${v._afterpic }"></div>
        </div>
        <div class="z-row">
          <div class="z-col textCenter">身份证照(2)</div>
        </div>
      </td>
      <td></td>
    </tr>
    <tr>
      <td class="tdxxright">手持工作证照：</td>
      <td>
        <div class="z-row">
          <div class="z-col sfzcont"><img src="${basePath }/rwjr/temp_img/${v.gzzp }"></div>
        </div>
        <div class="z-row">
          <div class="z-col textCenter">手持工作证照</div>
        </div>
      </td>
      <td> </td>
      <td></td>
    </tr>

    <tr class="shenhe" style="display: none" zt="${v.ispass }">
      <td colspan="4" class="pad15">
        <div class="z-row">
          <div class="z-col"> </div>
          <div ><button class="layui-btn layui-btn-primary btngreen"><i class="fa fa-check fa-fw"></i>&nbsp;通过审核</button></div>
          <div style="width:20px;"> </div>
          <div><button id="notg" class="layui-btn"><i class="fa fa-close fa-fw"></i>&nbsp;不通过审核</button></div>
          <div class="z-col _idsq" _id="${v.id }"> </div>
        </div>
      </td>
    </tr>

  </c:forEach>

  </tbody>
</table>   

          </div>
       </div>
       <div class="z-row"><div class="z-col bottomblank"> </div></div><!--blank-->
    </div>
  </div>
  
</div>
<script src="${basePath }/rwjr/rwjrht/layui/layui.js"></script>
<script>
layui.use(['element','laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句


 $("#notg").click(function(){
   //页面层
	layer.open({
	  type: 1,
	  skin: 'layui-layer-rim', //加上边框
	  area: ['420px', '225px'], //宽高
	  title :'不通过审核',
	  btn: ['确定'],
	  content: '<div class="notgarea"><textarea placeholder="请输入不通过的原因"></textarea></div>',
      yes: function(index, layero){
          var text= $(".notgarea textarea").val();
          $.ajax({
              url : "notg?date=" + new Date(),
              type : "post",
              contentType : "application/x-www-form-urlencoded",
              data : {
                  id : $("._idsq").attr('_id'),
                  _sjh:$("._sjh").text(),
                  msg:text
              },
              success : function(code) {
                  window.location.reload()
              },
              error : function(error) {
                  _msg("系统错误！");
              }
          });
          layer.closeAll();
      }
	});
 })

    $(".btngreen").unbind().click(function(){
        $.ajax({
            url : "shbtg?date=" + new Date(),
            type : "post",
            contentType : "application/x-www-form-urlencoded",
            data : {
                id : $("._idsq").attr('_id'),
                _sjh:$("._sjh").text()
            },
            success : function(code) {
                window.location.reload()
            },
            error : function(error) {
                _msg("系统错误！");
            }
        });
    });

   var isparss=$(".shenhe").attr("zt");
   if(isparss !="2"){
       $(".shenhe").show();
   }
});
</script>

</body>
</html>










