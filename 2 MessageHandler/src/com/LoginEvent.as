package com
{
	import flash.events.Event;

	public class LoginEvent extends Event
	{
		public static const LOGIN:String = "login";
		
		
		public function LoginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new LoginEvent(type);
		}
	}
}
