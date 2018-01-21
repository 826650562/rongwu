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
		if (res.gzffxs) {
			miaoshu += "," + res.gzffxs;
		}
		if (res.xueli) {
			miaoshu += "," + res.xueli;
		}
		if (res.gz) {
			miaoshu += ",月收入" + res.gz;
		}
		if (res.shebao == '1') {
			miaoshu += ",有社保";
		}
		if (res.gjj == '1') {
			miaoshu += ",有公积金";
		}
		if (res.fangchan == '1') {
			miaoshu += ",有房产";
		}
		if (res.zhima) {
			miaoshu += ",芝麻信用积分：" + res.zhima;
		}
		if (res.jine) {
			miaoshu += ",意向贷款金额：" + res.jine;
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
			"<div class='z-col wyqdtime'>申请时间：<span value=" + res.date + ">" + res.date + "</span></div> </div>" +
			" <div class='z-row wyqditemcz'>" +
			" <div val_id=" + res.id + " class='xiangqing_ofDz z-col wyqdckxq'><a href='javascript:;'>查看详情</a></div>" +
			" <div class='z-col qdbutton' val_id=" + res.id + ">" +
			" <span class='qdxtb'><img src='../rwjr/images/qiang.png'></span>" +
			" <a href='#' class='colorRed _qdjg'  ><span value=" + 20 + ">20</span>元抢单</a>  </div> </div> </a> </div> </div>";
	}

	$.ajax({
		url : "scPics",
		type : "post",
		contentType : "application/x-www-form-urlencoded",
		data : {
			url : "http://www.80wangjian.com/springmvc/wyqd/index"
		},
		success : function(data) {
			var res = JSON.parse(data)[0];
			wx.config({
				debug : true,
				appId : 'wxc3691f09dbfd769d',
				timestamp : res.timestamp,
				nonceStr : res.noncestr,
				signature : res.signature,
				jsApiList : [
					'chooseImage',
					'uploadImage'
				]
			});
			wx.ready(function() {
				main();
			});

		},
		error : function() {
			alert("'");
		}
	})
	function main() {
		init();
		addEventLisiter();
	}
	function addEventLisiter() {
		var zcsx = $(".qdsx").find(".zcsx");
		zcsx.click(function() {
			$(this).toggleClass("zcsxactive");
			var value = $(this).attr("value")
			if ($(this).hasClass("zcsxactive")) {
				attrs[value] = 1;
			} else {
				attrs[value] = 0;
			}
			sendAjax();
		});

		$("._dkfbsj").find(".fa-caret-up").click(function() {
			sortByName(".wyqdtime", function(a, b) {
				return a - b;
			});
		});
		$("._dkfbsj").find(".fa-caret-down").click(function() {
			sortByName(".wyqdtime", function(a, b) {
				return b - a;
			});
		});

		$("._dkjine").find(".fa-caret-up").click(function() {
			sortByName(".wyqdcash", function(a, b) {
				return a - b;
			});
		});
		$("._dkjine").find(".fa-caret-down").click(function() {
			sortByName(".wyqdcash", function(a, b) {
				return b - a;
			});
		});

		$("._dkjiage").find(".fa-caret-up").click(function() {
			sortByName("._qdjg", function(a, b) {
				return b - a;
			});
		});
		$("._dkjiage").find(".fa-caret-down").click(function() {
			sortByName("._qdjg", function(a, b) {
				return b - a;
			});
		});


	}

	function sortByName(name, fc) {
		var qdliitem = $(".ptkh").find(".qdliitem");
		//排序
		var dates = [];
		qdliitem.each(function(item) {
			var date = qdliitem.eq(item).find(name).children("span").attr("value");
			dates.push(parseInt(date));
		});
		dates.sort(fc);
		$(".ptkh").html("");
		dates.map(function(date) {
			qdliitem.each(function(item) {
				var realtime = qdliitem.eq(item).find(name).children("span").attr("value");
				if (date == realtime) {
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
				_msg("系统错误！");
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
					setCookie("user_dkxq", JSON.stringify(item));
					window.location.href = "dkrxx";
				}
			});
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
					window.location.href = "dkrxx";
				}
			});
		});
		//XX元抢单
		$(".qdbutton").click(function(e) {
			var id = $(this).attr("val_id");
			dealWithQd(id);
		});
	}

	function init() {
		sendAjax(attrs, appendHtml, 0);
		sendAjax(attrs2, appendHtml2, 1);
	}

	function dealWithQd(id) {
		//处理抢单
		var _sjh = getCookie("_user");
		alert(_sjh);
		if (!_sjh) {
			//页面自动跳转地址（非静默授权链接） 
			//参数appid为公众号的id redirect_uri为微信回调接口
			//state为可携带的参数(可选，这里写的是回调接口处理完跳转到指定页面) 
			//其余参数不变
			window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc3691f09dbfd769d&redirect_uri=www.80wangjian.com/springmvc/wyqd/index&response_type=code&scope=snsapi_userinfo";
		}


	}

})