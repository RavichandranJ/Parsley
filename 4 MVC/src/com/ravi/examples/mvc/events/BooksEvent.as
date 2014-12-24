package com.ravi.examples.mvc.events
{
	import flash.events.Event;
	
	public class BooksEvent extends Event
	{
		public static const GET_BOOK_LIST:String = "getBookList";
		
		
		public function BooksEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new BooksEvent(type);
		}
	}
}