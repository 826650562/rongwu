package com.clint.untils;

public class Outer {
    private Builder builder;

	public static class Builder {
        private static String accessToken;
        private static String jsapi_ticket;
     
       /* public Builder( String accessToken,String jsapi_ticket) {
            this.accessToken = accessToken;
            this.jsapi_ticket = jsapi_ticket;
        }*/
        
        
        public String getAccessToken() {
			return accessToken;
		}


		public void setAccessToken(String accessToken) {
			this.accessToken = accessToken;
		}


		public String getJsapi_ticket() {
			return jsapi_ticket;
		}


		public void setJsapi_ticket(String jsapi_ticket) {
			this.jsapi_ticket = jsapi_ticket;
		}
 
    }
	public Builder getOuter(){
		if(this.builder != null){
			return builder;
		}else{
			this.builder=new Builder();
			return builder;
		}
	}
}