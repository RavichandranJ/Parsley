package com.ravi.examples.mvc.delegate
{
	import com.ravi.examples.mvc.services.BooksService;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.http.HTTPService;

	public class CommonDelegate
	{
				
		public function getBookList():AsyncToken
		{
			var service:BooksService = new BooksService();
			service.url = "books.xml";			
			return service.send();
		}
	}
}