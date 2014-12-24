package com.ravi.examples.mvc.utils
{
	import mx.core.mx_internal;
	import mx.logging.targets.LineFormattedTarget;
	
	use namespace mx_internal;
	
	public class EncriptApplicationLog extends LineFormattedTarget
	{
		public function EncriptApplicationLog()
		{			
			super();
		}
		
		override mx_internal function internalLog(message:String):void
		{
			trace(message);
		}
	}
}