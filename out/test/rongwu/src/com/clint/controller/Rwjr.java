package com.clint.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.clint.model.Global;
import com.clint.service.MapService;
import com.clint.service.PersonService;
import com.clint.untils.Sjm;
import com.clint.untils.SmsDemo;

@Controller
@RequestMapping(value = "/rwjr")
public class Rwjr {

	@Resource(name = "mapService")
	private MapService mapService;

	@RequestMapping(value = "/login")
	public String savePersonUI() {
		return "login";
	}

	// 商家认证
	@RequestMapping(value = "/sjrz")
	public String sjrz(HttpServletRequest req, HttpServletResponse response) throws IOException {
		return "sjrz";
	}


	@RequestMapping(value = "/sqrz")
	public String sqrz(HttpServletRequest req, HttpServletResponse response ,Model model) throws IOException {
		String auto_login_user=String.valueOf(req.getSession().getAttribute(Global.USER_SESSION_KEY));
		if("null".equals(auto_login_user)){
			return "login";
		}else{
			String[] users=this.mapService.getUser_sjh_openid(auto_login_user);
			List sjhList = this.mapService.getListBySql("select * from user where sjh = '" + users[1] + "'");
			if(sjhList.size()>0){
				HashMap  res=  (HashMap) sjhList.get(0);
				String ispass=String.valueOf(res.get("isPass"));
				String msg=String.valueOf(res.get("passInfo"));
				model.addAttribute("passInfo",msg);
				model.addAttribute("ispass",ispass);
			}
			return "sqrz";
		}
	}

	@RequestMapping(value = "/yzm")
	public void setYzm(HttpServletRequest req, HttpServletResponse response) throws IOException {
		Sjm sjm = new Sjm();
		sjm.setyzm(req, response);
	}

	@RequestMapping(value = "/getyzm")
	public void _getYzm(HttpServletRequest req, HttpServletResponse response) throws IOException {
		HttpSession session = req.getSession();
		String validateCode = (String) session.getAttribute("validateCode");
		if (validateCode != null && validateCode.endsWith("")) {
			response.getWriter().write(validateCode);
		} else {
			response.getWriter().write("wyzm1000000");
		}

	}

	@RequestMapping(value = "/getsjyzm")
	public void getsjyzm(HttpServletRequest req, HttpServletResponse response) throws IOException, ClientException {
		// 发短信
		String sjh = (String) req.getParameter("sjh");
		if (!sjh.isEmpty()) {
			SmsDemo sms = new SmsDemo();
			String s = "";
			while (s.length() < 6)
				s += (int) (Math.random() * 10);
			sms.setNumber(sjh, s);
			HttpSession session = req.getSession();
			session.setAttribute(sjh, s); // 手机号对应验证码
			SendSmsResponse res = sms.sendSms();
			if (res.getCode() != null && res.getCode().equals("OK")) {
				response.getWriter().write("10010");
			} else if (res.getCode() != null && res.getCode().equals("isv.BUSINESS_LIMIT_CONTROL")) {
				response.getWriter().write("10011");
			} else {
				response.getWriter().write("10011");
			}
		} else {
			response.getWriter().write("10001");
		}
	}

	// 检查手机验证码
	@RequestMapping(value = "/checksjyzm")
	public void checksjyzm(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String sjyzm = (String) req.getParameter("dxyzm");
		String sjh = (String) req.getParameter("_sjh");
		HttpSession session = req.getSession();
		String yzm = (String) session.getAttribute(sjh);// 获取手机验证码

		if (!!(yzm == null) || yzm.isEmpty()) {
			response.getWriter().write("10004");// 没有发送请求验证码
		} else if (yzm.equals(sjyzm)) {
			String jsp = (String) req.getParameter("jsp");
			if (jsp != null && jsp.endsWith("dksq")) {
				// 是贷款申请
				session.setAttribute(Global.USER_SESSION_DAIKUAN_KEY, "rwjr_" + sjh);
			} else {
				// 抢单 将手机号存入数据库
				List sjhList = this.mapService.getListBySql("select * from user where sjh = '" + sjh + "'");
				if (sjhList.size() <= 0) {
					this.mapService.execute(
							"insert into user (sjh,dlsj)values('" + sjh + "','" + new Date().getTime() + "');");
				} else {
					this.mapService.execute("UPDATE user SET sjh='" + sjh + "',dlsj= '" + new Date().getTime()
							+ "' where sjh = '" + sjh + "'");
				}
				// 将登录信息写入session
				String weixinOpenid = (String) session.getAttribute(Global.WEIXINOPENID);
				if (StringUtils.isNotEmpty(weixinOpenid)) {
					// 加入登录信息
					this.mapService
							.execute("UPDATE weixin_info SET sjh='" + sjh + "' where openid = '" + weixinOpenid + "'");
					session.setAttribute(Global.USER_SESSION_KEY, "rwjr_" + sjh + "_" + weixinOpenid);
				}

			}

			response.getWriter().write("10002");
		} else {
			response.getWriter().write("10003");// 验证码错误
		}

	}

}
