#Parsley
Parsley is an application framework for Flex application. I choosen parsley because of its dependency injection and inverse of control nature. This helps to implement presentation model architeure in a better way.

##Dependency Injection and Inverse of Control
All the dependent objects will be configured in parsley context and can be injected in the applciation without creating new instance. This will help maintaining single instance of the objects.

##Presentation Model
This is similar to spark component where the skin and logic will be seperated. For example View1.mxml will have only UI components and all the actionscript logic will be moved View1PM.ac class. This ways it is easy to manage view and logics. This also helps for unit testing.

# Flex and Parsley Example

## Adding Context to Main App page.



AppMain.mxml

```xml

<?xml version="1.0" encoding="utf-8"?>
<s:WindowedApplication xmlns:fx="http://ns.adobe.com/mxml/2009"
    xmlns:s="library://ns.adobe.com/flex/spark"
    xmlns:mx="library://ns.adobe.com/flex/mx"
    xmlns:parsley="http://www.spicefactory.org/parsley"
    xmlns:view="com.ravi.examples.mvc.view.*"
    xmlns:utils="com.ravi.examples.mvc.utils.*">
    <fx:Script>
        <![CDATA[
            import mx.logging.Log;
            import mx.logging.LogEventLevel;
        ]]>
    </fx:Script>

    <fx:Declarations>
        <parsley:ContextBuilder config="{AppContext}"/>
        <utils:EncriptApplicationLog filters="com.ravi.*"
            includeDate="true"
            includeTime="true"
            includeLevel="true"
            includeCategory="true"
            level="{LogEventLevel.ALL}"/>
    </fx:Declarations>
    <s:Label 
        x="10" y="30"
        fontSize="32"
        fontWeight="bold"
        text="Parsley - MVC Framework"/>
    <view:HomeView y="80"/>
</s:WindowedApplication>



```

## Context

All the classes like Commonds, Presentation Models, Singletons etc will be registered here for depency injection and event mapping.

AppContext.mxml

````xml

<?xml version="1.0" encoding="utf-8"?>
<parsley:Object xmlns:fx="http://ns.adobe.com/mxml/2009"
    xmlns:s="library://ns.adobe.com/flex/spark"
    xmlns:mx="library://ns.adobe.com/flex/mx"
    xmlns:parsley="http://www.spicefactory.org/parsley"
    xmlns:com="com.*"
    xmlns:view="com.ravi.examples.mvc.view.*"
    xmlns:delegate="com.ravi.examples.mvc.delegate.*"
    xmlns:commands="com.ravi.examples.mvc.commands.*"
    xmlns:model="com.ravi.examples.mvc.model.*">
    <fx:Script>
        <![CDATA[
            import com.ravi.examples.mvc.commands.GetBookListCommand;
            import com.ravi.examples.mvc.events.BooksEvent;
        ]]>
    </fx:Script>
    <fx:Declarations>

		<!--	Business	-->
		<delegate:CommonDelegate/>
		
		
		<!--	Model -->
        <model:AppModuleLocator/>


        <!-- 	Views	-->
		<view:AuthorsViewPM/>
		<view:BooksViewPM/>        
        <view:HomeViewPM/>        

        <!--	Commands	-->
        <parsley:Object type="{GetBookListCommand}">
            <parsley:MessageHandler method="execute"
                selector="{BooksEvent.GET_BOOK_LIST}"/>
		</parsley:Object>


    </fx:Declarations>
</parsley:Object>

```



## AbstractClass

This is helper class which is extended by other classes like commands abd model classes for dispatching events and log.

AbstractActor.as

```as3

package com.ravi.examples.mvc.common
{
	import com.ravi.examples.mvc.utils.getLogger;
	
	import mx.logging.ILogger;
	
	import org.spicefactory.parsley.dsl.view.Configure;

	public class AbstractClass
	{
		private var configure:Configure;
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		public function get logger():ILogger
		{
			return getLogger(this);
		}
	}
}

```


## Presentation Model (PM)


BooksViewPM.as

```as3

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


```

BooksView.mxml:



```xml

<?xml version="1.0" encoding="utf-8"?>
<s:Panel xmlns:fx="http://ns.adobe.com/mxml/2009"
    xmlns:s="library://ns.adobe.com/flex/spark"
    xmlns:mx="library://ns.adobe.com/flex/mx"
    xmlns:parsley="http://www.spicefactory.org/parsley">
    <fx:Declarations>
        <parsley:Configure/>
    </fx:Declarations>
    <fx:Script>
        <![CDATA[
            import com.ravi.examples.mvc.model.AppModuleLocator;


            [Bindable]
            [Inject]
            public var pm:BooksViewPM;

            [Bindable]
            [Inject]
            public var model:AppModuleLocator;
        ]]>
    </fx:Script>
    <s:DataGrid 
        left="10" right="10" top="10" bottom="10"
        dataProvider="{model.bookList}"
        gridClick="pm.gridClickHandler(event)"/>
    <s:controlBarContent>
        <s:Button label="Add New"/>
        <s:Button label="Edit Selected"/>
    </s:controlBarContent>
</s:Panel>


```

## Command



GetBookListCommand.as

```as3

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


```

## Abstract Command

AbstractCommand.as

```as3

package com.ravi.examples.mvc.common
{
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class AbstractCommand extends AbstractClass implements IResponder
	{		
		
		public function result(event:Object):void
		{
			logger.debug('result()');			
		}
		
		public function fault(event:Object):void
		{
			logger.error("fault() faultString = {0}, faultDetail = {1}", event.fault.faultString, event.fault.faultDetail);
		}
	}
}

```


## Services

CommonDelegate.as

```as3

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

```






