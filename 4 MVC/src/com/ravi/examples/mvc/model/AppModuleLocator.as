package com.ravi.examples.mvc.model
{
    import com.ravi.examples.mvc.common.AbstractClass;
    
    import mx.collections.ArrayCollection;
    import mx.collections.ArrayList;

    [Bindable]
    public class AppModuleLocator extends AbstractClass
    {
        //-------------------------------------------------------------------------
        //
        //	Data Providers
        //
        //-------------------------------------------------------------------------

        public var bookList:ArrayCollection = new ArrayCollection();
        public var authorList:ArrayCollection;

		//-------------------------------------------------------------------------
		//
		//	Functions
		//
		//-------------------------------------------------------------------------
		
        public function setAuthors(array:Array):void
        {
            authorList = new ArrayCollection();
			
            for (var i:int = 0; i < array.length; i++)
            {
                var item:Object = new Object();
                item.label = array[i].toString();
                authorList.addItem(item);
            }
			logger.debug('[AppModuleLocator] setAuthors() authorList = {0}', array);
        }

    }
}