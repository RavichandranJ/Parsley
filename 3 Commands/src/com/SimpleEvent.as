package com
{
	import flash.events.Event;
	
	public class SimpleEvent extends Event
	{
		public static const GET_BOOK_LIST:String = "getBookList";
		
		
		public function SimpleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new SimpleEvent(type);
		}
	}
}