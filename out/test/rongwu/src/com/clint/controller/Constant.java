package com.clint.controller;

public class Constant {
	/**
	 * 公众号AppId
	 */
	public static final String APP_ID = "wxc3691f09dbfd769d";

	/**
	 * 公众号AppSecret
	 */
	public static final String APP_SECRET = "c1d465d27a459096f805d7e7f4c7f827";

	/**
	 * 微信支付商户号
	 */
	public static final String MCH_ID = "1495216922";

	/**
	 * 微信支付API秘钥
	 */
	public static final String KEY = "rongwuxinxikejiyouxiangongsirong";

	/**
	 * 微信交易类型:公众号支付
	 */
	public static final String TRADE_TYPE_JSAPI = "JSAPI";

	/**
	 * WEB
	 */
	public static final String WEB = "WEB";

	/**
	 * 返回成功字符串
	 */
	public static final String RETURN_SUCCESS = "SUCCESS";

	/**
	 * 支付地址(包涵回调地址)
	 */
	public static final String PAY_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc3691f09dbfd769d&redirect_uri=MYURL/unifiedOrder?jine=JINE_MYTYPE&response_type=code&scope=snsapi_base#wechat_redirect";

	/**
	 * 微信统一下单url
	 */
	public static final String UNIFIED_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";

	/**
	 * 微信申请退款url
	 */
	public static final String REFUND_URL = "https://api.mch.weixin.qq.com/secapi/pay/refund";

	/**
	 * 微信支付通知url
	 */
	public static final String NOTIFY_URL = "http://wxpay.pes-soft.com/wxpay/";

	/**
	 * 证书位置
	 */
	public static final String CERT_PATH = "C:/apiclient_cert.p12";

	/**
	 * 通过code获取授权access_token的URL
	 */
	public static String Authtoken_URL(String code) {
		StringBuffer url = new StringBuffer();
		url.append("https://api.weixin.qq.com/sns/oauth2/access_token?appid=");
		url.append(Constant.APP_ID);
		url.append("&secret=");
		url.append(Constant.APP_SECRET);
		url.append("&code=");
		url.append(code);
		url.append("&grant_type=authorization_code");
		return url.toString();
	}
	
	/**
	 *  积分来源途径
	 */
	public static final String[] JIFENS ={"充值赠送","注册赠送","分享赠送"};
	

	/**
	 *  积分赠送额度 
	 */
	public static final double[] FENE ={  0.1, 18, 5};
	
	
}
