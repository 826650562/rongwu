<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>详情</title>
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
.mui-table-view-cell:after {
    background-color: #fff;
}
input[type=color], input[type=date], input[type=datetime-local], input[type=datetime], input[type=email], input[type=month], input[type=number], input[type=password], input[type=search], input[type=tel], input[type=text], input[type=time], input[type=url], input[type=week], select, textarea {
    line-height: 21px;
    width: 100%;
    height: 40px;
    margin-bottom: 0px;
    padding: 10px;
    -webkit-user-select: text;
    border: 1px solid #e6e6e6;
}
</style>

</head>
<body>
<header class="mui-bar mui-bar-nav"> <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">微店首页</h1>
</header>
<div class="mui-content">
  <div class="wdxxybox">

    <div class="wdxxyitembox">
     <div class="z-row">
        <div class="wdsyhead"><img src="${basePath }/rwjr/images/gjj.png"></div>
        <div class="z-col wdsyheadright">
           <div class="z-row">
              <div class="z-col"><span class="wdxxycpName">公积金贷</span></div>
           </div>
           <div class="z-row">
              <div class="z-col wwdxxyLabelbox">
                  <span class="wdxxyLabel">金额大</span>
                  <span class="wdxxyLabel">最快2小时放款</span>
              </div>
           </div>
        </div>
     </div>
     <div class="z-row">
        <div class="z-col">
        
        
           <div class="z-row wdxxyCont">
              <div class="z-col borRgray">
                 <div class="z-row">
                    <div class="z-col">3-30万</div>
                 </div>
                  <div class="z-row">
                    <div class="z-col wdxxyli">放款额度</div>
                 </div>
              </div>
              <div class="z-col borRgray">
                 <div class="z-row">
                    <div class="z-col">面议</div>
                 </div>
                  <div class="z-row">
                    <div class="z-col wdxxyli">月利率</div>
                 </div>
              </div>
              <div class="z-col">
                 <div class="z-row">
                    <div class="z-col">3-12个月</div>
                 </div>
                  <div class="z-row">
                    <div class="z-col wdxxyli">贷款期限</div>
                 </div>
              </div>
           </div>
  
           <div class="z-row wdxxyMain">
             <div class="z-col">
                  <div class="z-row">
                     <div class="z-col wdxxyTitle"><i class="fa fa-id-badge fa-fw"></i>&nbsp;申请条件</div>
                  </div>
                  <div class="wdxxyinfocont">
                     <div class="z-row wdxxyMainInfo">
                         <div>年龄要求：</div>
                         <div class="z-col">无要求</div>
                      </div>
                      <div class="z-row wdxxyMainInfo">
                         <div>资产要求：</div>
                         <div class="z-col">无要求</div>
                      </div>
                      <div class="z-row wdxxyMainInfo">
                         <div>信用要求：</div>
                         <div class="z-col">无要求</div>
                      </div>
                      <div class="z-row wdxxyMainInfo">
                         <div>职业要求：</div>
                         <div class="z-col">无要求</div>
                      </div>
                      <div class="z-row wdxxyMainInfo">
                         <div>其他要求：</div>
                         <div class="z-col">有社保</div>
                      </div>
                  </div>
              </div>
           </div>
           
           
           <div class="z-row wdxxyMain">
             <div class="z-col">
                  <div class="z-row">
                     <div class="z-col wdxxyTitle"><i class="fa fa-file-text-o fa-fw"></i>&nbsp;所需材料</div>
                  </div>
                  <div class="wdxxyinfocont">
                     <div class="z-row">
                         <div class="z-col wdxxyLabelmain">
                            <span class="wdxxyBq">户口本</span>
                            <span class="wdxxyBq">房产证</span>
                            <span class="wdxxyBq">居住证</span>
                         </div>
                      </div>
                  </div>
              </div>
           </div>
           
           
           <div class="z-row wdxxyMain">
             <div class="z-col">
                  <div class="z-row">
                     <div class="z-col wdxxyTitle"><i class="fa fa-share-alt-square fa-fw"></i>&nbsp;产品推荐</div>
                  </div>
                  <div class="wdxxyCptj">
                  
                     <div class="wdxxyCptjItem mui-table-view-cell">
                        <div class="wdxxyCplist">
                           <div class="z-row">
                              <div class="z-col wdxxyGjjdk"> <img src="${basePath }/rwjr/images/gjj.png"></div>
                           </div>
                           <div class="z-row">
                              <div class="z-col wdxxygjjtitletxt">公积金贷款</div>
                           </div>
                           <div class="z-row">
                              <div class="z-col wdxxygjjtxt colorRed">3-30万</div>
                           </div>
                           <div class="z-row">
                              <div class="z-col wdxxygjjsmalltxt">最快2小时放款</div>
                           </div>
                        </div>
                     </div>
                     
                     <div class="wdxxyCptjItem mui-table-view-cell">
                        <div class="wdxxyCplist">
                           <div class="z-row">
                              <div class="z-col wdxxyGjjdk"> <img src="${basePath }/rwjr/images/che.png"></div>
                           </div>
                           <div class="z-row">
                              <div class="z-col wdxxygjjtitletxt">车贷款</div>
                           </div>
                           <div class="z-row">
                              <div class="z-col wdxxygjjtxt colorRed">3-30万</div>
                           </div>
                           <div class="z-row">
                              <div class="z-col wdxxygjjsmalltxt">最快2小时放款</div>
                           </div>
                        </div>
                     </div>
                     
                     <div class="wdxxyCptjItem mui-table-view-cell">
                        <div class="wdxxyCplist">
                           <div class="z-row">
                              <div class="z-col wdxxyGjjdk"> <img src="${basePath }/rwjr/images/xin.png"></div>
                           </div>
                           <div class="z-row">
                              <div class="z-col wdxxygjjtitletxt">信用贷款</div>
                           </div>
                           <div class="z-row">
                              <div class="z-col wdxxygjjtxt colorRed">3-30万</div>
                           </div>
                           <div class="z-row">
                              <div class="z-col wdxxygjjsmalltxt">最快2小时放款</div>
                           </div>
                        </div>
                     </div>

                     
                  </div>
              </div>
           </div>
           
           
        </div>
     </div>
     

<div class="z-row marTB10">
  <div class="z-col padR5">
     <button class="layui-btn width100 bgGreen"><i class="fa fa-phone fa-fw"></i>&nbsp;电话联系</button>
  </div>
  <div class="z-col padL5">
      <button class="layui-btn width100"><i class="fa fa-paper-plane fa-fw"></i>&nbsp;立即申请</button>
  </div>
</div>
     
    </div>

  </div>
  
  
</div>

<script src="${basePath }/rwjr/mui-master/dist/js/mui.min.js"></script>

</body>
</html>