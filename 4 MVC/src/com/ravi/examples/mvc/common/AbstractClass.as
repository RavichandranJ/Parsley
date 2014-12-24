package com.ravi.examples.mvc.common
{
	import com.ravi.examples.mvc.utils.getLogger;
	
	import mx.logging.ILogger;
	
	import org.spicefactory.parsley.dsl.view.Configure;

	public class AbstractClass
	{
		private var configure:Configure;
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		public function get logger():ILogger
		{
			return getLogger(this);
		}
	}
}