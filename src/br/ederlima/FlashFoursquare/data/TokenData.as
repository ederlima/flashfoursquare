package br.ederlima.FlashFoursquare.data 
{
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class TokenData
	{
		private var _oauth_token:String;
		private var _oauth_token_secret:String;
		private var _oauth_token_message:String;
		
		public function TokenData() 
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
		/**
		 * Success and Error messages
		 */
		public function get tokenMessage():String
		{
			return _oauth_token_message;
		}
		public function set tokenMessage(value:String):void
		{
			
		}
		
		
	}

}