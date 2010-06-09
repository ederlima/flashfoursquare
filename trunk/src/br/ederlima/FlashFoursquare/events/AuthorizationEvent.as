package br.ederlima.FlashFoursquare.events 
{
	import br.ederlima.FlashFoursquare.data.AuthorizationToken;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class AuthorizationEvent extends Event 
	{
		public static const TOKEN_RECEIVED:String = "authTokenReceived";
		public static const TOKEN_ERROR:String = "authTokenError";
		private var _token:AuthorizationToken = new AuthorizationToken();
		public function AuthorizationEvent(type:String, token:AuthorizationToken = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_token = token;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new AuthorizationEvent(type, _token, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("AuthorizationEvent", "AuthorizationToken" ,"type", "bubbles", "cancelable", "eventPhase"); 
		}
		public function get token():AuthorizationToken
		{
			return _token;
		}
		
	}
	
}