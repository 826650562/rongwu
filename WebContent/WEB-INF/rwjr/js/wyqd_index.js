//我要抢单 
$(function() {
	var attrs = {
		fangchan : 0,
		che : 0,
		shebao : 0,
		gjj : 0,
		sbz : 0
	};
	var attrs2 = {
		fangchan : 0,
		che : 0,
		shebao : 0,
		gjj : 0,
		sbz : 0
	};
	var myurl = "../wyqd/wyqdjsp";
	function getBlanck(back) {
		var html = "<div class='mui-content'>" +
			"<div class='z-row'>" +
			"<div class='z-col blkhtmlblk'></div></div>" +
			"<div class='z-row'>" +
			"<div class='z-col'></div>" +
			"<div class='blankimgbox'><img src='../rwjr/images/blank.png'></div>" +
			"<div class='z-col'></div></div>" +
			"<div class='z-row'>" +
			"<div class='z-col nofound'>什么也没有发现！</div></div>" +
			"<div class='z-row'>" +
			"<div class='z-col'></div>";
		if (back) {
			html += "<div> <button class='layui-btn'>返&nbsp;回</button></div>";
		}
		html += "<div class='z-col'></div></div></div>";
		return html;
	}

	function danziList(res) {
		var miaoshu = "";
		if (res.name) {
			miaoshu += "信贷申请人：" + res.name
		}
		if (res.sex) {
			miaoshu += "," + res.sex;
		}
		if (res.gz) {
			miaoshu += "," + res.gz;
		}
		if (res.xueli) {
			miaoshu += "," + res.xueli;
		}
		if (res.gz) {
			miaoshu += ",月收入" + res.gz;
		}
		if (res.shebao != '无社保') {
			miaoshu += ",有社保";
		}
		if (res.gjj != '无公积金') {
			miaoshu += ",有公积金";
		}
		if (res.fangchan != '无房产') {
			miaoshu += ",有房产";
		}
		if (res.zhima) {
			miaoshu += ",芝麻信用积分：" + res.zhima;
		}
		if (res.jine) {
			miaoshu += ",意向贷款金额：" + res.jine + "万元";
		}
		if (res.daikuanqixian) {
			miaoshu += ",意向贷款期限：" + res.daikuanqixian + "月";
		}

		return "<div class='z-row qdliitem'> <div class='z-col'> <a href='javascript:;'>" +
			"<div class='z-row wyqdtopbox'> <div class='wyqdname'><strong>" + res.name + "</strong></div>" +
			"<div class='z-col wyqdcash colorRed'> <span value=" + res.jine + ">" + res.jine + "</span>元</div>" +
			" <div class='wyqdwxxtb'><i class='fa fa-street-view fa-fw'></i></div>" +
			" <div class=' wyqdaddr'>" + res.adress + "</div> </div>" +
			"<div class='z-row'> <div class='z-col wyqditemcont'>" + miaoshu + "</div>" +
			" </div> <div class='z-row'>" +
			"<div class='z-col wyqdtime'>申请时间：<span value=" + res.date + ">" + format(parseInt(res.date)) + "</span></div> </div>" +
			" <div class='z-row wyqditemcz'>" +
			" <div val_id=" + res.id + " class='xiangqing_ofDz z-col wyqdckxq'><a href='javascript:;'>查看详情</a></div>" +
			" <div class='z-col qdbutton' val_id=" + res.id + ">" +
			" <span class='qdxtb'><img src='../rwjr/images/qiang.png'></span>" +
			" <a href='#' class='colorRed _qdjg'  ><span value=" + 20 + ">20</span>元抢单</a>  </div> </div> </a> </div> </div>";
	}

	function main() {
		init();
		addEventLisiter();
	}
	function addEventLisiter() {
		var zcsx = $(".qdsx").find(".zcsx");
		zcsx.click(function() {
			$(this).toggleClass("zcsxactive");
			var value = $(this).attr("value")
			var text = $(this).text()
			if ($(this).hasClass("zcsxactive")) {
				attrs[value] = text;
			} else {
				attrs[value] = 0;
			}
			sendAjax(attrs, appendHtml, 0);
		});

		$("._dkfbsj").find(".fa-caret-up").click(function() {
			sortByName(".wyqdtime", function(a, b) {
				return a.date - b.date;
			}, this);
		});
		$("._dkfbsj").find(".fa-caret-down").click(function() {
			sortByName(".wyqdtime", function(a, b) {
				return b.date - a.date;
			}, this);
		});

		$("._dkjine").find(".fa-caret-up").click(function() {
			sortByName(".wyqdcash", function(a, b) {
				return a.date - b.date;
			}, this);
		});
		$("._dkjine").find(".fa-caret-down").click(function() {
			sortByName(".wyqdcash", function(a, b) {
				return b.date - a.date;
			}, this);
		});

		$("._dkjiage").find(".fa-caret-up").click(function() {
			sortByName("._qdjg", function(a, b) {
				return b.date - a.date;
			}, this);
		});
		$("._dkjiage").find(".fa-caret-down").click(function() {
			sortByName("._qdjg", function(a, b) {
				return b.date - a.date;
			}, this);
		});

		$(".shezhibtn").click(function() {
			//充值
			checkUser(function() {
				window.location.href = "_cz";
			}, myurl)
		});
		$(".chongzhibtn").click(function() {
			//设置
			checkUser(function() {
				window.location.href = "_sz";
			}, myurl)
		});

		$("#_wdye").click(function() {
			//余额
			checkUser(function() {
				window.location.href = "myye";
			}, myurl)
		});

		$("#_wdjf").click(function() {
			// 积分
			checkUser(function() {
				window.location.href = "wodejifen";
			}, myurl)
		});
		$("#_czjl").click(function() {
			// 充值记录
			checkUser(function() {
				window.location.href = "chongzhiJL";
			}, myurl)
		});


		//我的微店
		$("#ktwdwd").click(function() {
			$(".wdydycont").fadeOut(300);
			$(".wdsybox").fadeIn(200);
		})

		//个人产品
		$("#grcp_wd").click(function() {
			window.location.href = "grcp_wd";
		});
		//分享微店
		$("#fxwd_wd").click(function() {
			window.location.href = "fxwd_wd";
		});

		//微店排行
		$("#wdph_wd").click(function() {
			window.location.href = "wdph_wd";
		});

		//民间风控
		$("#mjfk_wd").click(function() {
			window.location.href = "mjfk_wd";
		});
	}

	function sortByName(name, fc, self) {
		var _index = $(self).index();
		var qdliitem = $(".ptkh").eq(_index).find(".qdliitem");
		//排序
		var dates = [];
		qdliitem.each(function(item) {
			var date = qdliitem.eq(item).find(name).children("span").attr("value");
			var _id = qdliitem.eq(item).find(".xiangqing_ofDz").attr("val_id");
			dates.push({
				_id : _id,
				date : parseInt(date)
			});
		});
		dates.sort(fc);
		$(".ptkh").html("");
		dates.map(function(elt) {
			qdliitem.each(function(item) {
				var realtime = qdliitem.eq(item).find(name).children("span").attr("value");
				var _id = qdliitem.eq(item).find(".xiangqing_ofDz").attr("val_id");
				if (elt.date == realtime && elt._id == _id) {
					$(".ptkh").append(qdliitem.eq(item));
				}
			});
		});

	}
	function sendAjax(attrs, fn, index) {
		//请求数据
		$.ajax({
			url : "Grabsingle", //判断申请状态
			type : "post",
			contentType : "application/x-www-form-urlencoded",
			data : attrs,
			success : function(code) {
				$(".ptkh").eq(index).html("");
				if (code == '10010') {
					$(".ptkh").append(getBlanck(false));
				} else {
					fn(JSON.parse(code));
				}
			},
			error : function(error) {
				_msg("系统错误！稍后重试");
			}
		});
	}
	function appendHtml(res) {
		res.forEach(function(item, index) {
			$(".ptkh").eq(0).append(danziList(item));
		});
		$(".xiangqing_ofDz").click(function() {
			var id = $(this).attr("val_id");
			res.forEach(function(item) {
				if (id == item.id) {
					//user_dkxq 临时选中的贷款客户信息
					setCookie("user_dkxq", JSON.stringify(item));
					checkUser(function() {
						window.location.href = "dkrxx";
					}, myurl)
				}
			});
		});
		//XX元抢单
		$(".qdbutton").click(function(e) {
			var id = $(this).attr("val_id");
			checkUser(function() {
				dealWithQd(id);
			}, myurl)
		});
	}
	//第二页
	function appendHtml2(res) {
		res.forEach(function(item, index) {
			$(".ptkh").eq(1).append(danziList(item));
		});
		$(".xiangqing_ofDz").click(function() {
			var id = $(this).attr("val_id");
			res.forEach(function(item) {
				if (id == item.id) {
					setCookie("user_dkxq", JSON.stringify(item));
					checkUser(function() {
						window.location.href = "dkrxx";
					}, myurl)
				}
			});
		});
		//XX元抢单
		$(".qdbutton").click(function(e) {
			var id = $(this).attr("val_id");
			checkUser(function() {
				dealWithQd(id);
			}, myurl)
		});
	}

	function getinforAjax() {
		//请求数据
		if (!wxInfoId) {
			_msg("需要您授权微信基本信息！");
			window.location.href="index";
		}
		$.ajax({
			url : "getInfouserOfweixin",
			type : "post",
			contentType : "application/x-www-form-urlencoded",
			data : {
				wxInfoId : wxInfoId
			},
			success : function(code) {
				var res = JSON.parse(code);
				var weixin_info = res[0][0];
				var user_info = res[3][0];
				var sfrz_info = res[2][0];
				var gzrz_info = res[1][0];
				var wd_info = res[4][0];

				setCookie("TEMP_USER_INFO", code);

				if (sfrz_info) {
					if (sfrz_info._ispass == 0) {
						setRz("身份审核中", "shz.png");
					} else if (sfrz_info._ispass == 2) {
						setRz("身份审核不通过", "no_rz.png");
					} else if (sfrz_info._ispass == 1) {
						if (gzrz_info) {
							if (gzrz_info.ispass == 0) {
								setRz("工作认证审核中", "shz.png");
							} else if (gzrz_info.ispass == 2) {
								setRz("工作认证不通过", "no_rz.png");
							} else {
								setRz("已认证", "yes_rz.png");
							}

						} else {
							setRz("工作认证", "no_rz.png");
						}
					}
				} else {
					setRz("身份认证", "no_rz.png");
				}

				function setRz(text, pic) {
					$("#shenqing-status").text(text);
					var imgsrc = $("#shengqing_pic").attr('img_url');
					$("#shengqing_pic").attr('src', imgsrc + pic);
				}
				var img = user_info.headimg || weixin_info.imgsrc;
				if (img) {
					$(".mycenhead").find("img").attr("src", img);
				}
				if (user_info.realname) {
					$("#_name_xd").text(user_info.realname);
				} else if (weixin_info.nickname) {
					$("#_name_xd").text(weixin_info.nickname);
				}

				$("#shenqing-status").parents("li").click(function() {
					window.location.href = "../rwjr/sqrz";
				});


				if (!wd_info) {
					//不存在
					initYdy(user_info, img);
				} else {
					$(".wdydycont").fadeOut(0);
					$(".wdsybox").fadeIn(0);
					fullwdInfo(user_info, img, wd_info);
				}


			},
			error : function(error) {
				_msg("系统错误！");
			}
		});
	}
	//初始化引导页
	function initYdy(user_info, img) {
		//引导页
		$("#ktwdwd").click(function() {
			var rqwxfje = $.trim($("#rqwxfje").val());
			var rqwddbs = $.trim($("#rqwddbs").val());
			var wd_area = $.trim($("#wd_area").val());
			var data = {
				rqxfje : rqwxfje,
				rqdds : rqwddbs,
				sm : wd_area,
				sjh : user_info.sjh
			}

			if (rqwxfje.length <= 0 || rqwddbs.length <= 0 || wd_area.length <= 0) {
				_msg("请将信息填写完整！");
			} else {
				if (wd_area.length >= 150) {
					_msg("微店说明太长！");
				} else
					$.ajax({
						url : "ydy_wd",
						type : "post",
						contentType : "application/x-www-form-urlencoded",
						data : data,
						success : function(code) {
							if (code == 'wdInfo_100') {
								$(".wdydycont").fadeOut(300);
								$(".wdsybox").fadeIn(200);
								fullwdInfo(user_info, img, data)
							}
						},
						error : function(error) {
							_msg("系统错误！稍后重试");
						}
					});
			}
		});
	}

	function fullwdInfo(user_info, img, wd_info) {
		//添加微店信息
		if (img) {
			$(".wdsyhead").find("img").attr("src", img);
		}
		
	
		if (user_info.realname) {
			$(".wdsyheadName").text(user_info.realname);
		} else if (weixin_info.nickname) {
			$(".wdsyheadName").text(weixin_info.nickname);
		}

		
		var city_index =user_info.city.indexOf("市");
		var city=user_info.city.substr(0,city_index+1);
		if(city.length>=2){
			$(".wdsyheadAddr").text(city);
		}
		
		$(".wdsyheadms").text(wd_info.sm);
		$("#rqwxfjenumber").text(wd_info.rqxfje);
		$("#rqwxfbsnumber").text(wd_info.rqdds);
	}

	function init() {
		//填充列表
		sendAjax(attrs, appendHtml, 0);
		sendAjax(attrs2, appendHtml2, 1);
		//获取信贷经理信息
		//检查登录状态
		$.ajax({
			url : "../loginManager/checkLogin", //判断登录状态
			type : "post",
			contentType : "application/x-www-form-urlencoded",
			success : function(code) {
				if (code != "login_100") {
					xunwenkuang("您尚未登录，请登录，后续内容更丰富^_^", [ '去登陆' ], function() {
						window.location.href = "../rwjr/login#" + myurl
					});
				} else {
					getinforAjax();
				}
			},
			error : function(error) {
				_msg("系统繁忙！稍后重试");
			}
		});
	}


	function dealWithQd(id) {
		//处理抢单
		var _sjh = getCookie("_user");
		arrdata = [ { } ];
		var html = $("#tmp2").render(arrdata);
		layer.open({
			anim : 'up',
			content : html
		});
		$(".layui-m-layercont").css("padding", "0px");
	}
	main();
})