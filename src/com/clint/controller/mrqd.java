package com.clint.controller;

import com.clint.model.Global;
import com.clint.service.MapService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/mrqd")
public class mrqd {
    @Resource(name = "mapService")
    public MapService mapService;

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest req, Model model,HttpServletResponse response) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.WEIXINOPENID);
        if (StringUtils.isNotEmpty(wexinOpenId)) {
            model.addAttribute("wexinOpenId", wexinOpenId);
            String sql = "SELECT count(*) as signCounts FROM weixin_sign WHERE open_id='"+wexinOpenId+"' AND DATE_FORMAT(sign_time,'%Y-%m-%d') = DATE_FORMAT(now(),'%Y-%m-%d')";
            List list = mapService.getListBySql(sql);
            Map count=(Map)list.get(0);
            String signCounts=String.valueOf(count.get("signCounts"));
            boolean result=false;
            if(!signCounts.equals("0")){
                model.addAttribute("isAlert", "yes");
            }
        }else {
            model.addAttribute("wexinOpenId", "");
        }
        return "sign";
    }


    @RequestMapping(value = "/domrqd")
    public String domrqd(HttpServletRequest req, HttpServletResponse response,Model model) throws IOException {
       //首先获取是谁
        //判断是否签到过了  返回结果
        //没有签到过就签到 加积分  返回结果
        String wexinOpenId = (String) req.getSession().getAttribute(Global.WEIXINOPENID);
        String sql = "SELECT count(*) as signCounts FROM weixin_sign WHERE open_id='"+wexinOpenId+"' AND DATE_FORMAT(sign_time,'%Y-%m-%d') = DATE_FORMAT(now(),'%Y-%m-%d')";
        List list = mapService.getListBySql(sql);
        Map count=(Map)list.get(0);
        String signCounts=String.valueOf(count.get("signCounts"));
        boolean result=false;
        if(!signCounts.equals("0")){
            //已经签到过了   h7PcZZrri0-LmppTKf1-ztD7-kItbTPuZylqj9xjB30
              Date day=new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              System.out.println(df.format(day));
              List parms=new ArrayList();
              parms.add("first");
              parms.add("签到反馈");
              parms.add("#118850");

              List parms1=new ArrayList();
              parms1.add("keyword1");
              parms1.add(df.format(day));
              parms1.add("#118850");

              List parms2=new ArrayList();
              parms2.add("keyword2");
              parms2.add("今日已签到！");
              parms2.add("#118850");

              List parms3=new ArrayList();
              parms3.add("remark");
              parms3.add("每日签到可获取5积分，积分可直接用于抢单！");
              parms3.add("#333333");

              List Listparms=new ArrayList();
              Listparms.add(parms); Listparms.add(parms1); Listparms.add(parms2); Listparms.add(parms3);
             result= mapService.sendJifen("h7PcZZrri0-LmppTKf1-ztD7-kItbTPuZylqj9xjB30",wexinOpenId,Listparms);
          }else{
              String swl = "select * from weixin_info t where t.openid='" + wexinOpenId + "'";
              List sqllist = mapService.getListBySql(swl);
              Map res=(Map)sqllist.get(0);
              String sjh=String.valueOf(res.get("sjh"));
              if(StringUtils.isEmpty(sjh) || sjh =="null"){
                  Date day=new Date();
                  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                  System.out.println(df.format(day));
                  List parms=new ArrayList();
                  parms.add("first");
                  parms.add("签到反馈");
                  parms.add("#118850");

                  List parms1=new ArrayList();
                  parms1.add("keyword1");
                  parms1.add(df.format(day));
                  parms1.add("#118850");

                  List parms2=new ArrayList();
                  parms2.add("keyword2");
                  parms2.add("您尚未通过手机验证码登录！");
                  parms2.add("#FF3333");

                  List parms3=new ArrayList();
                  parms3.add("remark");
                  parms3.add("每日签到可获取5积分，积分可直接用于抢单！");
                  parms3.add("#333333");

                  List Listparms=new ArrayList();
                  Listparms.add(parms); Listparms.add(parms1); Listparms.add(parms2); Listparms.add(parms3);
                  result= mapService.sendJifen("h7PcZZrri0-LmppTKf1-ztD7-kItbTPuZylqj9xjB30",wexinOpenId,Listparms);
              }else{
                  saveWeixinSign(wexinOpenId);
                  mapService.insertJifen(5,"add",sjh,"签到赠送");
                  Date day=new Date();
                  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                  System.out.println(df.format(day));
                  List parms=new ArrayList();

                  parms.add("first");
                  parms.add("您的积分账户有新的变动，具体内容如下:");
                  parms.add("#118850");

                  List parms2=new ArrayList();
                  parms2.add("keyword1");
                  parms2.add(df.format(day));
                  parms2.add("#118850");

                  List parms3=new ArrayList();
                  parms3.add("keyword2");
                  parms3.add("5分");
                  parms3.add("#118850");

                  List parms4=new ArrayList();
                  parms4.add("keyword3");
                  parms4.add("签到成功获得积分！");
                  parms4.add("#118850");

                  int  sumjin= mapService.getJiFenSum(sjh);
                  List parms5=new ArrayList();
                  parms5.add("keyword4");
                  parms5.add(sumjin+"分");
                  parms5.add("#118850");

                  List parms6=new ArrayList();
                  parms6.add("remark");
                  parms6.add("每日签到可获取5积分，积分可直接用于抢单！");
                  parms6.add("#333333");

                  List Listparms=new ArrayList();
                  Listparms.add(parms); Listparms.add(parms2); Listparms.add(parms3);Listparms.add(parms4);Listparms.add(parms5);Listparms.add(parms6);
                  result=  mapService.sendJifen("sCC6Bz_TkGK_twK5SqnSJBYWNzO-yzyn9iSDJAOX4wc",wexinOpenId,Listparms);
              }
          }
          if(result){
              model.addAttribute("isSign","ok");
          }else{
              model.addAttribute("isSign","no");
          }
         return "sign";
    }

    // 保存签到信息
    public  void saveWeixinSign(String openId) {
        if(StringUtils.isNotEmpty(openId)){
            String sql = "insert into weixin_sign (open_id,sign_time) values ('"+openId+"',now())";
            mapService.execute(sql);
        }
    }

}

