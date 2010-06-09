package br.ederlima.FlashFoursquare.core 
{
	import br.ederlima.FlashFoursquare.data.AuthorizationData;
	import br.ederlima.FlashFoursquare.data.TokenData;
	import br.ederlima.FlashFoursquare.events.AuthorizationEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import org.iotashan.oauth.*;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import br.ederlima.FlashFoursquare.data.AuthorizationData;
	import flash.net.URLRequest;
	
	/**
	 * OAuth Manager
	 * <br>Handles the OAuth autorization under the forsquare api
	 * @author Eder Lima
	 */
	public class AuthorizationManager extends EventDispatcher
	{
		private var _consumer:OAuthConsumer = new OAuthConsumer();
		private var _authData:AuthorizationData = new AuthorizationData();
		private var _requester:OAuthRequest;
		private var _signMethod:OAuthSignatureMethod_HMAC_SHA1 = new OAuthSignatureMethod_HMAC_SHA1();
		private var _loader:URLLoader = new URLLoader();
		private var _authxml:XML = new XML();
		private var _authToken:TokenData = new TokenData();
		private var _baseURL:String = "http://api.foursquare.com/v1";
		
		private var _authorized:Boolean = false;
		private static var instance:AuthorizationManager;
		private static var allowInstantiation:Boolean;
		
		public function AuthorizationManager() 
		{
			if (!allowInstantiation)
			{
				throw new Error("The Class AuthorizationManager can't be instantiated, use AuthorizationManager.getInstance()");
			}
		}
		public static function getInstance():AuthorizationManager
		{
			if (instance == null)
			{
				allowInstantiation = true;
				instance = new AuthorizationManager();
				allowInstantiation = false;
			}
			return instance;
		}
		/**
		 * Get Authorization over OAuth protocol at api.foursquare.com
		 * <br />You must get authorization before all your requests.
		 * @param	authData The object AuthorizationData containing user's data (username and password) and application data (key and secret)
		 */
		public function getAuthToken(authorizationData:AuthorizationData):void
		{
			_authData = authorizationData;
			_consumer.key = _authData.key;
			_consumer.secret = _authData.secret;
			_requester = new OAuthRequest("get", _baseURL + "/authexchange", { fs_username:_authData.username, fs_password:_authData.password }, _consumer);
			_loader.addEventListener(Event.COMPLETE, onAuthComplete);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onAuthError);
			_loader.load(new URLRequest(_requester.buildRequest(_signMethod, OAuthRequest.RESULT_TYPE_URL_STRING)));
			trace("AuthorizationManager: Getting token...");
		}
		private function onAuthComplete(event:Event):void
		{
			_authToken.token = XML(event.target.data).oauth_token;
			_authToken.tokenSecret = XML(event.target.data).oauth_token_secret;
			_authToken.tokenMessage = "Autorization Success";
			dispatchEvent(new AuthorizationEvent(AuthorizationEvent.TOKEN_RECEIVED, _authToken));
			_authorized = true;
			trace("AuthorizationManager: AuthorizationManager.isAuthorized > " ,_authorized.toString());
			trace("AuthorizationManager: Token received...");
		}
		private function onAuthError(event:IOErrorEvent):void
		{
			_authToken.tokenMessage = "Autorization Failed";
			dispatchEvent(new AuthorizationEvent(AuthorizationEvent.TOKEN_ERROR, _authToken));
			trace("AuthorizationManager: Error on getAuthToken");
		}
		/**
		 * The Foursquare base api url (http://api.foursquare.com/v1);
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
		 * TokenData Object: Contains the OAuth Token and Secret
		 */
		public function get token():TokenData
		{
			return _authToken;
		}
		/**
		 * True if the token and token secret is avaiable
		 */
		public function get isAuthorized():Boolean
		{
			return _authorized;
		}
		/**
		 * AuthorizationData Object: Contains the user's data (username and password) and application data (key and secret)
		 */
		public function get authData():AuthorizationData { return _authData; }
		
		public function set authData(value:AuthorizationData):void 
		{
			_authData = value;
		}
	}

}