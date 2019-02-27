package com.clint.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.*;

import javax.annotation.Resource;

import com.clint.untils.Outer;
import com.clint.untils.TemplateParam;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.clint.dao.MapDao;
import com.clint.service.MapService;
import net.sf.json.JSONObject;

import com.clint.untils.CommonUtil;

import com.clint.untils.*;


@Service("mapService")
public class MapServiceImpl implements MapService {
	@Resource
	private MapDao mapDao;

	@Override
	public void execute(String sql) {
		mapDao.getJdbcTemplate().execute(sql);
	}

	@Override
	public int getint(String sql) {
		return  mapDao.getJdbcTemplate().queryForInt(sql);

	}

	/**
	 * 查询SQL语句，结果直接返回 jdbctemplate
	 */
	@Override
	public List<?> getListBySql(String sql) {
		return mapDao.getJdbcTemplate().queryForList(sql);
	}

	@Override
	public int countAll(String sql) {
		return mapDao.getJdbcTemplate().queryForInt(sql);
	}

	@Override
	public String[] getUser_sjh_openid(String s) {
		// TODO Auto-generated method stub
		String[] users=s.split("_");
		return users;
	}



	@Override
	public void insertJifen(int edu,String type,String sjh,String laiyuan) {
		// TODO Auto-generated method stub  额度，类型，手机号
		//插入积分模块 包括 增加积分 和减少积分   更新积分总额
		String fenhao="";
		if(type.equals("add")){
			fenhao="+";

		}else if(type.equals("reduce")){
			fenhao="-";
		}
		mapDao.getJdbcTemplate().execute("insert into jifen (fene,laiyuan,timeStamp,sjh) values('"+edu+"','"+laiyuan+"','"+new Date().getTime()+"','"+sjh+"')");
		List sum=mapDao.getJdbcTemplate().queryForList("select SUM(jifenyue) as sum  from jifenyue WHERE sjh='"+sjh+"'");
		Map summ=(Map)sum.get(0);
		String _sum=String.valueOf(summ.get("sum"));
		 if(_sum.equals("null")){
			 mapDao.getJdbcTemplate().execute(" insert into jifenyue (jifenyue,sjh) values('"+edu+"','"+sjh+"')" );
		 }
		 else{
			 int e=mapDao.getJdbcTemplate().queryForInt("select SUM(CONVERT(jifenyue,SIGNED)"+fenhao+""+edu+")    from jifenyue WHERE sjh='"+sjh+"'");
			 mapDao.getJdbcTemplate().execute(" UPDATE jifenyue set  jifenyue= '"+e+"' WHERE  sjh='"+sjh+"'");
		 }
	}

	@Override
	public int getJiFenSum(String sjh) {
		// TODO Auto-generated method stubhttp://www.rongwu180.com/rongwu/sfzyz/index
		return  mapDao.getJdbcTemplate().queryForInt("select SUM(CONVERT(jifenyue,SIGNED))  from jifenyue WHERE sjh='"+sjh+"'");
	}

	@Override
	public List getJiFenList(String sjh) {
		// TODO Auto-generated method stub
		return mapDao.getJdbcTemplate().queryForList ("select  *   from jifen WHERE sjh='"+sjh+"'");
	}

	@Override
	public void insertJIne(int edu, String type, String sjh,String laiyuan) {
		// TODO Auto-generated method stub
        String fenhao="";
        if(type.equals("add")){
            fenhao="+";

        }else if(type.equals("reduce")){
            fenhao="-";
        }
        mapDao.getJdbcTemplate().execute("insert into jine (jine,laiyuan,timeStamp,sjh) values('"+edu+"','"+laiyuan+"','"+new Date().getTime()+"','"+sjh+"')");
        int e=mapDao.getJdbcTemplate().queryForInt("select SUM(CONVERT(yue,SIGNED)"+fenhao+""+edu+")    from yue WHERE sjh='"+sjh+"'");
        mapDao.getJdbcTemplate().execute(" UPDATE yue set  yue= '"+e+"'WHERE  sjh='"+sjh+"'");
	}

	@Override
	public int getJIneSum(String sjh) {
		// TODO Auto-generated method stub
		return  mapDao.getJdbcTemplate().queryForInt("select SUM(CONVERT(jifenyue,SIGNED))  from jifenyue WHERE sjh='"+sjh+"'");
	}

	@Override
	public List getJIneList(String sjh) {
		// TODO Auto-generated method stub
		return mapDao.getJdbcTemplate().queryForList ("select  *   from jifen WHERE sjh='"+sjh+"'");
	}

	@Override
	public List getyueJfenAndcz(String _sjh) {
		// TODO Auto-generated method stub
		List res=mapDao.getJdbcTemplate().queryForList("  select jifenyue ,yue from jifenyue  t  join yue  t2 on t.sjh=t2.sjh  where t2.sjh ='"+_sjh+"'");
		return res;
	}

	@Override
	public JdbcTemplate getJdbcTemplate() {
		// TODO Auto-generated method stub
		return  mapDao.getJdbcTemplate();
	}

	public  boolean sendTemplateMsg(String token,Template template){
		boolean flag=false;
		String requestUrl="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
		requestUrl=requestUrl.replace("ACCESS_TOKEN", token);
		JSONObject jsonResult=CommonUtil.httpsRequest(requestUrl, "POST", template.toJSON());
		if(jsonResult!=null){
			int errorCode=jsonResult.getInt("errcode");
			String errorMessage=jsonResult.getString("errmsg");
			if(errorCode==0){
				flag=true;
			}else{
				System.out.println("模板消息发送失败:"+errorCode+","+errorMessage);
				flag=false;
			}
		}
		return flag;



	}


   public boolean sendJifen(String TemplateId, String ToUser, List<List> values){
	   boolean result=false;
		Template tem=new Template();
		tem.setTemplateId(/*"sCC6Bz_TkGK_twK5SqnSJBYWNzO-yzyn9iSDJAOX4wc"*/ TemplateId);
		tem.setTopColor("#00DD00");
		tem.setToUser(/*"opT5v0iSEeH8QB5nzL7vDRtS3YeA"*/ ToUser );
		tem.setUrl("");
		List<TemplateParam> paras=new ArrayList();
      for (int i=0;i<values.size();i++){
		  String key=String.valueOf(values.get(i).get(0));
		  String value= String.valueOf(values.get(i).get(1));
		  String color= String.valueOf(values.get(i).get(2));
		  paras.add(new TemplateParam(key,value,color));
	  }
		tem.setTemplateParamList(paras);
		Outer outer = new Outer();
		String accessToken = outer.getOuter().getAccessToken();

		if(null !=accessToken){
		    result=sendTemplateMsg(accessToken,tem);
		}
		return result;
	}


}
