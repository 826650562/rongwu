package com.clint.untils;

import org.springframework.context.annotation.Lazy;   
import org.springframework.scheduling.annotation.Scheduled;   
import org.springframework.stereotype.Component;   
  
import java.text.SimpleDateFormat;   
import java.util.Date;   
  
  
@Component   
@Lazy(false)   
public class TestJob {   
     public static SimpleDateFormat sdf_yyyyMMddHHmmss = new  SimpleDateFormat("yyyyMMddHHmmss");   
  
  
 @Scheduled(fixedDelay = 6000000)   
 public void exejob() throws Exception {   
	 JsapiTicketUtil jsapiTicketUtil=new JsapiTicketUtil();
	 jsapiTicketUtil.getSignature();
     System.out.println(sdf_yyyyMMddHHmmss.format(new Date()) + " ：执行中。。。");  
    }   
 }   