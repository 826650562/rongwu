package com.clint.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.service.MapService;

@Controller
@RequestMapping(value = "/sqdk")
public class sqdk {
	@Resource(name = "mapService")
	private MapService mapService;

	@RequestMapping(value = "/index")
	public String sqdk() {
		return "/sqdk";
	}

	@RequestMapping(value = "/tk")
	public String tytk() {
		return "/tk";
	}

	@RequestMapping(value = "/sqdk2")
	public String sqdk2() {
		return "/sqdk2";
	}
	// 第一步查詢是不是有資料 如果沒有直接登錄下一頁填寫資料
	//如果查詢有資料，假如不完整 詢問是否完善資料，還是直接貸款

	@RequestMapping(value = "/sigin")
	public String sigin(HttpServletRequest req, HttpServletResponse response) {
		String cityResult3 = (String) req.getParameter("cityResult3");
		String _sq_dkjine = (String) req.getParameter("_sq_dkjine");
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

		String sql = "select * from shenqing_user where sjh=" + _w_sjh;

		List list = mapService.getListBySql(sql);
		if (list.size() > 0) {
			StringBuffer sql2 = new StringBuffer("UPDATE shenqing_user SET ");
			if (cityResult3 != null && !cityResult3.isEmpty()) {
				sql2.append(" address=" + cityResult3);
			}
			if (_sq_dkjine != null && !_sq_dkjine.isEmpty()) {
				sql2.append(", address=" + cityResult3);
			}

		}
		return "/sigin";
	}

}
