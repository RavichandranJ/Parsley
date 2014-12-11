package com
{
	import mx.controls.Alert;

	[Bindable]
	public class AppDataModel
	{
		public var title:String = "Hello from AppDataModel";
		
		public function AppDataModel()
		{
		}
		
		public function loginHandler(data:Object):void
		{
			Alert.show('[AppDataModel] loginHandler()');
		}
	}
}