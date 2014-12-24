package com.ravi.examples.mvc.services
{
	import com.ravi.examples.mvc.common.AbstractClass;
	import com.ravi.examples.mvc.utils.getLogger;
	
	import mx.logging.ILogger;
	import mx.rpc.AsyncToken;
	import mx.rpc.http.HTTPService;
	
	public class BooksService extends HTTPService
	{
		public function BooksService(rootURL:String=null, destination:String=null)
		{			
			super(rootURL, destination);
		}
		
		override public function send(parameters:Object = null):AsyncToken
		{
			logger.debug("[BooksService] Sending required for service url = " + url);
			method = "GET";
			resultFormat =  "e4x";
			return super.send();
		}
		
		public function get logger():ILogger
		{
			return getLogger(this);
		}
	}
}