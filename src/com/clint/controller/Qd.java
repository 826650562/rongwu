package com.clint.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

import net.sf.json.JSONArray;
import org.springframework.ui.Model;

//抢单相关
@Controller
@RequestMapping(value = "/wyqd")
public class Qd {

	@Resource(name = "mapService")
	private MapService mapService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest req, Model model) {
		String wexinOpenId = (String) req.getSession().getAttribute(Global.WEIXINOPENID);
		if (StringUtils.isNotEmpty(wexinOpenId)) {
			model.addAttribute("wexinOpenId", wexinOpenId);
		} else {
			model.addAttribute("wexinOpenId", "");
			//model.addAttribute("wexinOpenId", "opT5v0iSEeH8QB5nzL7vDRtS3YeA");
		}
		return "qd_oauth";
	}

	@RequestMapping(value = "/wyqdjsp")
	public String wyqdjsp(HttpServletRequest req, HttpServletResponse response, Model model) {
		String wexinOpenId = (String) req.getSession().getAttribute(Global.WEIXINOPENID);
		if (StringUtils.isNotEmpty(wexinOpenId)) {
			model.addAttribute("wexinOpenId", wexinOpenId);
		} else {
			model.addAttribute("wexinOpenId", "");
			//model.addAttribute("wexinOpenId", "opT5v0iSEeH8QB5nzL7vDRtS3YeA");

		}
		return "wyqd";
	}

	// 设置
	@RequestMapping(value = "/_sz")
	public String sz() {
		return "sz";
	}

	// 充值
	@RequestMapping(value = "/_cz")
	public String cz(Model model) {
		model.addAttribute("payURL", Constant.PAY_URL);
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

	// 我的余额
	@RequestMapping(value = "/myye")
	public String myye() {
		return "myye";
	}

	// 充值记录
	@RequestMapping(value = "/chongzhiJL")
	public String chongzhiJL() {
		return "chongzhiJL";
	}

	// 我的积分
	@RequestMapping(value = "/wodejifen")
	public String wodejifen() {
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

/*	// 民间封控
	@RequestMapping(value = "/mjfk_wd")
	public String mjfk() {
		return "mjfk";
	}*/

	// 分享微店
	@RequestMapping(value = "/fxwd_wd")
	public String fxwd_wd(HttpServletRequest req, Model model) {
		String wexinOpenId = (String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
		model.addAttribute("userInfo", wexinOpenId);
		return "fxwd";
	}

	// 微店排行
	@RequestMapping(value = "/wdph_wd")
	public String wdph_wd() {
		return "wdph";
	}

	// 民间风控
	@RequestMapping(value = "/mjfk_wd")
	public String mjfk_wd() {
		return "mjfk";
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
		Oauth2Action oa = new Oauth2Action();
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
			model.addAttribute(Global.WEIXINOPENID, map.get("openid"));
			System.out.println("redirect:" + jsp);
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
		String id = (String) req.getParameter("id");
		String Sql = "update user set " + info + "='" + value + "' where id=" + "'" + id + "'";
		try {
			this.mapService.execute(Sql);
			response.getWriter().write("updateInfo_100");
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@RequestMapping(value = "/getInfouserOfweixin")
	public void getInfouserOfweixin(HttpServletRequest req, HttpServletResponse response) {
		String _wxInfoId = (String) req.getParameter("wxInfoId");

		List allres = new ArrayList();
		String sql = "select * from weixin_info where openid='" + _wxInfoId + "'";
		List list = mapService.getListBySql(sql);
		System.out.println(sql);
		allres.add(list);
		if(list.size()>0){
			Map wx_user = (Map) list.get(0);
			String sjh = (String) wx_user.get("sjh");
			if (StringUtils.isNotBlank(sjh)) {
				String gzsql = "select * from sjh_gzzpic where sjh='" + sjh + "'";
				String grsql = "select * from sjh_sfzpic where sjh='" + sjh + "'";
				String usersql = "select * from user where sjh='" + sjh + "'";
				String wdsql = "select * from wd where sjh='" + sjh + "'";
				List gzsqllist = mapService.getListBySql(gzsql);
				List grsqllist = mapService.getListBySql(grsql);
				List userlist = mapService.getListBySql(usersql);
				List wdlist = mapService.getListBySql(wdsql);
				allres.add(gzsqllist);
				allres.add(grsqllist);
				allres.add(userlist);
				allres.add(wdlist);
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

		List sjhList = this.mapService.getListBySql(sqlBf.toString());
		if (sjhList.size() > 0) {
			JSONArray jsonArray = JSONArray.fromObject(sjhList);
			response.getWriter().write(jsonArray.toString());
		} else {
			response.getWriter().write("10010");
		}

	}

}
