package com.clint.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.service.MapService;
import com.clint.service.PersonService;
import com.clint.untils.Oauth2Action;
import com.clint.untils.Outer;

import net.sf.json.JSONArray;

//抢单相关
@Controller
@RequestMapping(value = "/wyqd")
public class Qd {
	@Resource(name = "personService")
	private PersonService personService;
	@Resource(name = "mapService")
	private MapService mapService;

	@RequestMapping(value = "/index")
	public String savePersonUI() {
		return "qd_oauth";
	}

	@RequestMapping(value = "/getuserInfo")
	public String getuserInfo(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {
		String echostr = req.getParameter("echostr");
		Oauth2Action oa = new Oauth2Action();
		HashMap map = Oauth2Action.auth(req, response, echostr);
		if (map.size() > 0) {
			// 存在数据库
			String swl = "select * from weixin_info t where t.openid='" + map.get("openid")+"'";
			List sqllist = mapService.getListBySql(swl);
			if (sqllist.size() > 0) {
			} else {
				String sql = "insert into weixin_info (openid,nickname,sex,province,city,country,imgsrc)values('"
						+ map.get("openid") + "','" + map.get("nickname") + "','" + "','" + map.get("sex") + "','"
						+ map.get("province") + "','" + map.get("city") + "','" + map.get("country") + "','"
						+ map.get("imgsrc") + "');";
				System.out.println(sql);
				this.mapService.execute(sql);
			}
			return "wyqd";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/dkrxx")
	public String dkrxx() {
		return "dkrxx";
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
				"select * from shenqing_user t join yh_dk d on t.sjh=d.sjh   where 1=1 and d.status=1");
		if (havahose != null && !havahose.isEmpty() && havahose.equals("1")) {
			sqlBf.append(" and t.fangchan=" + havahose);
		}
		if (havacar != null && !havacar.isEmpty() && havacar.equals("1")) {
			sqlBf.append(" and t.che=" + havacar);
		}
		if (havasb != null && !havasb.isEmpty() && havasb.equals("1")) {
			sqlBf.append(" and t.shebao=" + havasb);
		}
		if (havagz != null && !havagz.isEmpty() && havagz.equals("1")) {
			sqlBf.append(" and t.gzffxs=" + havagz);
		}
		if (havagjj != null && !havagjj.isEmpty() && havahose.equals("1")) {
			sqlBf.append(" and t.gjj=" + havagjj);
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
