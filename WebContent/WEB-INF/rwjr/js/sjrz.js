$(function() {
	var w_sjh = 0;
	var is_tupianYanzheng = false;
	function getYzm() {
		$("._yzm").attr("src", 'yzm');
		$('.tpyzmsx').click(function() {
			$("._yzm").attr("src", 'yzm?time=' + new Date().getTime());
		});
	}
	getYzm(); //验证码
	$(".hqyzm").click(function() {
		getTUpianyzm();
	});
	$("#_login").click(function() {
		_login();
	});

	function _login() {

		//获取手机验证码
		//首先 图形验证码要正确
		if (checkPhone()) {
			//验证图形码
			checkTuxing(function(bool) {
				if (bool) {
					var dxyzm = $.trim($("#dxyzm").val());
					if (dxyzm.length <= 0) {
						_msg("*—* 请输入短信验证码!");
					} else {
						$.ajax({
							url : "checksjyzm",
							type : "post",
							contentType : "application/x-www-form-urlencoded",
							data : {
								dxyzm : dxyzm,
								_sjh : w_sjh
							},
							success : function(code) {
							  if (code == '10004') {
								  _msg("请先获取手机验证码！");
							  } else if (code == '10002') {
									//登录成功
									_msg("登录成功!");
									window.timer && window.clearInterval(timer);
									window.location.href = 'sjrz';
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

	function getTUpianyzm() {
		//获取手机验证码
		//首先 图形验证码要正确
		if (checkPhone()) {
			//验证图形码
			checkTuxing(function(bool) {
				if (bool) {
					//发送手机验证码
					$.ajax({
						url : "getsjyzm",
						type : "post",
						contentType : "application/x-www-form-urlencoded",
						data : {
							sjh : w_sjh
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



	function checkPhone() {
		var _sjh = w_sjh = $.trim($("#_sjh").val());
		if (_sjh.length <= 0) {
			_msg("*—* 手机号不能为空！");
			return false;
		} else if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(_sjh)) || _sjh.length != 11) {
			_msg("*—* 手机号不正确！");
			return false;
		}
		return true;
	}
	function checkTuxing(func) {
		//验证图形码
		var _txyzm = $.trim($("#_txyzm").val());
		if (_txyzm.length <= 0) {
			_msg("*—* 图形验证码不能为空！");
			return false;
		}
		$.ajax({
			url : "getyzm",
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

	function checkOutSubmit(_sjh, _txyzm) {
		if (_sjh.length <= 0) {
			//提示
			_msg("*—* 手机号不能为空！");
			return false;
		} else if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(_sjh)) || _sjh.length != 11) {
			_msg("*—* 手机号不正确！");
			return false;
		} else if (_txyzm.length <= 0) {
			_msg("*—* 图形验证码不能为空！");
			return false;
		} else {
			return true
		}
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
					hqyzm();
				});
				$(".hqyzm").removeClass("layui-btn layui-btn-disabled");
				$(".hqyzm").text("获取验证码");
			}
		}, 1000)
	}


})