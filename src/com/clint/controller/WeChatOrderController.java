package com.clint.controller;

import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.model.AuthToken;
import com.clint.model.Global;
import com.clint.service.MapService;
import com.clint.service.PayService;
import com.clint.untils.PayUtils;
import java.util.List;
import java.util.Map;
@Controller
@RequestMapping(value = "/weChat")
public class WeChatOrderController {

	@Autowired
	private PayService payService;

	@Resource(name = "mapService")
	private MapService mapService;

	/**
	 * 统一下单
	 */
	@RequestMapping(value = "/unifiedOrder")
	public String unifiedOrder(HttpServletRequest request, Model model) {
		// 用户同意授权，获得的code
		String code = request.getParameter("code");

		// 金额
		String jineAndtype = request.getParameter("jine");
		System.out.println(jineAndtype);
		String[] jt = jineAndtype.split("_");
		// 通过code获取网页授权access_token
		AuthToken authToken = PayUtils.getTokenByAuthCode(code);
		// 调用统一下单service
		String prepayId = payService.unifiedOrder(authToken, request.getRemoteAddr(), jt[0], jt[1]);
		if (!PayUtils.isEmpty(prepayId)) {
			String timeStamp = PayUtils.getTimeStamp();// 当前时间戳
			String nonceStr = PayUtils.getRandomStr(20);// 不长于32位的随机字符串

			SortedMap<String, Object> signMap = new TreeMap<String, Object>();// 自然升序map
			signMap.put("appId", Constant.APP_ID);
			signMap.put("package", prepayId);
			signMap.put("timeStamp", timeStamp);
			signMap.put("nonceStr", nonceStr);
			signMap.put("signType", "MD5");

			model.addAttribute("appId", Constant.APP_ID);
			model.addAttribute("timeStamp", timeStamp);
			model.addAttribute("nonceStr", nonceStr);
			model.addAttribute("prepayId", prepayId);
			model.addAttribute("paySign", PayUtils.getSign(signMap));// 获取签名
			model.addAttribute("jine", jt[0]);
		} else {
			System.out.println("微信统一下单失败,订单编号:失败原因");
			return "redirect:/";// 支付下单失败，重定向至订单列表
		}
		// 将支付需要参数返回至页面，采用h5方式调用支付接口
		return "h5Pay";
	}

	/**
	 * 申请退款
	 */
	@RequestMapping(value = "/refund")
	public String refund(HttpServletRequest request, Model model) {
		// 调用统一下单service
		payService.refund();
		return "h5Pay";
	}

	/**
	 * 支付记录
	 */
	@RequestMapping(value = "/insetJl")
	public void insetJl(HttpServletRequest request, HttpServletResponse response) {
		String appId = request.getParameter("appId");
		String timeStamp = request.getParameter("timeStamp");
		String nonceStr = request.getParameter("nonceStr");
		String packagea = request.getParameter("package");
		String signType = request.getParameter("signType");
		String paySign = request.getParameter("paySign");
		String jine = request.getParameter("jine");

		HttpSession session = request.getSession();
		String userInfo = (String) session.getAttribute(Global.USER_SESSION_KEY);
		if (!StringUtils.isBlank(userInfo)) {
			String[] userInfos = userInfo.split("_");
			String sql = "inset into cz_jl  (appId,timeStamp,nonceStr,prepayId,signType,paySign,sjh,jine) "
					+ "values ('" + appId + "','" + timeStamp + "','" + nonceStr + "','" + packagea + "','" + signType
					+ "','" + paySign + "','" + userInfos[1] + "','" + jine + "')";
			
			try {
				mapService.execute(sql);
				//改变总金额
				List mylist=mapService.getListBySql("select yue from yue where sjh="+userInfos[1]);
				if(mylist.size()>0){
				  	 Map mymap=(Map) mylist.get(0);
				  	 int yue=(int) mymap.get("yue");
				  	 int newjine=Integer.valueOf(jine)+yue;
				  	mapService.execute("UPDATE user SET  yue='" + newjine + "'  where sjh = '" + userInfos[1] + "'"); 	 
				} 
				response.getWriter().write("10002");
			} catch (Exception e) {
				// TODO: handle exception
				// 错误
			}
		}
	}

}