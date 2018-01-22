package com.clint.untils;
//获取用户基本信息

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class Oauth2Action {

	public static HashMap<String, String> auth(HttpServletRequest request, HttpServletResponse response, String echostr)
			throws ServletException, IOException {
		HashMap<String, String> map = new HashMap<String, String>();
		if (echostr == null) {
			String appId = "wxc3691f09dbfd769d";
			String appSecret = "c1d465d27a459096f805d7e7f4c7f827";
			// 拼接
			String get_access_token_url = "https://api.weixin.qq.com/sns/oauth2/access_token?" + "appid=" + appId
					+ "&secret=" + appSecret + "&code=CODE&grant_type=authorization_code";
			String get_userinfo = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String code = request.getParameter("code");
			System.out.println("******************code=" + code);
			get_access_token_url = get_access_token_url.replace("CODE", code);
			String json = HttpsGetUtil.doHttpsGetJson(get_access_token_url);
			JSONObject jsonObject = JSONObject.fromObject(json);
			String access_token = jsonObject.getString("access_token");
			String openid = jsonObject.getString("openid");
			get_userinfo = get_userinfo.replace("ACCESS_TOKEN", access_token);
			get_userinfo = get_userinfo.replace("OPENID", openid);
			String userInfoJson = HttpsGetUtil.doHttpsGetJson(get_userinfo);
			JSONObject userInfoJO = JSONObject.fromObject(userInfoJson);
			String user_openid = userInfoJO.getString("openid");
			String user_nickname = userInfoJO.getString("nickname");
			String user_sex = userInfoJO.getString("sex");
			String user_province = userInfoJO.getString("province");
			String user_city = userInfoJO.getString("city");
			String user_country = userInfoJO.getString("country");
			String user_headimgurl = userInfoJO.getString("headimgurl");

			map.put("openid", user_openid);
			map.put("nickname", user_nickname);
			map.put("sex", user_sex);
			map.put("province", user_province);
			map.put("city", user_city);
			map.put("country", user_country);
			map.put("imgsrc", user_headimgurl);

		} 
		return map;
	}
	/*
	 * //做服务器校验
	 * 
	 * @RequestMapping(value ="/tovalid") public void valid(String
	 * echostr,HttpServletResponse res) throws IOException{ PrintWriter out =
	 * res.getWriter(); out.print(echostr); }
	 */

}