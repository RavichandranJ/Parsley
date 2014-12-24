package com.ravi.examples.mvc.utils
{
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;

	public function getLogger(category:*):ILogger
	{
		var className:String = getQualifiedClassName(category);
		className = className.replace(/::/g, '.');
		return Log.getLogger(className);
	}
}