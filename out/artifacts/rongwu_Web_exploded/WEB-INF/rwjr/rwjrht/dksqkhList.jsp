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
        <li class="layui-nav-item  layui-this">
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

          <table class="layui-table">
            <colgroup>
              <col width="200">
              <col width="200">
              <col width="200">
              <col width="200">
              <col>
            </colgroup>
            <thead>
            <tr>
              <th><strong>申请人姓名</strong></th>
              <th><strong>贷款金额</strong></th>
              <th><strong>申请时间</strong></th>
                <th><strong>当前状态</strong></th>
              <th><strong>输入抢单金额</strong></th>
                <th><strong>操作</strong></th>
              <th><strong>查看抢单人信息</strong></th>
            </tr>
            </thead>
            <tbody class="tbody_">

            </tbody>
          </table>
        </div>
      </div>
      <div class="z-row"><div class="z-col bottomblank"> </div></div><!--blank-->
    </div>
  </div>


  <%-- <div class="layui-footer">
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


        laypage.render({
            elem: 'pagebox'
            ,count: 1000
            ,layout: ['page', 'count']
        });
    });
    $(function () {
        $.ajax({
            url : "getAllDksq?date=" + new Date(),
            type : "post",
            contentType : "application/x-www-form-urlencoded",
            success : function(res) {
                res=JSON.parse(res)
                res.map(function (item) {
                    if(item.status=="0"){
                        $(".tbody_").append(getHtml(item));
                    }
                })
                addEventListener()
            },
            error : function(error) {
                alert("系统错误！");
            }
        });
        function getHtml(item){
            return '\n' +
                '\n' +
                '      <tr _id='+item.id+'  _sjh='+item.sjh+'>\n' +
                '        <td>'+item.name+'</td>\n' +
                '        <td>'+item.jine+'万</td>\n' +
                '        <td>'+timestampToTime(item.date/1000)+'</td>\n' +
                '        <td >审核中</td>\n' +
                '        <td> <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入抢单金额" class="_qdjine layui-input"></td>\n' +
                '        <td>\n' +
                '        <a  class="dksq layui-btn layui-btn-primary layui-btn-xs">进入抢单大厅</a>\n' +
                '        </td>\n' +
                '        <td>\n' +
                '        <a  class="ckxq layui-btn layui-btn-primary layui-btn-xs"><i class="fa fa-eye fa-fw"></i>查看详情</a>\n' +
                '        </td>\n' +
                '      </tr>'
        }

        function timestampToTime(timestamp) {
            var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            Y = date.getFullYear() + '-';
            M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
            D = date.getDate() + ' ';
            h = date.getHours() + ':';
            m = date.getMinutes() + ':';
            s = date.getSeconds();
            return Y+M+D+h+m+s;
        }
        function   addEventListener (){
            $(".ckxq").click(function(){
                //页面层
                var _sjh=$(this).parents("tr").attr("_sjh");
                $.ajax({
                    url : "getSqinfoByid?date=" + new Date(),
                    type : "post",
                    data:{
                        id:_sjh
                    },
                    contentType : "application/x-www-form-urlencoded",
                    success : function(res) {
                        res=JSON.parse(res)[0];
                        if(!res) return ;
                        layer.open({
                            type: 1,
                            skin: 'layui-layer-rim', //加上边框
                            area: ['450px', '400px'], //宽高
                            title :'申请人信息',
                            btn: ['确定'],
                            content: '<div class="tckcont">'
                            +'<div class="z-row tkitem"><div>'+'申请人姓名：'+'</div>'+'<div class="z-col">'+res.name+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'地址：'+'</div>'+'<div class="z-col">'+res.adress+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'车辆：'+'</div>'+'<div class="z-col">'+res.che+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'房产：'+'</div>'+'<div class="z-col">'+res.fangchan+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'公积金：'+'</div>'+'<div class="z-col">'+res.gjj+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'收入来源：'+'</div>'+'<div class="z-col">'+res.gz+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'保险：'+'</div>'+'<div class="z-col">'+res.rsbx+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'社保：'+'</div>'+'<div class="z-col">'+res.shebao+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'学历：'+'</div>'+'<div class="z-col">'+res.xueli+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'信用：'+'</div>'+'<div class="z-col">'+res.xyzk+'</div>'+'</div>'
                            +'<div class="z-row tkitem"><div>'+'芝麻积分：'+'</div>'+'<div class="z-col">'+res.zhima+'</div>'+'</div>'
                            +'</div>'
                        });
                    },
                    error : function(error) {
                        alert("系统错误！");
                    }
                });
            })


            $(".dksq").unbind().click(function(){
                var id=$(this).parents("tr").attr("_id");
                var _sjh=$(this).parents("tr").attr("_sjh");
                con=confirm("是否加入抢单大厅?"); //在页面上弹出对话框
                if(con==true){
                    var value=$(this).parents("tr").find("._qdjine").val();
                    if(!value ||  Number(value) <=0){
                       alert("请正确输入抢单金额！");
                    }else
                    $.ajax({
                        url : "update_dksq?date=" + new Date(),
                        type : "post",
                        data:{
                            id:id,
                            value:value,
                           _sjh:_sjh
                        },
                        contentType : "application/x-www-form-urlencoded",
                        success : function(res) {
                            window.location.href="dksqkhList";
                        },
                        error : function(error) {
                            alert("系统错误！");
                        }
                    });
                }

            })
        }



    })
</script>

</body>
</html>
