//贷款申请页面
$(function() {
	var _w_sjh
	function getYzm() {
		$(".getyzm").attr("src", '../rwjr/yzm');
		$('.tpyzmsx').click(function() {
			$(".getyzm").attr("src", '../rwjr/yzm?time=' + new Date().getTime());
		});
	}
	getYzm(); //验证码

	$(".hqyzm").click(function() {
		getTUpianyzm();
	});
	
	$("#_sq_next").click(function() {
		_login();
	});
	
	$("#_sq_tyjr").click(function() {
		if ($(this).is(':checked') == true) {
			$("#_sq_next").removeClass("layui-btn-disabled");
			$("#_sq_next").click(function() {
				_login();
			});
		} else {
			$("#_sq_next").addClass("layui-btn-disabled");
			$("#_sq_next").unbind("click");
		}
	});



	function _login() {
		//获取手机验证码
		//首先 图形验证码要正确
		var _name_sq = $.trim($("#_name_sq").val());
		if (checkPhoneAndName()) {
			//验证图形码
			checkTuxing(function(bool) {
				if (bool) {
					var dxyzm = $.trim($("#dxyzm").val());
					if (dxyzm.length <= 0) {
						_msg("*—* 请输入短信验证码!");
					} else {
						$.ajax({
							url : "../rwjr/checksjyzm",
							type : "post",
							contentType : "application/x-www-form-urlencoded",
							data : {
								dxyzm : dxyzm,
								_sjh : _w_sjh
							},
							success : function(code) {
								if (code == '10004') {
									_msg("请先获取手机验证码！");
								} else if (code == '10002') {
									//登录成功
									window.timer && window.clearInterval(timer);
									//放入cookie
									setCookie("sqdk_user", _w_sjh);
									setCookie("sqdk_name", _name_sq);
									checkIsYjSq(_w_sjh,_name_sq);
								} else {
									_msg("*—* 手机验证码错误！");
								}
							},
							error : function(error) {
								_msg("*—* 手机验证码错误！");
							}
						});
					}
				}
			});
		}
	}

	function checkIsYjSq(_w_sjh,_name_sq) {
		//判断是否已经申请过贷款
		$.ajax({
			url : "IsYjSq",
			type : "post",
			contentType : "application/x-www-form-urlencoded",
			data : {
				sjh : _w_sjh,
				name:_name_sq
			},
			success : function(code) {
				if (code == 'sdqk10010') {
					_xunwen("您已申请过贷款，是否继续申请？", [ "再次申请", "查看申请状态" ],function(){
						window.location.href='sqdk3';//跨过第二步 第三步
					},function(){
						//申请列表 姓名 手机号 时间 状态 抢单人
						window.location.href='sqdk_list';// 查看列表及状态
					});
				} else if (code == 'sdqk10011') {
					window.location.href='sqdk2';
				}
			}
		})
	}


	function getTUpianyzm() {
		//获取手机验证码
		//首先 图形验证码要正确
		if (checkPhoneAndName()) {
			//验证图形码
			checkTuxing(function(bool) {
				if (bool) {
					//发送手机验证码
					$.ajax({
						url : "../rwjr/getsjyzm",
						type : "post",
						contentType : "application/x-www-form-urlencoded",
						data : {
							sjh : _w_sjh
						},
						success : function(code) {
							if (code == '10010') {
								_msg("^_^ 手机验证码发送成功！");
								$(".hqyzm").addClass("layui-btn layui-btn-disabled");
								$('.hqyzm').unbind("click");
								djs();
							} else if (code == '10011') {
								_msg("*—* 手机验证码发送太频繁，请稍后重试");
							} else {
								_msg("*—* 手机验证码发送失败，请稍后重试！");
							}
						},
						error : function(error) {
							_msg("*—* 手机验证码发送失败，请重试！");
						}
					});
				}
			});
		}

	}

	function checkTuxing(func) {
		//验证图形码
		var _txyzm = $.trim($("#_txyzm").val());
		if (_txyzm.length <= 0) {
			_msg("*—* 图形验证码不能为空！");
			return false;
		}
		$.ajax({
			url : "../rwjr/getyzm",
			type : "post",
			success : function(data) {
				//data 图形码
				if (_txyzm.toUpperCase() != data) {
					_msg("*—* 图形验证码不正确！");
					func(false);
				} else {
					func(true);
				}
			}
		})
	}

	function checkPhoneAndName() {
		var _sjh = _w_sjh = $.trim($("#_sjh_sq").val());
		var _name_sq = $.trim($("#_name_sq").val());
		if (_name_sq.length <= 0) {
			_msg("*—* 姓名不能为空！");
			return false;
		} else if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(_sjh)) || _sjh.length != 11) {
			_msg("*—* 手机号不正确！");
			return false;
		} else if (_sjh.length <= 0) {
			_msg("*—* 手机号不能为空！");
			return false;
		}
		return true;
	}

	//倒计时
	function djs() {
		var index = 0;
		var timer;
		timer = window.setInterval(function() {
			index++
			if (index <= 59) {
				$(".hqyzm").text((60 - index) + "秒后重发");
			} else {
				window.clearInterval(timer);
				$(".hqyzm").click(function() {
					getTUpianyzm();
				});
				$(".hqyzm").removeClass("layui-btn layui-btn-disabled");
				$(".hqyzm").text("获取验证码");
			}
		}, 1000)
	}

})