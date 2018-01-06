$(function() {
	var w_sjh = 0;
	function getYzm() {
		//tpyzmsx
		$("._yzm").attr("src", 'yzm');
		$('.tpyzmsx').click(function() {
			$("._yzm").attr("src", 'yzm?time=' + new Date().getTime());
		});
	}
	getYzm();

	$(".hqyzm").click(function(){
		hqyzm();
	});
	
	function hqyzm(){
			var _sjh = $.trim($("#_sjh").val());
			var _txyzm = $.trim($("#_txyzm").val());
			$.ajax({
				url : "getyzm",
				type : "post",
				success : function(data) {
					if (_sjh.length <= 0) {
						//提示
						_msg("*—* 手机号不能为空！");
					} else if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(_sjh)) || _sjh.length != 11) {
						_msg("*—* 手机号不正确！");
					} else if (_txyzm.length <= 0) {
						_msg("*—* 图形验证码不能为空！");
					} else if (_txyzm.toUpperCase() != data) {
						_msg("*—* 图形验证码不正确！");
					} else {
						//发送手机验证码
						w_sjh = _sjh;
						$.ajax({
							url : "getsjyzm",
							type : "post",
							contentType : "application/x-www-form-urlencoded",
							data : {
								sjh : _sjh
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
				},
				error : function(error) {}
			});
	}
	

	$("#_login").click(function() {
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
					if (code == '10002') {
						//登录成功
						alert("登录成功");
						window.timer && window.clearInterval(timer);
					} else {
						_msg("*—* 手机验证码错误！");
					}
				},
				error : function(error) {
					_msg("*—* 手机验证码错误！");
				}
			});
		}
	});
//倒计时 
  function djs(){
	  var index=0;
	  var timer;
	  timer= window.setInterval(function() {
		 index++
		 if(index<=59){
			 $(".hqyzm").text((60-index)+"秒后重发");
		 }else{
			 window.clearInterval(timer);
			 $(".hqyzm").click(function(){
					hqyzm();
			  });
			 $(".hqyzm").removeClass("layui-btn layui-btn-disabled");
			 $(".hqyzm").text("获取验证码");
		 }
	   }, 1000)
  }

})