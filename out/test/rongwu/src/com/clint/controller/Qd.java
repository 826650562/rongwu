package com.clint.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.model.Global;
import com.clint.service.MapService;
import com.clint.untils.Oauth2Action;
import com.clint.untils.Outer;

import com.clint.untils.*;

import net.sf.json.JSONArray;

//抢单相关
@Controller
@RequestMapping(value = "/wyqd")
public class Qd {

    @Resource(name = "mapService")
    private MapService mapService;


    @RequestMapping(value = "/index")
    public String index(HttpServletRequest req, Model model,HttpServletResponse response) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.WEIXINOPENID);
        if (StringUtils.isNotEmpty(wexinOpenId)) {
            model.addAttribute("wexinOpenId", wexinOpenId);
        }else {
            // model.addAttribute("wexinOpenId", "");
            model.addAttribute("wexinOpenId", "");
        }
        return "qd_oauth";
    }

    @RequestMapping(value = "/wyqdjsp")
    public String wyqdjsp(HttpServletRequest req, HttpServletResponse response, Model model) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.WEIXINOPENID);
        if (StringUtils.isNotEmpty(wexinOpenId)) {
            model.addAttribute("wexinOpenId", wexinOpenId);
        }
        return "wyqd";
    }

    // 设置
    @RequestMapping(value = "/_sz")
    public String sz(HttpServletRequest req, Model model) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        model.addAttribute("sjh", users[1]);
        return "sz";
    }

    // 充值
    @RequestMapping(value = "/_cz")
    public String cz(HttpServletRequest req, HttpServletResponse response, Model model) {
        String yue = this.getYue(req, model);
        model.addAttribute("payURL", Constant.PAY_URL);
        model.addAttribute("yue", yue);
        return "cz";
    }

    // 个人信息修改
    @RequestMapping(value = "/grxx_xg")
    public String grxx_xg() {
        return "grxx_xg";
    }

    // 支付密码信息修改信息修改
    @RequestMapping(value = "/zfmm_xg")
    public String zfmm_xg() {
        return "zfmm_xg";
    }

    // 密码信息修改信息修改
    @RequestMapping(value = "/mmsz_xg")
    public String mmsz_xg() {
        return "mmsz_xg";
    }

    public String getYue(HttpServletRequest req, Model model) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        String sql = "select yue from yue where sjh='" + users[1] + "'";
        List list = mapService.getListBySql(sql);
        Map map = (Map) list.get(0);
        return String.valueOf(map.get("yue"));

    }

    // 我的余额
    @RequestMapping(value = "/myye")
    public String myye(HttpServletRequest req, HttpServletResponse response, Model model) {
        model.addAttribute("yue", getYue(req, model));
        return "myye";
    }

    // 充值记录
    @RequestMapping(value = "/chongzhiJL")
    public String chongzhiJL(HttpServletRequest req, HttpServletResponse response, Model model) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        String sql = "select timeStamp,jine from cz_jl where sjh='" + users[1] + "' ORDER BY `timeStamp` desc   LIMIT 0,20";
        List list = mapService.getListBySql(sql);
        model.addAttribute("value", list);
        return "chongzhiJL";
    }

    // 我的积分
    @RequestMapping(value = "/wodejifen")
    public String wodejifen(HttpServletRequest req, HttpServletResponse response, Model model) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        String sql = "select * from jifen where sjh='" + users[1] + "'  ORDER BY `timeStamp` desc   LIMIT 0,20";
        List list = mapService.getListBySql(sql);
        List list2 = mapService.getListBySql("select jifenyue from jifenyue where sjh='" + users[1] + "'");
        model.addAttribute("value", list);
        Map map=(Map)list2.get(0);
        model.addAttribute("jifenyue", map.get("jifenyue"));
        return "wodejifen";
    }

    // 公司名称修改
    @RequestMapping(value = "/setgsmc")
    public String setgsmc() {
        return "setgsmc";
    }

    // 个人职位修改
    @RequestMapping(value = "/grzwxg")
    public String grzwxg() {
        return "grzwxg";
    }

    // 个人产品
    @RequestMapping(value = "/grcp_wd")
    public String grcp_wd() {
        return "grcp";
    }

    // 添加个人产品
    @RequestMapping(value = "/tjgrcp")
    public String mjfk(HttpServletRequest req, HttpServletResponse response, Model model) {
        String _id = (String) req.getParameter("_id");
        if (StringUtils.isNotBlank(_id) && _id != "null") {
            model.addAttribute("_id", _id);
            return "tjgrcp";
        }
        return "tjgrcp";
    }

    // 添加产品标签
    @RequestMapping(value = "/add_tage")
    public void add_tage(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String _add_tage = (String) req.getParameter("tag");

        String sql = "select * from wd_tage where tage_name='" + _add_tage + "'";
        List list = mapService.getListBySql(sql);
        if (list.size() > 0) {
            response.getWriter().write("wdInfo_101");
        } else {
            String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
            String[] users = mapService.getUser_sjh_openid(wexinOpenId);
            mapService.execute(
                    "insert into wd_tage (tage_name,tage_sjh)values('" + _add_tage + "','" + users[1] + "' );");
        }

        response.getWriter().write("wdInfo_100");
    }

    // 添加产品特点
    @RequestMapping(value = "/add_cptd")
    public void add_cptd(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String _add_tage = (String) req.getParameter("td");

        String sql = "select * from wd_cptd where td='" + _add_tage + "'";
        List list = mapService.getListBySql(sql);
        if (list.size() > 0) {
            response.getWriter().write("wdInfo_101");
        } else {
            String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
            String[] users = mapService.getUser_sjh_openid(wexinOpenId);
            mapService.execute("insert into wd_cptd (td,sjh)values('" + _add_tage + "','" + users[1] + "' );");
        }

        response.getWriter().write("wdInfo_100");
    }

    // 添加个人产品名称
    @RequestMapping(value = "/proect_name")
    public String proect_name(HttpServletRequest req, Model model) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        String sql = "select * from wd_tage where tage_sjh='1000' or tage_sjh='" + users[1] + "' ";
        List list = mapService.getListBySql(sql);
        ArrayList resList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map res = (Map) list.get(i);
            resList.add(res.get("tage_name"));
        }
        model.addAttribute("tage_names", resList);
        return "wd_cpmc";
    }

    // 添加个人产品特点
    @RequestMapping(value = "/proect_tedian")
    public String proect_tedian(HttpServletRequest req, Model model) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        String sql = "select * from wd_cptd where sjh='1000' or sjh='" + users[1] + "' ";
        List list = mapService.getListBySql(sql);
        ArrayList resList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map res = (Map) list.get(i);
            resList.add(res.get("td"));
        }
        model.addAttribute("tage_names", resList);
        return "wd_cptd2";
    }

    // 分享微店
    @RequestMapping(value = "/fxwd_wd")
    public String fxwd_wd(HttpServletRequest req, Model model) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        model.addAttribute("userInfo", wexinOpenId);
        return "fxwd";
    }

    @RequestMapping(value = "/get_fxwd_info")
    public void get_fxwd_info(HttpServletRequest req,HttpServletResponse response, Model model) throws IOException  {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);

        String swl = "select * from cp_xq t where t.sjh='" +users[1] + "'";
        List sqllist = mapService.getListBySql(swl);
        JSONArray jsonArray = JSONArray.fromObject(sqllist);
        response.getWriter().write(jsonArray.toString());
    }


    // 微店排行
    @RequestMapping(value = "/wdph_wd")
    public String wdph_wd() {
        return "wdph";
    }

    // 贷款要求
    @RequestMapping(value = "/wd_cpdkYq")
    public String wd_cpdkYq(HttpServletRequest req, HttpServletResponse response, Model model) {
        String _id = (String) req.getParameter("_id");
        if (StringUtils.isNotBlank(_id) && _id != "null") {
            model.addAttribute("_id", _id);
        } else
            model.addAttribute("_id", "");
        return "wd_cpdkYq";
    }

    // 民间风控
    @RequestMapping(value = "/mjfk_wd")
    public String mjfk_wd( HttpServletRequest req,Model model) {
        List list = null;
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        try {
            list= this.mapService.getListBySql("select * from mjfk where sjh="+"'"+users[1]+"' order by id DESC ");
            model.addAttribute("listOfMjfk", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "mjfk";
    }

    @RequestMapping(value = "/deleteMjfk")
    public void deleteMjfk(HttpServletRequest req, HttpServletResponse response) throws IOException {

        String _id = (String) req.getParameter("_id");
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        try {
            this.mapService.execute("delete from mjfk where id="+"'"+_id+"'  and sjh= '"+users[1]+"'");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @RequestMapping(value = "/setMjfk")
    public void setMjfk(HttpServletRequest req, HttpServletResponse response) throws IOException {

        String ku_name = (String) req.getParameter("ku_name");
        String kh_sfzh = (String) req.getParameter("kh_sfzh");
        String kh_sjh = (String) req.getParameter("kh_sjh");
        String kh_jtzz = (String) req.getParameter("kh_jtzz");
        String kh_dkyt = (String) req.getParameter("kh_dkyt");
        String kh_dked = (String) req.getParameter("kh_dked");
        String kh_fkrq = (String) req.getParameter("kh_fkrq");
        String fkr = (String) req.getParameter("fkr");
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);

        try {
            this.mapService.execute("insert into mjfk  (kh_name,sfzh,dhhm,jtzs,dkyt,dked,fkrq,fkr,sjh)values('"+ku_name+"','"+kh_sfzh+
                    "','"+kh_sjh+"','"+kh_jtzz+"','"+kh_dkyt+"','"+kh_dked+"','"+kh_fkrq+"','"+fkr+"','"+users[1]+"') ");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/searchcp_wd")
    public void searchcp_wd(HttpServletRequest req, HttpServletResponse response) throws IOException {
        List list = null;
        String _id = (String) req.getParameter("id");
        if (StringUtils.isNotBlank(_id) && _id != "null") {
            list = this.mapService.getListBySql("select * from cp_xq where id=" + _id);
        } else
            list = this.mapService.getListBySql("select * from cp_xq");
        JSONArray jsonArray = JSONArray.fromObject(list);
        response.getWriter().write(jsonArray.toString());
    }

    @RequestMapping(value = "/deletecp_wd")
    public void deletecp_wd(HttpServletRequest req, HttpServletResponse response) throws IOException {
        List list = null;
        String _id = (String) req.getParameter("_id");
        if (StringUtils.isNotBlank(_id) && _id != "null") {
            this.mapService.execute("delete from cp_xq where id=" + _id);
        }
        list = this.mapService.getListBySql("select * from cp_xq");
        JSONArray jsonArray = JSONArray.fromObject(list);
        response.getWriter().write(jsonArray.toString());
    }


    @RequestMapping(value = "/addcpYq_wd")
    public void addcpYq_wd(HttpServletRequest req, HttpServletResponse response) throws IOException {

        String wd_zysf = (String) req.getParameter("wd_zysf");
        String wd_sbyq = (String) req.getParameter("wd_sbyq");
        String wd_gjjyq = (String) req.getParameter("wd_gjjyq");
        String wd_fcyq = (String) req.getParameter("wd_fcyq");
        String wd_ccyq = (String) req.getParameter("wd_ccyq");

        String wd_xyzk = (String) req.getParameter("wd_xyzk");
        String wd_bxyq = (String) req.getParameter("wd_bxyq");

        String wd_xyyq = (String) req.getParameter("wd_xyyq");

        String wd_wldyq = (String) req.getParameter("wd_wldyq");
        String wd_nl = (String) req.getParameter("wd_nl");

        String id = "";
        String cp_id = String.valueOf(req.getSession().getAttribute("cp_id"));
        if (cp_id != "null") { //s == null ||
            id = cp_id;
        } else
            id = (String) req.getParameter("_id");
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);

        if (StringUtils.isNotBlank(id) && id != "null") {
            String sql = "update cp_xq set  zysf='" + wd_zysf + "' ,nianling='" + wd_nl + "' ,sbyq='" + wd_sbyq + "'"
                    + ",gjjyq='" + wd_gjjyq + "',fcyq='" + wd_fcyq + "',ccyq='" + wd_ccyq + "',xyqk='" + wd_xyzk + "'"
                    + ",bxjffs='" + wd_bxyq + "',zmxy='" + wd_xyyq + "',wld='" + wd_wldyq + "'" + "where sjh='"
                    + users[1] + "' and  id=" + "'" + id + "'";
            try {
                this.mapService.execute(sql);
                response.getWriter().write("wdInfo_100");
            } catch (Exception e) {
                response.getWriter().write("wdInfo_101");
            }
        }

    }


    // 提交个人产品
    @RequestMapping(value = "/addcp_wd")
    public void addcp_wd(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String name = (String) req.getParameter("name");
        String project_td = (String) req.getParameter("project_td");
        String fuWuResult = (String) req.getParameter("fuWuResult");
        String daiKuanResult = (String) req.getParameter("daiKuanResult");

        String _ylvfw = (String) req.getParameter("_ylvfw");
        String ycxsf = (String) req.getParameter("ycxsf");
        String sxcl = (String) req.getParameter("sxcl");

        String ed = (String) req.getParameter("ed");
        String showDaiQi = (String) req.getParameter("showDaiQi");
        String sendTimeResult = (String) req.getParameter("sendTimeResult");

        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);

        String sql = "insert into cp_xq (cpmc,cptd,fwzl,dkfs,llfw,sxf,sxcl,ed,fksj,dkqx,sjh)values('" + name + "','"
                + project_td + "','" + fuWuResult + "','" + daiKuanResult + "','" + _ylvfw + "','" + ycxsf + "','"
                + sxcl + "','" + ed + "','" + sendTimeResult + "','" + showDaiQi + "','" + users[1] + "');";

        try {
            this.mapService.execute(sql);

            List list = this.mapService.getListBySql("select id from cp_xq order by id DESC");

            Map m = (Map) list.get(0);
            String Maxid = String.valueOf(m.get("id"));
            if (StringUtils.isNotBlank(Maxid) && Maxid != "null")
                req.getSession().setAttribute("cp_id", Maxid);
            response.getWriter().write("wdInfo_100");
        } catch (Exception e) {
            response.getWriter().write("wdInfo_101");
        }
    }

    @RequestMapping(value = "/updatecp_wd")
    public void updatecp_wd(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String id = (String) req.getParameter("id");
        String name = (String) req.getParameter("name");
        String project_td = (String) req.getParameter("project_td");
        String fuWuResult = (String) req.getParameter("fuWuResult");
        String daiKuanResult = (String) req.getParameter("daiKuanResult");

        String _ylvfw = (String) req.getParameter("_ylvfw");
        String ycxsf = (String) req.getParameter("ycxsf");
        String sxcl = (String) req.getParameter("sxcl");

        String ed = (String) req.getParameter("ed");
        String showDaiQi = (String) req.getParameter("showDaiQi");
        String sendTimeResult = (String) req.getParameter("sendTimeResult");

        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);

        String sql = "update cp_xq set  cpmc='" + name + "' ,cptd='" + project_td + "' ,fwzl='" + fuWuResult + "'"
                + ",dkfs='" + daiKuanResult + "',llfw='" + _ylvfw + "',sxf='" + ycxsf + "',sxcl='" + sxcl + "'"
                + ",ed='" + ed + "',fksj='" + showDaiQi + "',dkqx='" + sendTimeResult + "'" + "where sjh='"
                + users[1] + "' and  id=" + "'" + id + "'";
        try {
            this.mapService.execute(sql);
            response.getWriter().write("wdInfo_100");
        } catch (Exception e) {
            response.getWriter().write("wdInfo_101");
        }
    }


    // 引导页
    @RequestMapping(value = "/ydy_wd")
    public void ydy_wd(HttpServletRequest req, HttpServletResponse response) {
        String rqwxfje = (String) req.getParameter("rqxfje");
        String rqwddbs = (String) req.getParameter("rqdds");
        String wd_area = (String) req.getParameter("sm");
        String sjh = (String) req.getParameter("sjh");

        String sql = "insert into wd (rqxfje,rqdds,sm,sjh)values('" + rqwxfje + "','" + rqwddbs + "','" + wd_area
                + "','" + sjh + "'" + ");";
        try {
            this.mapService.execute(sql);
            response.getWriter().write("wdInfo_100");
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    @RequestMapping(value = "/getuserInfo")
    public String getuserInfo(HttpServletRequest req, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        String echostr = req.getParameter("echostr");
        String jsp = req.getParameter("jsp");
        HashMap map = Oauth2Action.auth(req, response, echostr);
        if (map.size() > 0) {
            // 存在数据库
            String swl = "select * from weixin_info t where t.openid='" + map.get("openid") + "'";
            List sqllist = mapService.getListBySql(swl);
            if (sqllist.size() > 0) {
            } else {
                String sql = "insert into weixin_info (openid,nickname,sex,province,city,country,imgsrc)values('"
                        + map.get("openid") + "','" + map.get("nickname") + "','" + map.get("sex") + "','"
                        + map.get("province") + "','" + map.get("city") + "','" + map.get("country") + "','"
                        + map.get("imgsrc") + "');";
                this.mapService.execute(sql);
            }
            req.getSession().setMaxInactiveInterval(-1);
            req.getSession().setAttribute(Global.WEIXINOPENID, map.get("openid"));
            req.getSession().setAttribute(Global.access_token, map.get("access_token"));

            model.addAttribute(Global.WEIXINOPENID, map.get("openid"));
            return "redirect:" + jsp;
        } else {
            return "login";
        }
    }

    @RequestMapping(value = "/dkrxx")
    public String dkrxx() {
        return "dkrxx";
    }

    // 更新
    @RequestMapping(value = "/updateInfo")
    public void updateInfo(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String info = (String) req.getParameter("info");
        String value = (String) req.getParameter("value");

        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        String Sql = "update user set " + info + "='" + value + "' where sjh=" + "'" + users[1] + "'";

        try {
            this.mapService.execute(Sql);
            response.getWriter().write("updateInfo_100");
        } catch (Exception e) {
            // TODO: handle exception
        }

    }

    @RequestMapping(value = "/getInfouserOfweixin")
    public void getInfouserOfweixin(HttpServletRequest req, HttpServletResponse response) {
        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);
        List allres = new ArrayList();
        String sql = "select * from weixin_info where openid='" + users[2] + "'";
        List list = mapService.getListBySql(sql);
       // System.out.println(sql);
        allres.add(list);
        if (list.size() > 0) {
            Map wx_user = (Map) list.get(0);
            String sjh = (String) wx_user.get("sjh");
            if (StringUtils.isNotBlank(sjh) && sjh != "null") {
                String gzsql = "select * from sjh_gzzpic where sjh='" + sjh + "'";
                String grsql = "select * from sjh_sfzpic where sjh='" + sjh + "'";
                String usersql = "select * from user where sjh='" + sjh + "'";
                String wdsql = "select * from wd where sjh='" + sjh + "'";
                List gzsqllist = mapService.getListBySql(gzsql);
                List grsqllist = mapService.getListBySql(grsql);
                List userlist = mapService.getListBySql(usersql);
                List wdlist = mapService.getListBySql(wdsql);
                List yuelist = this.mapService.getyueJfenAndcz(sjh);

                allres.add(gzsqllist);
                allres.add(grsqllist);
                allres.add(userlist);
                allres.add(wdlist);
                allres.add(yuelist);
            }
        }
        try {
            JSONArray jsonArray = JSONArray.fromObject(allres);
            response.getWriter().write(jsonArray.toString());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/scPics")
    public void scPics(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String _url = (String) req.getParameter("url");
        if (!_url.isEmpty()) {
            JSONArray jsonArray = JSONArray.fromObject(buildQm(_url));
            response.getWriter().write(jsonArray.toString());
        }
    }

    //获取积分和充值余额
    @RequestMapping(value = "/getyueJfenAndcz")
    public void getyueJfenAndcz(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String _sjh = (String) req.getParameter("sjh");
        if (!_sjh.isEmpty()) {
            List res = this.mapService.getyueJfenAndcz(_sjh);
            JSONArray jsonArray = JSONArray.fromObject(res);
            response.getWriter().write(jsonArray.toString());
        }
    }

    //
    //获取积分和充值余额
    @RequestMapping(value = "/syjifenQd")
    public void syjifenQd(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String dk_id = (String) req.getParameter("dk_id");
        String _sjh = (String) req.getParameter("sjh");
        String syjifen = (String) req.getParameter("syjifen");
        List Allyue = this.mapService.getyueJfenAndcz(_sjh);
        Map m = (Map) Allyue.get(0);
        String jifenyue = String.valueOf(m.get("jifenyue"));
        //String  yue= String.valueOf(m.get("yue"));

        int sum = Integer.valueOf(jifenyue) - Integer.valueOf(syjifen);
        if (sum >= 0) {
            //加入大于0说明积分够用 int edu,String type,String sjh,String laiyuan
            try {
                this.mapService.insertJifen(Integer.valueOf(syjifen), "reduce", _sjh, "抢单扣除");
                this.mapService.execute("update yh_dk set beizhu='" + "积分抢单" + "',qiandanren='" + _sjh + "',status='" + 2 + "',qd_date='" + new Date().getTime() + "' where id='" + dk_id + "'");
                response.getWriter().write("success");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            response.getWriter().write("error");
        }
    }

    //获取积分和充值余额
    @RequestMapping(value = "/syjieQd")
    public void syjieQd(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String dk_id = (String) req.getParameter("dk_id");
        String _sjh = (String) req.getParameter("sjh");
        String syjie = (String) req.getParameter("syjie");
        List Allyue = this.mapService.getyueJfenAndcz(_sjh);
        Map m = (Map) Allyue.get(0);
        //String jifenyue = String.valueOf(m.get("jifenyue"));
        String yue = String.valueOf(m.get("yue"));

        int sum = Integer.valueOf(yue) - Integer.valueOf(syjie);
        if (sum >= 0) {
            //加入大于0说明积分够用 int edu,String type,String sjh,String laiyuan
            try {
                this.mapService.insertJIne(Integer.valueOf(syjie), "reduce", _sjh, "抢单扣除");
                this.mapService.execute("update yh_dk set beizhu='" + "现金抢单" + "',qiandanren='" + _sjh + "',status='" + 2 + "',qd_date='" + new Date().getTime() + "' where id='" + dk_id + "'");
                response.getWriter().write("success");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            //要不然
            response.getWriter().write("error");
        }
    }


    // 更新贷款单子状态
    @RequestMapping(value = "/updateQd_status")
    public void updateQd_status(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String _s = (String) req.getParameter("_s");
        String dk_id = (String) req.getParameter("id");
        try {
            this.mapService.execute("update yh_dk set kh_status='" + _s+ "' where id='" + dk_id + "'");
            response.getWriter().write("success");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 获取签名
    public List buildQm(String url) {
        Outer outer = new Outer();
        String accessToken = outer.getOuter().getAccessToken();
        String jsapi_ticket = outer.getOuter().getJsapi_ticket();

        // jsapi_ticket =
        // 3、时间戳和随机字符串
        String noncestr = UUID.randomUUID().toString().replace("-", "").substring(0, 16);// 随机字符串
        String timestamp = String.valueOf(System.currentTimeMillis() / 1000);// 时间戳

        // 4、获取url
        /* 根据JSSDK上面的规则进行计算，这里比较简单，我就手动写啦 */

        // 5、将参数排序并拼接字符串
        String str = "jsapi_ticket=" + jsapi_ticket + "&noncestr=" + noncestr + "&timestamp=" + timestamp + "&url="
                + url;

        // 6、将字符串进行sha1加密
        String signature = SHA1(str);
        HashMap map = new HashMap();
        ArrayList list = new ArrayList();
        map.put("jsapi_ticket", jsapi_ticket);
        map.put("noncestr", noncestr);
        map.put("timestamp", timestamp);
        map.put("url", url);
        map.put("signature", signature);
        list.add(map);
        return list;

    }

    /**
     * @param decript
     * @return
     */
    public static String SHA1(String decript) {
        try {
            MessageDigest digest = java.security.MessageDigest.getInstance("SHA-1");
            digest.update(decript.getBytes());
            byte messageDigest[] = digest.digest();
            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            // 字节数组转换为 十六进制 数
            for (int i = 0; i < messageDigest.length; i++) {
                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
                if (shaHex.length() < 2) {
                    hexString.append(0);
                }
                hexString.append(shaHex);
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * @param req
     * @param response
     * @throws IOException
     * @author Administrator 根据筛选条件生成抢单列表
     */
    @RequestMapping(value = "/Grabsingle")
    public void Grabsingle(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String havahose = (String) req.getParameter("fangchan");// 有车
        String havacar = (String) req.getParameter("che");
        String havasb = (String) req.getParameter("shebao");// 有社保
        String havagz = (String) req.getParameter("sbz");// 上班族
        String havagjj = (String) req.getParameter("gjj");// 公积金
        String city = (String) req.getParameter("city");// 公积金


        StringBuffer sqlBf = new StringBuffer(
                "select * from shenqing_user t join yh_dk d on t.sjh=d.sjh   where d.status=1 and t.name=d.`name` and d.`delete`='0' ");
        if (havahose != null && !havahose.isEmpty() && !havahose.equals("0")) {
            sqlBf.append(" and t.fangchan<>'无房产'");
        }
        if (havacar != null && !havacar.isEmpty() && !havacar.equals("0")) {
            sqlBf.append(" and t.che<>'无车'");
        }
        if (havasb != null && !havasb.isEmpty() && !havasb.equals("0")) {
            sqlBf.append(" and t.shebao='" + havasb + "'");
        }
        if (havagz != null && !havagz.isEmpty() && !havagz.equals("0")) {
            sqlBf.append(" and t.gz='" + havagz + "'");
        }
        if (havagjj != null && !havagjj.isEmpty() && !havagjj.equals("0")) {
            sqlBf.append(" and t.gjj='" + havagjj + "'");
        }

        if (city != null && !city.isEmpty() && !city.equals("0")) {
            sqlBf.append(" and t.adress like'%" + city + "%'");
        }


        List sjhList = this.mapService.getListBySql(sqlBf.toString());
        if (sjhList.size() > 0) {
            JSONArray jsonArray = JSONArray.fromObject(sjhList);
            response.getWriter().write(jsonArray.toString());
        } else {
            response.getWriter().write("10010");
        }

    }


    @RequestMapping(value = "/Grabsingle_kh")
    public void Grabsingle_kh(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String _status = (String) req.getParameter("_status");
        String _date = (String) req.getParameter("_date");
        String _sjh = (String) req.getParameter("yh_sjh");

        StringBuffer sqlBf = new StringBuffer(
                "select * from shenqing_user t join yh_dk d on t.sjh=d.sjh   where d.status=2  and t.name=d.`name` and d.`delete`='0' and d.kh_status='"+_status+"' ");
       if(!_date.equals("0")){
           sqlBf.append(" and qd_date>'" +_date+"'");
       }
       if(!"0".equals(_sjh) && !"".equals(_sjh)){
           sqlBf.append(" and d.sjh='" +_sjh+"'");
       }

        String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
        String[] users = mapService.getUser_sjh_openid(wexinOpenId);

        sqlBf.append(" and qiandanren='" +users[1]+"'");

        List sjhList = this.mapService.getListBySql(sqlBf.toString());
        if (sjhList.size() > 0) {
            JSONArray jsonArray = JSONArray.fromObject(sjhList);
            response.getWriter().write(jsonArray.toString());
        } else {
            response.getWriter().write("10010");
        }

    }

}
