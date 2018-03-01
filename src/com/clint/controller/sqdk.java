package com.clint.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.service.MapService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value = "/sqdk")
public class sqdk {
	@Resource(name = "mapService")
	private MapService mapService;

	// 步骤1
	@RequestMapping(value = "/index")
	public String sqdk() {
		return "/sqdk";
	}

	//条款
	@RequestMapping(value = "/tk")
	public String tytk() {
		return "/tk";
	}

	// 步骤2
	@RequestMapping(value = "/sqdk2")
	public String sqdk2() {
		return "/sqdk2";
	}

	// 步骤3
	@RequestMapping(value = "/sqdk3")
	public String sqdk3() {
		return "/sqdk3";
	}

	@RequestMapping(value = "/sqdk_list")
	public String sqdk_list() {
		return "/sqdk_list";
	}

	// 第一步查詢是不是有資料 如果沒有直接登錄下一頁填寫資料
	// 如果查詢有資料，假如不完整 詢問是否完善資料，還是直接貸款
	@RequestMapping(value = "/IsYjSq")
	public void IsYjSq(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String sjh = (String) req.getParameter("sjh");
		String name = (String) req.getParameter("name");
		String sql = "select * from shenqing_user t1  where t1.sjh=" + sjh + " and t1.name='" + name + "'";
		List list = mapService.getListBySql(sql);
		if (list.size() > 0) {
			Map res = (Map) list.get(0);
			String sfzh = (String) res.get("sfzh");
			if (!(sfzh == null)) {
				// 有资料
				response.getWriter().write("sdqk10010");
			} else {
				// 无资料
				response.getWriter().write("sdqk10011");
			}
		} else {
			StringBuffer sql2 = new StringBuffer("insert into shenqing_user (name,sjh,date)values('" + name + "','"
					+ sjh + "','" + new Date().getTime() + "')");
			mapService.execute(sql2.toString());
			response.getWriter().write("sdqk10011");
		}

	}

	@RequestMapping(value = "/dk_submit")
	public void dk_submit(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String jine = (String) req.getParameter("jine");
		String qixian = (String) req.getParameter("qixian");
		String _w_sjh = (String) req.getParameter("_w_sjh");
		String name = (String) req.getParameter("name");
		try {
			mapService.execute("insert into yh_dk (name,jine,sjh,date,qixian)values('" + name + "','" + jine + "','"
					+ _w_sjh + "','" + new Date().getTime() + "','" + qixian + "')");
			response.getWriter().write("sdqk30010");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("sdqk30011");
		}

	}

	@RequestMapping(value = "/getsqdk_list")
	public void getsqdk_list(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String _w_sjh = (String) req.getParameter("_w_sjh");
		String name = (String) req.getParameter("name");
		List list = mapService
				.getListBySql("select * from yh_dk t where t.delete = '0' and  name=" + "'" + name + "' and sjh=" + "'" + _w_sjh + "'");
		JSONArray jsonArray = JSONArray.fromObject(list);
		response.getWriter().write(jsonArray.toString());
	}

	@RequestMapping(value = "/sigin")
	public void sigin(HttpServletRequest req, HttpServletResponse response) throws IOException {
		// 信息只注册一次
		String cityResult3 = (String) req.getParameter("cityResult3");
		String userResult = (String) req.getParameter("userResult");
		String haveHouseResult = (String) req.getParameter("haveHouseResult");
		String haveCarResult = (String) req.getParameter("haveCarResult");
		String haveSbResult = (String) req.getParameter("haveSbResult");
		String haveGjjResult = (String) req.getParameter("haveGjjResult");
		String haveXyqkResult = (String) req.getParameter("haveXyqkResult");
		String sq_zm = (String) req.getParameter("sq_zm");
		String sq_wld = (String) req.getParameter("sq_wld");
		String haveYwrsbxResult = (String) req.getParameter("haveYwrsbxResult");
		String haveZgxlResult = (String) req.getParameter("haveZgxlResult");
		String _sq_sfz = (String) req.getParameter("_sq_sfz");
		String _w_sjh = (String) req.getParameter("_w_sjh");
		String _name_sq = (String) req.getParameter("_name_sq");

		StringBuffer sql2 = new StringBuffer("insert into shenqing_user ("
				+ "name,sjh,date,adress,gz,gjj,shebao,xueli,fangchan,che,sfzh,rsbx,wldje,zhima,xyzk" + ")values('" + _name_sq
				+ "','" + _w_sjh + "','" + new Date().getTime() + "','" + cityResult3 + "','" + userResult + "','"
				+ haveGjjResult + "','" + haveSbResult + "','" + haveZgxlResult + "','" + haveHouseResult + "','"
				+ haveCarResult + "','" + _sq_sfz + "','" + haveYwrsbxResult + "','" + sq_wld + "','" + sq_zm +"','" + haveXyqkResult + "')");
		try {
			mapService.execute(" DELETE FROM shenqing_user WHERE sjh='" + _w_sjh + "' and name='" + _name_sq + "'");
			mapService.execute(sql2.toString());
			response.getWriter().write("sdqk10010");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("sdqk10011");
		}

	}

	@RequestMapping(value = "/delete_dk")
	public void delete_dk(HttpServletRequest req, HttpServletResponse response) throws IOException {
		String id = (String) req.getParameter("id");
		try {
			mapService.execute("UPDATE yh_dk t SET  t.delete = '1' WHERE t.id = "+id);
			response.getWriter().write("sdqk40010"); 
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("sdqk40011");
		}

	}
}
