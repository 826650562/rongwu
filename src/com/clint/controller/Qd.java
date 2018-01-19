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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.service.MapService;
import com.clint.service.PersonService;
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
		return "wyqd";
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
		String havahose = (String) req.getParameter("havahose");//有车
		String havacar = (String) req.getParameter("havacar");
		String havasb = (String) req.getParameter("havasb");//有社保
		String havagz = (String) req.getParameter("havagz");//上班族
		String havagjj = (String) req.getParameter("havagjj");//公积金
        String sjh = (String) req.getParameter("sjh");
//		String _url = (String) req.getParameter("url");
//		String _url = (String) req.getParameter("url");
		
		StringBuffer sqlBf=new StringBuffer("select * from shenqing_user t where 1=1 and sjh="+sjh);
		if(!havahose.isEmpty()){
			sqlBf.append(" and t.fangchan="+havahose);
		}
		if(!havahose.isEmpty()){
			sqlBf.append(" and t.che="+havacar);
		}
		if(!havasb.isEmpty()){
			sqlBf.append(" and t.shebao="+havasb);
		}
		if(!havagz.isEmpty()){
			sqlBf.append(" and t.gzffxs="+havagz);
		}
		if(!havagjj.isEmpty()){
			sqlBf.append(" and t.gjj="+havagjj);
		}
		
		List sjhList = this.mapService.getListBySql(sqlBf.toString());
		if (sjhList.size() <= 0) {
			this.mapService
					.execute("insert into user (sjh,dlsj)values('" + sjh + "','" + new Date().getTime() + "');");
		}
		
		
	}
	
	
	
	
	
	
}
