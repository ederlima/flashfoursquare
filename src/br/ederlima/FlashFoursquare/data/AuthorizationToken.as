package br.ederlima.FlashFoursquare.data 
{
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class AuthorizationToken
	{
		private var _oauth_token:String;
		private var _oauth_token_secret:String;
		
		public function AuthorizationToken() 
		{
			
		}
		/**
		 * Token Secret. Avaiable only after AuthorizationManager.getAuthToken complete.
		 */
		public function get tokenSecret():String
		{
			return _oauth_token_secret;
		}
		public function set tokenSecret(value:String):void
		{
			_oauth_token_secret = value;
		}
		/**
		 * Token. Avaiable only after AuthorizationManager.getAuthToken complete.
		 */
		public function get token():String
		{
			return _oauth_token;
		}
		public function set token(value:String):void
		{
			_oauth_token = value;
		}
		
		
	}

}