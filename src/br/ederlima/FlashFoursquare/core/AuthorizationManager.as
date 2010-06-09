package br.ederlima.FlashFoursquare.core 
{
	import br.ederlima.FlashFoursquare.data.AuthorizationData;
	import br.ederlima.FlashFoursquare.data.AuthorizationToken;
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
		private var _requester:OAuthRequest;
		private var _signer:OAuthSignatureMethod_HMAC_SHA1 = new OAuthSignatureMethod_HMAC_SHA1();
		private var _loader:URLLoader = new URLLoader();
		private var _authxml:XML = new XML();
		private var _authToken:AuthorizationToken = new AuthorizationToken();
		private var _baseURL:String = "http://api.foursquare.com/v1";
		
		private static var _authorized:Boolean = false;
		
		public function AuthorizationManager() 
		{
			
		}
		/**
		 * Get Authorization over OAuth protocol at api.foursquare.com
		 * <br />You must get authorization before all your requests.
		 * @param	authData The object AuthorizationData containing user's data (username and password) and application data (key and secret)
		 */
		public function getAuthToken(authData:AuthorizationData):void
		{
			_consumer.key = authData.key;
			_consumer.secret = authData.secret;
			
			_requester = new OAuthRequest("get", _baseURL + "/authexchange", { fs_username:authData.username, fs_password:authData.password }, _consumer);
			_loader.addEventListener(Event.COMPLETE, onAuthComplete);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onAuthError);
			_loader.load(new URLRequest(_requester.buildRequest(new OAuthSignatureMethod_HMAC_SHA1(), OAuthRequest.RESULT_TYPE_URL_STRING)));
		}
		private function onAuthComplete(event:Event):void
		{
			_authToken.token = XML(event.target.data).oauth_token;
			_authToken.tokenSecret = XML(event.target.data).oauth_token_secret;
			_authToken.tokenMessage = "Autorization Success";
			dispatchEvent(new AuthorizationEvent(AuthorizationEvent.TOKEN_RECEIVED, _authToken));
			_authorized = true;
		}
		private function onAuthError(event:IOErrorEvent):void
		{
			_authToken.tokenMessage = "Autorization Failed";
			dispatchEvent(new AuthorizationEvent(AuthorizationEvent.TOKEN_ERROR, _authToken));
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
		 * Returns the AuthorizationToken Object
		 */
		public function get token():AuthorizationToken
		{
			return _authToken;
		}
		/**
		 * True if the token and token secret is avaiable
		 */
		public function get authorized():Boolean
		{
			return _authorized;
		}
	}

}