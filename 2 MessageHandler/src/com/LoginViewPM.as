package com
{
	[Bindable]
	public class LoginViewPM
	{
		public var title:String = "Hello from LoginViewPM";
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		public function LoginViewPM()
		{
		}
		
		public function clickHandler():void 
		{
			dispatcher(new LoginEvent(LoginEvent.LOGIN));
		}
	}
}