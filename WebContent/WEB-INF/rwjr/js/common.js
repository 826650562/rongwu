function  _msg(info){
	layer.open({
		content : info,
		skin : 'msg',
		time : 2 //2秒后自动关闭
	});
}

function setCookie(name, value, liveMinutes) {    
    if (liveMinutes == undefined || liveMinutes == null) {  
        liveMinutes = 60 * 200;  
    }  
    if (typeof (liveMinutes) != 'number') {  
        liveMinutes = 60 * 2;//默认120分钟  
    }  
    var minutes = liveMinutes * 60 * 1000;  
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