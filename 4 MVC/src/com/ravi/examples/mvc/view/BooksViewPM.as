package com.ravi.examples.mvc.view
{
    import com.ravi.examples.mvc.commands.GetBookListCommand;
    import com.ravi.examples.mvc.common.AbstractClass;
    import com.ravi.examples.mvc.events.BooksEvent;
    import com.ravi.examples.mvc.model.AppModuleLocator;

    import spark.events.GridEvent;

    public class BooksViewPM extends AbstractClass
    {

        [Bindable]
        public var title:String = "Hello World";

        [Inject]
        public var model:AppModuleLocator;


        //-------------------------------------------------------------------------
        //
        // Functions
        //
        //-------------------------------------------------------------------------

        public function gridClickHandler(event:GridEvent):void
        {
            logger.debug('[BooksViewPM] gridClickHandler() rowIndex = {0}', event.rowIndex);
            if (event.rowIndex != -1)
                model.setAuthors(model.bookList[event.rowIndex].authors);
        }

    }
}
