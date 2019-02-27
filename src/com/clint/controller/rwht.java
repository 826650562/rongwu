package com.clint.controller;

import com.clint.model.Global;
import com.clint.service.MapService;
import com.clint.service.PersonService;
import com.clint.untils.DloadImgUtil;
import com.clint.untils.Outer;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/rwht")
public class rwht {
	@Resource(name = "mapService")
	private MapService mapService;

	@RequestMapping(value = "/dksqkhList")
	public String dksqkhList(HttpServletRequest req, Model model) {
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		String sql="select * from yh_dk  order by   kh_status";
		List res=mapService.getJdbcTemplate().queryForList(sql);
		model.addAttribute("yh_dk",res);
		return "/rwjrht/dksqkhList";
	}

	@RequestMapping(value = "/getAllDksq")
	public void getAllDksq(HttpServletRequest req,HttpServletResponse response, Model model) throws IOException {
		String sql="select * from yh_dk  order by   kh_status";
		List res=mapService.getJdbcTemplate().queryForList(sql);
		JSONArray jsonArray = JSONArray.fromObject(res);
		response.getWriter().write(jsonArray.toString());
	}


	@RequestMapping(value = "/getSqinfoByid")
	public void getSqinfoByid(HttpServletRequest req,HttpServletResponse response, Model model)  throws IOException{
		String _sjh = (String) req.getParameter("id");
		String sql="SELECT  * FROM  shenqing_user  where  sjh="+_sjh;
		List res=mapService.getJdbcTemplate().queryForList(sql);
		JSONArray jsonArray = JSONArray.fromObject(res);
		response.getWriter().write(jsonArray.toString());
	}

	@RequestMapping(value = "/update_dksq")
	public void update_dksq(HttpServletRequest req,HttpServletResponse response, Model model) throws IOException{
		String _id = (String) req.getParameter("id");
		String value = (String) req.getParameter("value");
		String _sjh = (String) req.getParameter("_sjh");

		String sql="update  yh_dk  set status ='1',qiangdan_jiawei='"+value+"' where  id="+_id;
		mapService.getJdbcTemplate().execute(sql);

		List _opendMap= mapService.getJdbcTemplate().queryForList("SELECT openid from weixin_info where sjh="+_sjh);
		Map open=(Map)_opendMap.get(0);

		String openid =String.valueOf(open.get("openid"));
		if(!openid.equals("null")){
			Date day=new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(df.format(day));
			List parms=new ArrayList();
			parms.add("first");
			parms.add("平台通过了您的融资申请");
			parms.add("#118850");

			List parms1=new ArrayList();
			parms1.add("keyword1");
			parms1.add("融资申请");
			parms1.add("#118850");

			List parms2=new ArrayList();
			parms2.add("keyword2");
			parms2.add(df.format(day));
			parms2.add("#118850");

			List parms3=new ArrayList();
			parms3.add("remark");
			parms3.add("您的贷款信息正在被火热抢单中，抢单成功后将及时通知你！");
			parms3.add("#333333");

			List Listparms=new ArrayList();
			Listparms.add(parms); Listparms.add(parms1); Listparms.add(parms2); Listparms.add(parms3);
			mapService.sendJifen("nKQbEBdR5334CVWIaGKpo_WccbPE6YwVtcuie4IDbGw",openid,Listparms);
		}

		response.getWriter().write("success");
	};

	@RequestMapping(value = "/dksqtz")
	public String dksqtz(HttpServletRequest req, Model model) {
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		return "/rwjrht/dksqtz";
	}

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest req, Model model) {
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		return "/rwjrht/login";
	}

	@RequestMapping(value = "/checkLogin")
	public void checkLogin(HttpServletRequest req, Model model,HttpServletResponse response) throws IOException{
		String user_ = (String) req.getParameter("user");
		String parrword = (String) req.getParameter("Parrword");
		String sql="SELECT  * FROM  sz  where  user_login='"+user_+"' and user_password='"+parrword+"'";
		List res=mapService.getJdbcTemplate().queryForList(sql);
	    if(res.size()>0){
			req.getSession().setAttribute("user",user_+"_"+parrword);
			response.getWriter().write("success");
		}else{
			response.getWriter().write("error");
		}
	}

	@RequestMapping(value = "/LoginOut")
	public String LoginOut(HttpServletRequest req, Model model,HttpServletResponse response)  {
		req.getSession().setAttribute("user","");
		return "/rwjrht/login";
	}

	@RequestMapping(value = "/qdzdkh")
	public String qdzdkh(HttpServletRequest req, Model model) {
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		String sql="select  t.* ,u.realname, FROM_UNIXTIME(t.date/1000, '%Y-%m-%d %H:%i:%S')  as sqdate,  FROM_UNIXTIME(t.qd_date/1000, '%Y-%m-%d %H:%i:%S')  as qddate  from yh_dk  t   join   user u  on t.sjh =u.sjh where t.status=2  ";
		List res=mapService.getJdbcTemplate().queryForList(sql);
		model.addAttribute("yh_dk2",res);
		return "/rwjrht/qdzdkh";
	}


	@RequestMapping(value = "/xdjlgl")
	public String xdjlgl(HttpServletRequest req, Model model) {
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		String sql="select * from user u  join jifenyue  j   on  u.sjh=j.sjh   join yue y  on  y.sjh=u.sjh  where delete_=0   order by   u.id ";
		List res=mapService.getJdbcTemplate().queryForList(sql);
		model.addAttribute("user",res);
		return "/rwjrht/xdjlgl";
	}
	@RequestMapping(value = "/xdjlglDetail")
	public String xdjlglDetail(HttpServletRequest req, Model model) {
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		return "/rwjrht/xdjlglDetail";
	}

	@RequestMapping(value = "/xdjlsfshsq")
	public String xdjlsfshsq(HttpServletRequest req, Model model) {
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		String sql="select * from user where sfz<>''";
		List res=mapService.getJdbcTemplate().queryForList(sql);
		model.addAttribute("users",res);
		return "/rwjrht/xdjlsfshsq";
	}

	@RequestMapping(value = "/xdjlshDetail")
	public String xdjlshDetail(HttpServletRequest req, Model model) {
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		String _id = (String) req.getParameter("id");
		String sql="select t1.*,t2.gzzp,t3._beforpic,t3._afterpic,t3._mepic   from user  t1  join sjh_gzzpic t2  on t1.sjh=t2.sjh  join   sjh_sfzpic t3  on t3.sjh=t1.sjh  where  t1.id="+_id;
		List res=mapService.getJdbcTemplate().queryForList(sql);
		model.addAttribute("user",res);
		return "/rwjrht/xdjlshDetail";
	}

	@RequestMapping(value = "/xdjlsqtz")
	public String xdjlsqtz(HttpServletRequest req, Model model) {
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		return "/rwjrht/xdjlsqtz";
	}

	@RequestMapping(value = "/shbtg")
	public void shbtg(HttpServletRequest req, Model model,HttpServletResponse response) throws IOException{
		String _id = (String) req.getParameter("id");
		String _sjh = (String) req.getParameter("_sjh");

		List _opendMap= mapService.getJdbcTemplate().queryForList("SELECT openid from weixin_info where sjh="+_sjh);
		Map open=(Map)_opendMap.get(0);

		String openid =String.valueOf(open.get("openid"));
		if(!openid.equals("null")){
			Date day=new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(df.format(day));
			List parms=new ArrayList();
			parms.add("first");
			parms.add("平台通过了您的资格审核");
			parms.add("#118850");

			List parms1=new ArrayList();
			parms1.add("keyword1");
			parms1.add("资格审核");
			parms1.add("#118850");

			List parms2=new ArrayList();
			parms2.add("keyword2");
			parms2.add(df.format(day));
			parms2.add("#118850");

			List parms3=new ArrayList();
			parms3.add("remark");
			parms3.add("恭喜您通过平台审核可以抢单了！");
			parms3.add("#333333");

			List Listparms=new ArrayList();
			Listparms.add(parms); Listparms.add(parms1); Listparms.add(parms2); Listparms.add(parms3);
			mapService.sendJifen("rC4xEBxbW4bRxnepVIjdgioyI0vTqa3l1y8fbUcvNlQ",openid,Listparms);
		}

		String sql="update user set ispass=2 where id="+_id;
		mapService.getJdbcTemplate().execute(sql);
		response.getWriter().write("success");
	}

	@RequestMapping(value = "/notg")
	public void notg(HttpServletRequest req, Model model,HttpServletResponse response) throws IOException{
		String _id = (String) req.getParameter("id");
		String _sjh = (String) req.getParameter("_sjh");
		String msg = (String) req.getParameter("msg");

		List _opendMap= mapService.getJdbcTemplate().queryForList("SELECT openid from weixin_info where sjh="+_sjh);
		Map open=(Map)_opendMap.get(0);

		String openid =String.valueOf(open.get("openid"));
		if(!openid.equals("null")){
			Date day=new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(df.format(day));
			List parms=new ArrayList();
			parms.add("first");
			parms.add("平台没有通过您的资格审核");
			parms.add("#118850");

			List parms1=new ArrayList();
			parms1.add("keyword1");
			parms1.add("资格审核");
			parms1.add("#118850");

			List parms2=new ArrayList();
			parms2.add("keyword2");
			parms2.add(msg);
			parms2.add("#118850");

			List parms3=new ArrayList();
			parms3.add("keyword3");
			parms3.add(df.format(day));
			parms3.add("#118850");

			List parms4=new ArrayList();
			parms4.add("remark");
			parms4.add("您的帐号审核未通过，请您重新提交！");
			parms4.add("#333333");

			List Listparms=new ArrayList();
			Listparms.add(parms); Listparms.add(parms1); Listparms.add(parms2); Listparms.add(parms3);Listparms.add(parms4);
			mapService.sendJifen("kL5deYsTJNRoxw4MiX25BmGGDOTpCfbeToZi_9n2w5I",openid,Listparms);
		}

		String sql="update user set ispass=1,passInfo='"+msg+"'  where id="+_id;
		mapService.getJdbcTemplate().execute(sql);
		response.getWriter().write("success");
	}





	@RequestMapping(value = "/deleteXdjl")
	public String deleteXdjl(HttpServletRequest req, Model model) {
		String _id = (String) req.getParameter("id");
		String sql="update user set delete_=1 where id="+_id;
		mapService.getJdbcTemplate().execute(sql);
		if(checkisLogin(req)){
			return "/rwjrht/login";
		}
		return "sucess";
	}

	public Boolean checkisLogin(HttpServletRequest req){
		String user=String.valueOf(req.getSession().getAttribute("user"));
        if(user.equals("null")){
			return  true;
		}else
		return  false;
	}

    @RequestMapping(value = "/updateSz")
	public void  updateSz(HttpServletRequest req,HttpServletResponse response) throws IOException{
        String dlmc = (String) req.getParameter("dlmc");
        String passwrod = (String) req.getParameter("passwrod");
        String zcsjf = (String) req.getParameter("zcsjf");
        String seletOption = (String) req.getParameter("seletOption");


		 StringBuffer bf=new  StringBuffer("UPDATE sz SET   ");

		  if(!"".equals(dlmc) && null!=(dlmc)){
			  bf.append("user_login ='"+dlmc+"', ");
		  }
			if(!"".equals(passwrod)&& null!=(passwrod)){
				bf.append("user_password ='"+passwrod+"', ");
			}
			if(!"".equals(zcsjf)&&  null!=(zcsjf)){
				bf.append("jifenofZc ='"+zcsjf+"', ");
			}
			if(!"".equals(seletOption)&&  null!=(seletOption)){
				bf.append("jifenOfcz ='"+seletOption+"', ");
			}
		 bf.append("  id=0" );

		  try {
			  mapService.getJdbcTemplate().execute(bf.toString());
			  response.getWriter().write("success");

		  }catch (Exception e){
			  response.getWriter().write("error");
		  }


	}



}
