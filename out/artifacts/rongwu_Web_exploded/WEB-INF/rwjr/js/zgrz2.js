//身份认证 上传图片
$(function() {
	$.ajax({
		url : "scPics",
		type : "post",
		contentType : "application/x-www-form-urlencoded",
		data : {
			url : "http://www.rongwu180.com/rongwu/gzyz/scsgzzJsp"
		},
		success : function(data) {
			var res = JSON.parse(data)[0];
			wx.config({
				debug : false,
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
				//选择图片
				var mylocalIds=[];
				$(".scsfzcont").click(function() {
					var that = $(this);
					wx.chooseImage({
						count : 1,
						sizeType : [ 'compressed' ],
						success : function(res) {
							var micd=res.localIds[0].toString(); 
							mylocalIds.push(micd);
							that.find("img").attr({
								"src" : res.localIds[0],
								"is_load" : 'res',
								"mylocalId":micd
							});
						},
						fail : function() {
							alert("设备不支持！");
						}
					});
				});
				//上传
				$("#gzzj_upload").click(function() {
					var isok = true;
					var len=mylocalIds.length;
					var mylocalId=$(".scsfzcont").find("img").attr("mylocalId");
					var imgs = [mylocalId];
					$(".sfzzimg").find("img").each(function() {
						if (!$(this).attr("is_load")) {
							alert("请先完成证件图片上传！");
							isok = false;
						}  
					});
					if (isok) {
						//上传到腾讯服务器
						var index = 0;
						var serverIds="";
						wxuploadImage(index, imgs);
						//上传图片接口  
						function wxuploadImage(index, imgs) {
							wx.uploadImage({
								localId : imgs[index], // 需要上传的图片的本地ID，由chooseImage接口获得  
								isShowProgressTips : 1, // 默认为1，显示进度提示  
								success : function(res) {
									index++;
									serverIds =serverIds+res.serverId+",";
									uploadFilsToMe(res.serverId, function() {
										if(index==1){
											//将图片名称+手机号放入数据库
											savePicsTOdata(serverIds);
										}else{
											wxuploadImage(index, imgs);
										}
										
									});
								},
								fail : function(error) {
									alert(Json.stringify(error));
								}
							});
						}
						function uploadFilsToMe(Picid, func) {
							$.ajax({
								url : "downloadMedia",
								type : "post",
								contentType : "application/x-www-form-urlencoded",
								data : {
									picid : Picid 
								},
								success : function(code) {
									func();
								},
								error : function(error) {
									alert("从微信下载图片失败！"+Picid);
								}
							});

						}
					}
				});

              function savePicsTOdata(serverIds){
            	  var serverIds=serverIds.substring(0,serverIds.length-1);
            		$.ajax({
						url : "../gzyz/savePicsAndIpone",
						type : "post",
						contentType : "application/x-www-form-urlencoded",
						data : {
							serverIds : serverIds,
							_sjh:sjh
						},
						success : function(code) {
							//返回页面\
							window.location.href='../gzyz/index#'+encodeURIComponent("工作证照片已上传");
						},
						error : function(error) {
						}
					});
              }


			});

		}
	})


})