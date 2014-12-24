package com.ravi.examples.mvc.common
{
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class AbstractCommand extends AbstractClass implements IResponder
	{		
		
		public function result(event:Object):void
		{
			logger.debug('result()');			
		}
		
		public function fault(event:Object):void
		{
			logger.error("fault() faultString = {0}, faultDetail = {1}", event.fault.faultString, event.fault.faultDetail);
		}
	}
}