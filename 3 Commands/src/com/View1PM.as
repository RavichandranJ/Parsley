package com
{
	public class View1PM
	{
		//-------------------------------------------------------------------------
		//
		// Variables
		//
		//-------------------------------------------------------------------------
		
		[Bindable]
		public var title:String = "Hello World";
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		
		//-------------------------------------------------------------------------
		//
		// Functions
		//
		//-------------------------------------------------------------------------
		
		public function send():void
		{
			trace('[View1PM] send()');
			dispatcher(new SimpleEvent(SimpleEvent.GET_BOOK_LIST));
		}
	}
}