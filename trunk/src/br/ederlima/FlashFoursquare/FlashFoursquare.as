package br.ederlima.FlashFoursquare 
{
	import br.ederlima.FlashFoursquare.core.AuthorizationManager;
	import br.ederlima.FlashFoursquare.core.QueryManager;
	import br.ederlima.FlashFoursquare.data.AuthorizationData;
	import br.ederlima.FlashFoursquare.data.TokenData;
	import br.ederlima.FlashFoursquare.data.QueryMethod;
	import br.ederlima.FlashFoursquare.events.AuthorizationEvent;
	import br.ederlima.FlashFoursquare.events.FlashFoursquareEvent;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class FlashFoursquare extends EventDispatcher
	{
		private var _authData:AuthorizationData;
		private var _token:TokenData = new TokenData();
		private var _baseURL:String = "http://api.foursquare.com/v1"
		private var _queryManager:QueryManager = new QueryManager();
		private var _queryString:String = "";
		private var _queryParams:Object = new Object();
		private var _authmanager:AuthorizationManager;
		
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
		public function authorize():void
		{
			_authmanager = AuthorizationManager.getInstance();
			if (_authData != null)
			{
				_authmanager.baseURL = _baseURL;
				_authmanager.addEventListener(AuthorizationEvent.TOKEN_RECEIVED, onAuthTokenReceived);
				_authmanager.addEventListener(AuthorizationEvent.TOKEN_ERROR, onAuthTokenError);
				_authmanager.getAuthToken(_authData);
			}
			else
			{
				handleAuthError("AuthorizationData must be defined before authorize process.");
			}
		}
		/**
		 * Get friend's list or a especific user detail
		 * @param	uid Optional. Leave 0 for a list of user's friends
		 */
		public function getFriends(uid:int = 0):void
		{
			_queryString = _baseURL + "/friends";
			uid == 0 ? _queryParams = null : _queryParams.uid = uid;
			_queryManager.runQuery(_queryString, QueryMethod.GET, _queryParams );
		}
		private function onAuthTokenReceived(event:AuthorizationEvent):void
		{
			_token.token = event.token.token;
			_token.tokenSecret = event.token.tokenSecret;
			_token.tokenMessage = event.token.tokenMessage;
			_queryManager.authData = _authData;
			_queryManager.token = _token;
			dispatchEvent(new FlashFoursquareEvent(FlashFoursquareEvent.AUTHORIZATION_SUCCESS));
		}
		private function onAuthTokenError(event:AuthorizationEvent):void
		{
			_token.tokenMessage = event.token.tokenMessage;
			dispatchEvent(new FlashFoursquareEvent(FlashFoursquareEvent.AUTHORIZATION_FAIL));
		}
		private function handleAuthError(message = ""):void
		{
			trace("The authorization token is not avaiable.\n "+message);
		}
		/**
		 * The Foursquare API base URL (Default: "http://api.foursquare.com/v1");
		 */
		public function get baseURL():String
		{
			return _baseURL;
		}
		public function set baseURL(value:String):void
		{
			_baseURL = value;
		}
		/**
		 * AuthorizationData Object: Contains user's username, user's password, application's key and application's secret
		 */
		public function get authData():AuthorizationData { return _authData; }
		public function set authData(value:AuthorizationData):void 
		{
			_authData = value;
		}
		/**
		 * TokenData Object: Contains OAuth Token and Secret. Only avaiable after AUTHORIZATION_SUCCESS
		 */
		public function get token():TokenData { return _token; }
		/*
		public function set token(value:TokenData):void 
		{
			_token = value;
		}
		*/
		
		
	}

}