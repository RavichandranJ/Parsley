package com.ravi.examples.mvc.commands
{
    import com.ravi.examples.mvc.common.AbstractCommand;
    import com.ravi.examples.mvc.delegate.CommonDelegate;
    import com.ravi.examples.mvc.events.BooksEvent;
    import com.ravi.examples.mvc.model.AppModuleLocator;
    import com.ravi.examples.mvc.vo.BookVO;
    
    import mx.rpc.events.ResultEvent;
    
    import org.spicefactory.parsley.dsl.view.Configure;

    public class GetBookListCommand extends AbstractCommand
    {

        [Inject]
        public var delegate:CommonDelegate;

        [Inject]
        public var model:AppModuleLocator;

        public function execute(event:BooksEvent):void
        {
            logger.debug('[GetBookListCommand] execute()');
            delegate.getBookList().addResponder(this);
        }

        override public function result(event:Object):void
        {
            var result:XML = event.result as XML;
            logger.debug('[GetBookListCommand] result() = {0}', result);

            var xmlList:XMLList = result..book as XMLList;

            for each (var item:XML in xmlList)
            {
                var vo:BookVO = new BookVO();
                vo.authors = getAuthorsList(item..author as XMLList);
                vo.category = item.@category;
                vo.price = item.price;
                vo.title = item.title;
                vo.year = item.year;
                model.bookList.addItem(vo);
            }
			
			model.setAuthors(model.bookList[0].authors);
        }
		
		private function getAuthorsList(authorList:XMLList):Array
		{
			var array:Array = [];			
			for each (var item:Object in authorList) 
			{
				array.push(item);
			}
			return array;
		}


    }
}
