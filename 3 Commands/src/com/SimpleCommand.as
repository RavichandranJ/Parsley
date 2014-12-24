package com
{
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class SimpleCommand implements IResponder
	{
		public function execute(event:SimpleEvent):void
		{
			trace('[SimpleCommand] init()');
			
			var service:HTTPService = new HTTPService();
			service.url = "books.xml";
			service.method = "GET";
			service.send().addResponder(this);
			
		}
		
		public function result(event:Object):void
		{
			Alert.show("Result Recieved");			
		}
		
		public function fault(event:Object):void
		{
			Alert.show("Error Occured", "Service Error");
		}
	}
}