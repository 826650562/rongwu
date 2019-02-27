<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

    <!--标准mui.css-->
    <link rel="stylesheet" href="${basePath }/rwjr/mui-master/dist/css/mui.min.css">
    <link href="${basePath }/rwjr/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${basePath }/rwjr/css/z-layout.css" rel="stylesheet" type="text/css">
    <link href="${basePath }/rwjr/layui/layer_mobile/layer.css" rel="stylesheet" type="text/css">
    <!-------layui_mobile css--------->
    <link rel="stylesheet" type="text/css"
          href="${basePath }/rwjr/mui-master/examples/hello-mui/css/mui.picker.min.css"/>
    <link href="${basePath }/rwjr/layui/css/layui.css" rel="stylesheet" type="text/css">
    <link href="${basePath }/rwjr/css/style.css" rel="stylesheet" type="text/css">

    <script type="text/javascript"
            src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${basePath }/rwjr/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath }/rwjr/js/layer.js"></script>
    <script type="text/javascript" src="${basePath }/rwjr/js/common.js"></script>
    <!--App自定义的css-->

    <style>
        .mui-control-content .mui-loading {
            margin-top: 50px;
        }

        html, body {
            height: 100%;
        }

        .mui-content {
            height: 100%;
        }

        .mui-slider {
            height: 100%;
        }

        .mui-slider-group {
            height: 100%;
        }

        .mui-control-content {
            height: 100%;
        }

        .mui-grid-view.mui-grid-9 {
            border-top: 1px solid #e6e6e6;
            border-left: 1px solid #e6e6e6;
            background-color: #fff;
        }

        .mui-input-group:before {
            background-color: #fff;
        }

        .mui-input-group:after {
            background-color: #fff;
        }

        .mui-input-group .mui-input-row:after {
            background-color: #fff;
        }

        .mui-fullscreen .mui-segmented-control ~ .mui-slider-group {
            top: 45px;
        }

        .mui-views, .mui-view, .mui-pages, .mui-page, .mui-page-content {
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            background-color: #efeff4;
        }

        .mui-pages {
            top: 46px;
            height: auto;
        }

        .mui-scroll-wrapper, .mui-scroll {
            background-color: #efeff4;
            height: 100%;
        }

        .mui-page.mui-transitioning {
            -webkit-transition: -webkit-transform 300ms ease;
            transition: transform 300ms ease;
        }

        .mui-page-left {
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }

        .mui-navbar {
            position: fixed;
            right: 0;
            left: 0;
            z-index: 10;
            height: 44px;
            background-color: #f7f7f8;
        }

        .mui-navbar .mui-bar {
            position: absolute;
            background: transparent;
            text-align: center;
        }

        .mui-navbar .mui-btn-nav {
            -webkit-transition: none;
            transition: none;
            -webkit-transition-duration: .0s;
            transition-duration: .0s;
        }

        .mui-navbar .mui-bar .mui-title {
            display: inline-block;
            width: auto;
        }

        .mui-navbar-inner.mui-transitioning, .mui-navbar-inner .mui-transitioning {
            -webkit-transition: opacity 300ms ease, -webkit-transform 300ms ease;
            transition: opacity 300ms ease, transform 300ms ease;
        }

        .mui-page {
            display: none;
        }

        .mui-pages .mui-page {
            display: block;
        }

        .mui-checkbox input[type=checkbox], .mui-radio input[type=radio] {
            position: absolute;
            top: -4px;
        }

        .mui-btn {
            font-size: 16px;
            padding: 8px;
            margin: 3px;
        }

        h5.mui-content-padded {
            margin-left: 3px;
            margin-top: 20px !important;
        }

        h5.mui-content-padded:first-child {
            margin-top: 12px !important;
        }

        .ui-alert {
            text-align: center;
            padding: 20px 10px;
            font-size: 16px;
        }

        .mui-table-view-cell {
            border-bottom: 1px solid #e2e2e2;
            padding: 0px;
            height: 45px;
            line-height: 45px;
            cursor: pointer;
        }

        .ui-alert {
            text-align: right;
            padding: 0px;
            font-size: 15px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .mui-table-view-cell:after {
            background: none;
        }
    </style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <a href="wyqdjsp" class="  mui-icon mui-icon-left-nav mui-pull-left"></a>
    <script language="javascript">
        //防止页面后退
        history.pushState(null, null, "wyqdjsp");

    </script>
    <h1 class="mui-title">民间风控</h1>
</header>

<div class="mui-content">
    <div id="tabbar" class="mui-control-content mui-active">
        <div id="slider" class="mui-slider">
            <div id="sliderSegmentedControl"
                 class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
                <a class="mui-control-item" href="#item1mobile">客户列表</a>
                <a class="mui-control-item" href="#item2mobile">添加客户</a>
            </div>
            <div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-6"></div>
            <div class="mui-slider-group">
                <div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
                    <div id="scroll1" class="mui-scroll-wrapper">
                        <div class="mui-scroll">
                            <!--tab cont1 start-->
                            <div class="mjfklist">
                                <c:forEach items="${listOfMjfk}" var="v">

                                    <div class="mjfkitem">
                                        <div class="z-row">
                                            <div class="z-col">
                                                <div class="z-row fmkfitemrow">
                                                    <div>客户姓名：</div>
                                                    <div class="z-col">${v.kh_name }</div>
                                                </div>
                                                <div class="z-row fmkfitemrow">
                                                    <div class="z-col">电话号码：${v.dhhm }</div>
                                                    <div class="z-col">身份证号：${v.sfzh }</div>
                                                    <div></div>
                                                </div>
                                                <div class="z-row fmkfitemrow">
                                                    <div class="z-col">贷款金额：${v.dked }</div>
                                                    <div class="z-col">贷款用途：${v.dkyt }</div>
                                                    <div></div>
                                                </div>
                                                <div class="z-row fmkfitemrow">
                                                    <div class="z-col">放款日期：${v.fkrq }</div>
                                                    <div class="z-col">放款对象：${v.fkr }</div>
                                                    <div></div>
                                                </div>

                                                <div class="z-row fmkfitemrow">
                                                    <div class="z-col">家庭住所：${v.jtzs }</div>
                                                    <div></div>
                                                </div>

                                            </div>
                                            <div class="mjfkdel" id="${v.id }">
                                                <button><i class="fa fa-trash fa-fw"></i></button>
                                            </div>
                                        </div>
                                    </div>


                                </c:forEach>








                            </div>

                            <!--tab cont1 end-->
                        </div>
                    </div>
                </div>
                <div id="item2mobile" class="mui-slider-item mui-control-content">
                    <div id="scroll2" class="mui-scroll-wrapper">
                        <div class="mui-scroll">
                            <!--tab cont2 start-->

                            <div class="dksqaabox">

                                <div class="z-row rzzqInput">
                                    <div class="dksqinputtxt">
                                        <font color="red">*</font> 客户姓名
                                    </div>
                                    <div class="z-col">
                                        <input type="text" placeholder="请输入" id="kh_name" class="zInput">
                                    </div>
                                </div>

                                <div class="z-row rzzqInput">
                                    <div class="dksqinputtxt">
                                        身份证号
                                    </div>
                                    <div class="z-col">
                                        <input type="text" placeholder="请输入" id="kh_sfzh" class="zInput">
                                    </div>
                                </div>
                                <div class="z-row rzzqInput">
                                    <div class="dksqinputtxt">
                                        <font color="red">*</font>电话号码
                                    </div>
                                    <div class="z-col">
                                        <input type="text" placeholder="请输入" id="kh_sjh" class="zInput">
                                    </div>
                                </div>
                                <div class="z-row rzzqInput">
                                    <div class="dksqinputtxt">
                                        家庭住所
                                    </div>
                                    <div class="z-col">
                                        <input type="text" placeholder="请输入" id="kh_jtzz" class="zInput">
                                    </div>
                                </div>
                                <div class="z-row rzzqInput">
                                    <div class="dksqinputtxt">
                                        贷款用途
                                    </div>
                                    <div class="z-col">
                                        <input type="text" placeholder="请输入" id="kh_dkyt" class="zInput">
                                    </div>
                                </div>
                                <div class="z-row rzzqInput">
                                    <div class="dksqinputtxt">
                                        贷款额度
                                    </div>
                                    <div class="z-col">
                                        <input type="text" placeholder="请输入" id="kh_dked" class="zInput">
                                    </div>
                                </div>
                                <div id='demo2' data-options='{"type":"date","beginYear":2010,"endYear":2030}'
                                     class="z-row rzzqInput mui-table-view-cell">
                                    <div class="dksqinputtxt">
                                        放款日期
                                    </div>
                                    <div id='result' class="z-col ui-alert padLR15 kh_fkrq"  > 请选择</div>
                                    <div class="dkjiantou">
                                        <i class="fa fa-angle-right fa-lg"></i>
                                    </div>
                                </div>
                                <form class="mui-input-group">
                                    <div class="z-row padTB10">

                                        <div>放款人：</div>
                                        <div class="z-col"></div>
                                        <div>
                                            <div class="mui-radio">
                                                <label for="male">个人</label>
                                                <input type="radio" name="sex" value="个人" id="male">
                                            </div>
                                        </div>
                                        <div class="z-col"></div>
                                        <div>
                                            <div class="mui-radio">
                                                <label for="female">公司</label>
                                                <input type="radio" name="sex" value="公司" id="female">
                                            </div>
                                        </div>
                                        <div class="z-col"></div>


                                    </div>
                                </form>
                                <!-- <button id='demo2' data-options='{"type":"date","beginYear":2014,"endYear":2016}' class="btn mui-btn mui-btn-block">选择日期 ...</button>
                                 <div id='result' class="ui-alert"></div>-->

                                <div class="z-row marT15">
                                    <div class="z-col">
                                        <a href="#account" class="layui-btn width100">提交</a>
                                    </div>
                                </div>

                            </div>
<div style="height: 40px"></div>

                            <!--tab cont2 end-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<script src="${basePath }/rwjr/js/jquery-1.9.1.min.js"></script>
<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>
<script src="${basePath }/rwjr/mui-master/examples/hello-mui/js/mui.picker.min.js"></script>
<script src="${basePath }/rwjr/js/jsRender.js"></script><!--------jsRender js--------->


<!------------------MUI 选项卡 js----------------------->
<script>
    mui.init({
        swipeBack: true
    });
    (function ($) {
        $('.mui-scroll-wrapper').scroll({
            indicators: true //是否显示滚动条
        });
    })(mui);
</script>
<script>
    (function ($) {
        $.init();
        var result = $('#result')[0];
        var btns = $('#demo2');
        btns.each(function (i, btn) {
            btn.addEventListener('tap', function () {
                var _self = this;
                if (_self.picker) {
                    _self.picker.show(function (rs) {
                        result.innerText = rs.text;
                        _self.picker.dispose();
                        _self.picker = null;
                    });
                } else {
                    var optionsJson = this.getAttribute('data-options') || '{}';
                    var options = JSON.parse(optionsJson);
                    var id = this.getAttribute('id');
                    /*
                     * 首次显示时实例化组件
                     * 示例为了简洁，将 options 放在了按钮的 dom 上
                     * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
                     */
                    _self.picker = new $.DtPicker(options);
                    _self.picker.show(function (rs) {
                        /*
                         * rs.value 拼合后的 value
                         * rs.text 拼合后的 text
                         * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
                         * rs.m 月，用法同年
                         * rs.d 日，用法同年
                         * rs.h 时，用法同年
                         * rs.i 分（minutes 的第二个字母），用法同年
                         */
                        result.innerText = rs.text;
                        /*
                         * 返回 false 可以阻止选择框的关闭
                         * return false;
                         */
                        /*
                         * 释放组件资源，释放后将将不能再操作组件
                         * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
                         * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
                         * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
                         */
                        _self.picker.dispose();
                        _self.picker = null;
                    });
                }

            }, false);
        });



    })(mui);
</script>
<script>

    $(function () {


        $(".width100").unbind().click(function () {
            var  kh_fkrq=$.trim($(".kh_fkrq").text());
            if(kh_fkrq=="请选择") kh_fkrq="";
            var attr = {
                ku_name: $.trim($("#kh_name").val()),
                kh_sfzh: $.trim($("#kh_sfzh").val()),
                kh_sjh: $.trim($("#kh_sjh").val()),
                kh_jtzz: $.trim($("#kh_jtzz").val()),
                kh_dkyt: $.trim($("#kh_dkyt").val()),
                kh_dked: $.trim($("#kh_dked").val()),
                kh_fkrq:kh_fkrq,
                fkr: $("[name=\"sex\"]").val()
            };

            if (checkout(attr)) {
                $.ajax({
                    url : "setMjfk",
                    type : "post",
                    contentType : "application/x-www-form-urlencoded",
                    data : attr ,
                    success : function(code) {
                        window.location.reload()
                    },
                    error : function(error) {
                        _msg("系统出错！");
                    }
                });

            }

            function checkout(attr) {
                if(!attr.ku_name){
                    _msg("名称不能为空！");
                    return false;
                }
                if(!attr.kh_sjh){
                    _msg("客户手机号不能为空！");
                    return false;
                }
                var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
                if(!reg.test(attr.kh_sjh)){
                    _msg("请输入有效的手机号！");
                    return false;
                }
                return true;
            }
        });

        $(".mjfkdel").unbind().click(function(){
              var _id=$(this).attr("id");
            _xunwen("确认删除吗",["确定","取消"],function(){
                $.ajax({
                    url : "deleteMjfk",
                    type : "post",
                    contentType : "application/x-www-form-urlencoded",
                    data : {
                        _id:_id
                    } ,
                    success : function(code) {
                        window.location.reload()
                        layer.closeAll();
                    },
                    error : function(error) {
                        _msg("系统出错！");
                    }
                });


            },function(){
                layer.closeAll();
            });
        });

    })
</script>

</body>
</html>