package com.clint.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.service.MapService;
import com.clint.untils.DloadImgUtil;
import com.clint.untils.Oauth2Action;
import com.clint.untils.Outer;
import com.clint.controller.Constant;
import com.clint.model.Global;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value = "/sfzyz")
public class Sfyz {

	@Resource(name = "mapService")
	private MapService mapService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest req, Model model) {
		String wexinOpenId=(String) req.getSession().getAttribute(Global.WEIXINOPENID);
		if(StringUtils.isNotEmpty(wexinOpenId)){
			model.addAttribute("wexinOpenId",wexinOpenId);	
		}else{
			model.addAttribute("wexinOpenId", "");
		}
		return "xdjl_oauth";
	}

	@RequestMapping(value = "/sfzrz")
	public String sfzrz(HttpServletRequest req, Model model) {
		String auto_login_user=(String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
		if(StringUtils.isNotEmpty(auto_login_user)){
			model.addAttribute("auto_login_user",auto_login_user);	
		}else{
			model.addAttribute("auto_login_user", "");
		}
		return "sfzrz";
	}
	
	@RequestMapping(value = "/scsfzzJsp")
	public String scsfzzJsp(HttpServletRequest req, Model model) {
		String auto_login_user=(String) req.getSession().getAttribute(Global.USER_SESSION_KEY);
		if(StringUtils.isNotEmpty(auto_login_user)){
			model.addAttribute("auto_login_user",auto_login_user);	
		}else{
			model.addAttribute("auto_login_user", "");
		}
		return "scsfzz";
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
	 * 根据内容类型判断文件扩展名
	 *
	 * @param contentType
	 *  内容类型
	 * @return
	 */
	public String getFileexpandedName(String contentType) {
		String fileEndWitsh = "";
		if ("image/jpeg".equals(contentType))
			fileEndWitsh = ".jpg";
		else if ("audio/mpeg".equals(contentType))
			fileEndWitsh = ".mp3";
		else if ("audio/amr".equals(contentType))
			fileEndWitsh = ".amr";
		else if ("video/mp4".equals(contentType))
			fileEndWitsh = ".mp4";
		else if ("video/mpeg4".equals(contentType))
			fileEndWitsh = ".mp4";
		return fileEndWitsh;
	}

	/*
	 * 获取媒体文件
	 * 文件在本地服务器上的存储路径
	 */
	@RequestMapping(value = "/downloadMedia")
	public void downloadMedia(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String mediaId = (String) req.getParameter("picid");

		String path = req.getServletContext().getContextPath();
		String savePath = req.getServletContext().getRealPath("/WEB-INF/rwjr/temp_img");
		Outer outer = new Outer();
		String accessToken = outer.getOuter().getAccessToken();
		String filePath = null;
		// 拼接请求地址
		String requestUrl = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("MEDIA_ID", mediaId);
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setRequestMethod("GET");
			if (!savePath.endsWith("/")) {
				savePath += "/";
			}
			// 根据内容类型获取扩展名
			String fileExt = DloadImgUtil.getFileexpandedName(conn.getHeaderField("Content-Type"));
			// 将mediaId作为文件名
			filePath = savePath + mediaId + fileExt;
			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1)
				fos.write(buf, 0, size);
			fos.close();
			bis.close();
			conn.disconnect();

		} catch (Exception e) {
			filePath = null;
			String error = String.format("下载媒体文件失败：%s", e);
			System.out.println(error);
		}
		response.getWriter().write("10700");
	}

	// 将图片路径放入数据库
	@RequestMapping(value = "/savePicsAndIpone")
	public void savePicsAndIpone(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String pics = (String) req.getParameter("serverIds");
		String sjh = (String) req.getParameter("_sjh");
		if (!pics.isEmpty()) {
			// 分割字符串
			String[] picArr = pics.split(",");
			HttpSession session = req.getSession();
			List sjhList = this.mapService.getListBySql("select * from sjh_sfzpic  where  sjh = '" + sjh + "'");
			if (sjhList.size() <= 0) {
				this.mapService.execute("insert into sjh_sfzpic (sjh,_beforpic,_mepic,_afterpic) values('" + sjh + "','"
						+ picArr[0] + "','" + picArr[1] + "','" + picArr[2] + "');");
			} else {
				this.mapService.execute(
						"UPDATE sjh_sfzpic SET sjh='" + sjh + "', _beforpic='" + picArr[0] + "', _mepic='" + picArr[1]
								+ "', _afterpic='" + picArr[2] + "', _ispass='" + 0 + "' where sjh = '" + sjh + "'");
			}
			response.getWriter().write("10071");
		}
	}

	@RequestMapping(value = "/getstatusOfsq")
	public void getstatusOfsq(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String sjh = (String) req.getParameter("_sfrzsjh");
		String sql = "select t._ispass from sjh_sfzpic t where t.sjh=" + sjh;
		List list = mapService.getListBySql(sql);
		if (list.size() <= 0) {
			// 不存在记录 需要申请
			response.getWriter().write("10703");
		} else {
			Map map = (Map) list.get(0);
			Integer _ispass = (Integer) map.get("_ispass");
			if (String.valueOf(_ispass).endsWith("0")) {
				// 等于0 审核中 等于2 通过  1退回 otherInfo
				response.getWriter().write("10700");
			} else if (String.valueOf(_ispass).endsWith("2")) {
				response.getWriter().write("10701");
			} else if (String.valueOf(_ispass).endsWith("1")) {
				map.put("code", "10702");
				JSONArray jsonArray = JSONArray.fromObject(map);
				response.getWriter().write(jsonArray.toString());
			}
		}
	}

	@RequestMapping(value = "/saveInfoForuser")
	public void saveInfoForuser(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String _xm = (String) req.getParameter("_xm");
		String _sfz = (String) req.getParameter("_sfz");
		String _sjh = (String) req.getParameter("_sjh");

		List sjhList = this.mapService.getListBySql("select * from user  where  sjh = '" + _sjh + "'");
		List yueList = this.mapService.getListBySql("select * from yue  where  sjh = '" + _sjh + "'");
		List jifenList = this.mapService.getListBySql("select * from jifen  where  sjh = '" + _sjh + "'");
		List jifenyue = this.mapService.getListBySql("select * from jifenyue  where  sjh = '" + _sjh + "'");

		List sz = this.mapService.getListBySql("select jifenofZc from sz " );

		Map szMap=(Map)sz.get(0);
		String jifenofZc =String.valueOf(szMap.get("jifenofZc"));

		if (sjhList.size() > 0) {
			this.mapService
					.execute("UPDATE user SET  sfz='" + _sfz + "', realname='" + _xm + "' where sjh = '" + _sjh + "'");
		}else{
			this.mapService
					.execute("insert into user (sfz,realname,sjh) values('" + _sfz + "','" + _xm + "','" + _sjh + "')");

			if (yueList.size() <= 0) {
				this.mapService.execute("insert into yue (sjh,yue)values('" + _sjh + "','" + 0 + "');");
			}

			//积分记录
			if (jifenList.size() <= 0) {
				this.mapService.execute("insert into jifen (sjh,fene,laiyuan,timeStamp)values('" + _sjh + "','"
						+ jifenofZc + "','" + Constant.JIFENS[1] + "','" + new Date().getTime() + "');");
			}

			if(jifenyue.size()<=0){
				this.mapService.execute("insert into jifenyue (sjh,jifenyue)values('" + _sjh + "','"
						+ jifenofZc + "');");
			}else{
				this.mapService.execute("UPDATE jifenyue SET jifenyue='" +  jifenofZc + "' where sjh = '" + _sjh + "'");
			}
		}

		response.getWriter().write("10071");
	}

/*	@RequestMapping(value = "/getuserInfo")
	public String getuserInfo(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {
		String echostr = req.getParameter("echostr");
		Oauth2Action oa = new Oauth2Action();
		HashMap map = Oauth2Action.auth(req, response, echostr);
		if (map.size() > 0) {
			// 存在数据库
			String swl = "select * from weixin_info t where t.openid=" + map.get("openid");
			List sqllist = mapService.getListBySql(swl);
			if (sqllist.size() > 0) {
			} else {
				this.mapService
						.execute("insert into weixin_info (openid,nickname,sex,province,city,country,imgsrc)values('"
								+ map.get("openid") + "','" + map.get("nickname") + "','" + "','" + map.get("sex")
								+ "','" + map.get("province") + "','" + map.get("city") + "','" + map.get("country")
								+ "','" + map.get("imgsrc") + "');");
			}
			response.getWriter().write("10002");
		} else {
			return "login";
		}
		return echostr;
	}*/
}
