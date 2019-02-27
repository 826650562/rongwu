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
                <li class="layui-nav-item ">
                    <a href="dksqkhList">贷款申请客户</a>
                </li>
                <li class="layui-nav-item">
                    <a href="xdjlgl">信贷经理管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="qdzdkh">抢单中的客户</a>
                </li>
                <li class="layui-nav-item   layui-this  layui-nav-itemed">
                    <dl class="layui-nav-child">
                        <dd><a href="xdjlsqtz">设置</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
  
  <div class="layui-body" style="    padding: 10px;">


          <div class="layui-form-item">
              <label class="layui-form-label">登录名称</label>
              <div class="layui-input-block">
                  <input type="text" name="title" placeholder="请输入登录名称" autocomplete="off" class="dlmc layui-input">
              </div>
          </div>


          <div class="layui-form-item">
              <label class="layui-form-label">登录密码</label>
              <div class="layui-input-inline">
                  <input type="password" name="password"   placeholder="请输入密码" autocomplete="off" class="passwrod layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">输入并修改登录密码</div>
          </div>


          <div class="layui-form-item">
              <label class="layui-form-label">注册送积分</label>
              <div class="layui-input-inline">
                  <input type="password"   placeholder="" autocomplete="off" class="zcsjf layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">信贷经理注册之后送的积分额</div>
          </div>


          <div class="layui-form-item">
              <label class="layui-form-label">充值送积分比例</label>
              <div class="layui-input-block">
                  <select name="city" class="seletOption">
                      <option value=""></option>
                      <option value="0">0%</option>
                      <option value="10">10%</option>
                      <option value="20">20%</option>
                      <option value="30">30%</option>
                      <option value="40">40%</option>
                      <option value="50">50%</option>
                  </select>
              </div>
          </div>
     <%--     <div class="layui-form-item">
              <label class="layui-form-label">复选框</label>
              <div class="layui-input-block">
                  <input type="checkbox" name="like[write]" title="写作">
              </div>
          </div>--%>
      <%--    <div class="layui-form-item">
              <label class="layui-form-label">开关</label>
              <div class="layui-input-block">
                  <input type="checkbox" name="switch" lay-skin="switch">
              </div>
          </div>--%>
       <%--   <div class="layui-form-item">
              <label class="layui-form-label">单选框</label>
              <div class="layui-input-block">
                  <input type="radio" name="sex" value="男" title="男">
                  <input type="radio" name="sex" value="女" title="女" checked>
              </div>
          </div>--%>
        <%--  <div class="layui-form-item layui-form-text">
              <label class="layui-form-label">文本域</label>
              <div class="layui-input-block">
                  <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
              </div>
          </div>--%>
          <font color="green">不填写的提交之后不做修改！</font>
          <div class="layui-form-item" style="margin-top: 30px">
              <div class="layui-input-block">
                  <button class="layui-btn submit_" lay-submit lay-filter="formDemo">立即提交</button>
                  <button type="reset" class="layui-btn layui-btn-primary">重置</button>
              </div>
          </div>


      <script type="text/javascript"
              src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
    <script src="${basePath }/rwjr/rwjrht/layui/layui.js"></script>
    <script>
        //Demo
        layui.use('form', function(){
            var form = layui.form;
        $(function () {
            $(".submit_").click(function () {
                $.ajax({
                    url : "updateSz",
                    type : "post",
                    contentType : "application/x-www-form-urlencoded",
                    data : {
                        dlmc : $(".dlmc").val(),
                        passwrod:$(".passwrod").val(),
                        zcsjf:$(".zcsjf").val(),
                        seletOption:$(".seletOption").val()
                    },
                    success : function(code) {
                         if(code=="sucesss"){
                          layer.msg("修改成功！");
                         }else
                           layer.msg("内部错误！");
                    },
                    error : function(error) {
                    }
                });
            });
        })
        });
    </script>
</div>

</body>
</html>










