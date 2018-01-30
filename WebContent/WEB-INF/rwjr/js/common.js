function  _msg(info,fn){
	layer.open({
		content : info,
		skin : 'msg',
		time : 2 //2秒后自动关闭
	}, function(){
		  //do something
		fn();
	});
}

function _xunwen(content,buttons,fn1,fn2){
	//底部对话框
	  layer.open({
	    content: content
	    ,btn: buttons
	    ,skin: 'footer'
	    ,shadeClose:false
	    ,yes: function(index){
	    	fn1();
	    }
	    ,no:function(){
	    	fn2();
	    }
	  });
	  
}

function xunwenkuang(content,btn,fun1,fun2){
	//中间询问框
	  //询问框
	  layer.open({
	    content: content
	    ,btn:btn
	    ,yes:fun1  ,
	    no:fun2
	  });
}

function setCookie(name, value, liveMinutes) {    
/*    if (liveMinutes == undefined || liveMinutes == null) {  
        liveMinutes = 60 * 200;  
    }  
    if (typeof (liveMinutes) != 'number') {  
        liveMinutes = 600000 * 2;//默认120分钟  
    }  */
    var minutes = 6000000 * 60 * 1000;  
    var exp = new Date();  
    exp.setTime(exp.getTime() + minutes + 8 * 3600 * 1000);  
    //path=/表示全站有效，而不是当前页  
    document.cookie = name + "=" +  escape(value) + ";path=/;expires=" + exp.toUTCString();  
} 

//读取cookies 
function getCookie(name) 
{ 
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]); 
    else 
        return null; 
} 

//删除cookies 
function delCookie(name) 
{ 
    var exp = new Date(); 
    exp.setTime(exp.getTime() - 1); 
    var cval=getCookie(name); 
    if(cval!=null) 
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
function add0(m){return m<10?'0'+m:m }
function format(shijianchuo)
{
//shijianchuo是整数，否则要parseInt转换
var time = new Date(shijianchuo);
var y = time.getFullYear();
var m = time.getMonth()+1;
var d = time.getDate();
var h = time.getHours();
var mm = time.getMinutes();
var s = time.getSeconds();
return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
}
