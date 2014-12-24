package com.ravi.examples.mvc.view
{
	import com.ravi.examples.mvc.common.AbstractClass;
	import com.ravi.examples.mvc.events.BooksEvent;

	public class HomeViewPM extends AbstractClass
	{
		public function HomeViewPM()
		{
		}
		
		public function init():void
		{
			logger.debug('[HomeViewPM] init()');
			
			var event:BooksEvent = new BooksEvent(BooksEvent.GET_BOOK_LIST);
			logger.debug('dispatch Event  = {0}', event);
			dispatcher(event);
		}
	}
}