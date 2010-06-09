package br.ederlima.FlashFoursquare 
{
	import br.ederlima.FlashFoursquare.core.AuthorizationManager;
	import br.ederlima.FlashFoursquare.data.AuthorizationData;
	import br.ederlima.FlashFoursquare.data.AuthorizationToken;
	import br.ederlima.FlashFoursquare.events.AuthorizationEvent;
	import br.ederlima.FlashFoursquare.events.FlashFoursquareEvent;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class FlashFoursquare extends EventDispatcher
	{
		private var _authmanager:AuthorizationManager = new AuthorizationManager();
		private var _authusername:String;
		private var _authpassword:String;
		private var _authconsumerkey:String;
		private var _authconsumersecret:String;
		private var _token:AuthorizationToken = new AuthorizationToken();
		
		public function FlashFoursquare() 
		{
			
		}
		/**
		 * Init the authorization process
		 * @param	username The user username
		 * @param	password The user password
		 * @param	consumerKey The Application key 
		 * @param	consumerSecret The Application secret
		 */
		public function authorize(username:String, password:String, consumerKey:String, consumerSecret:String):void
		{
			_authmanager.baseURL = "http://api.foursquare.com/v1";
			_authmanager.addEventListener(AuthorizationEvent.TOKEN_RECEIVED, onAuthTokenReceived);
			_authmanager.addEventListener(AuthorizationEvent.TOKEN_ERROR, onAuthTokenError);
			_authmanager.getAuthToken(new AuthorizationData(_authusername, _authpassword, _authconsumerkey, _authconsumersecret));
		}
		private function onAuthTokenReceived(event:AuthorizationEvent):void
		{
			_token.token = event.token.token;
			_token.tokenSecret = event.token.tokenSecret;
			_token.tokenMessage = event.token.tokenMessage;
			dispatchEvent(new FlashFoursquareEvent(FlashFoursquareEvent.AUTHORIZATION_SUCCESS));
		}
		private function onAuthTokenError(event:AuthorizationEvent):void
		{
			_token.tokenMessage = event.token.tokenMessage;
			dispatchEvent(new FlashFoursquareEvent(FlashFoursquareEvent.AUTHORIZATION_FAIL));
		}
		
	}

}