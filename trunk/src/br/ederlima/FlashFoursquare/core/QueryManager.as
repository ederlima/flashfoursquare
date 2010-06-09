package br.ederlima.FlashFoursquare.core 
{
	import br.ederlima.FlashFoursquare.data.AuthorizationData;
	import br.ederlima.FlashFoursquare.data.TokenData;
	import br.ederlima.FlashFoursquare.data.QueryMethod;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import org.iotashan.oauth.*;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class QueryManager extends EventDispatcher
	{
		private var _consumer:OAuthConsumer = new OAuthConsumer();
		private var _requester:OAuthRequest;
		private var _requestertoken:OAuthToken = new OAuthToken();
		private var _signMethod:OAuthSignatureMethod_HMAC_SHA1 = new OAuthSignatureMethod_HMAC_SHA1();
		private var _queryRequestString:String = "";
		private var _queryRequest:URLRequest;
		private var _queryLoader:URLLoader = new URLLoader();
		
		private var _url:String;
		private var _method:String;
		private var _authData:AuthorizationData = new AuthorizationData();
		private var _token:TokenData;
		private var _requestParams:Object;
		
		public function QueryManager() 
		{
			
		}
		public function runQuery(url:String, method:String, params:Object = null):void
		{
			_consumer.key = _authData.key;
			_consumer.secret = _authData.secret;
			_requester = new OAuthRequest(method, url, params, _consumer);
			_requestertoken.key = _token.token;
			_requestertoken.secret = _token.tokenSecret;
			_requester.token = _requestertoken;
			_queryRequest = new URLRequest(_requester.buildRequest(_signMethod, OAuthRequest.RESULT_TYPE_URL_STRING));
			_queryLoader.addEventListener(Event.COMPLETE, queryCompleteHandler);
			_queryLoader.addEventListener(IOErrorEvent.IO_ERROR, queryIOErrorHandler);
			_queryLoader.load(_queryRequest);
		}
		private function queryCompleteHandler(event:Event):void
		{
			trace("ok");
			trace(event.target.data);
			//trace("Token: [key: " + this.token.token +", Secret: " + this.token.tokenSecret);
		}
		private function queryIOErrorHandler(event:IOErrorEvent):void
		{
			trace("error");
		}
		/**
		 * AuthorizationData Object: Contains the user's data (username and password) and application data (key and secret)
		 */
		public function get authData():AuthorizationData { return _authData; }
		
		public function set authData(value:AuthorizationData):void 
		{
			_authData = value;
		}
		/**
		 * TokenData Object: Contains the OAuth Token and Secret
		 */
		public function get token():TokenData { return _token; }
		
		public function set token(value:TokenData):void 
		{
			_token = value;
			trace("Query: ", _token.token, _token.tokenSecret);
		}
	}

}