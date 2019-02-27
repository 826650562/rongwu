package com.clint.service;

import com.clint.untils.Template;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public interface MapService {

	/**
	 * 查询SQL语句，结果直接返�? jdbctemplate
	 */
	public List<?> getListBySql(String sql);

	public void execute(String sql);

	public int countAll(String sql);

	public int getint(String sql);
	
	String[] getUser_sjh_openid(String s);


	/**
	 * @param edu
	 *            插入一条积分记录
	 */
	public void insertJifen(int edu,String type,String sjh,String laiyuan);



	/**
	 * @param edu
	 *            获取积分总额度
	 * @param tage
	 *
	 */
	public int getJiFenSum(String sjh);



	/**
	 * @param edu
	 *            获取积分列表  最近一周
	 * @param tage
	 *
	 */
	public List getJiFenList(String sjh);


	/**
	 * @param edu
	 *            插入一条金额记录
	 */
	public void insertJIne(int edu, String type, String sjh,String laiyuan);



	/**
	 * @param edu
	 *            获取金额总额度
	 * @param tage
	 *
	 */
	public int getJIneSum(String sjh);


	/**
	 * @param edu
	 *            获取充值金额列表  最近一周
	 * @param tage
	 *
	 */

	public List getJIneList(String sjh);

	public List getyueJfenAndcz(String string);

	public  boolean sendTemplateMsg(String token,Template template);

	public boolean  sendJifen(String TemplateId, String ToUser, List<List> values);

	JdbcTemplate getJdbcTemplate();
}
