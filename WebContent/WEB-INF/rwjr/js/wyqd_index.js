//我要抢单 
$(function() {
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
				alert(343);
				wx.showToast({
					  title: '成功',
					  icon: 'success',
					  duration: 2000
					})
				
			});

		}
	})


})