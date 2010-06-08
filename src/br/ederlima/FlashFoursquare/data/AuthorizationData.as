package br.ederlima.FlashFoursquare.data 
{
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class AuthorizationData
	{
		private var _consumer_key:String;
		private var _consumer_secret:String;
		private var _user_name:String;
		private var _user_password:String;
		
		public function AuthorizationData() 
		{
			
		}
		/**
		 * Consumer key of application
		 */
		public function get key():String
		{
			return _consumer_key;
		}
		public function set key(value:String):void
		{
			_consumer_key = value;
		}
		/**
		 * Consumer secret of application
		 */
		public function get secret():String
		{
			return _consumer_secret;
		}
		public function set secret(value:String):void
		{
			_consumer_secret = value;
		}
		/**
		 * User username
		 */
		public function get username():String
		{
			return _user_name;
		}
		public function set username(value:String):void
		{
			_user_name = value;
		}
		/**
		 * User password
		 */
		public function get password():String
		{
			return _user_password;
		}
		public function set password(value:String):void
		{
			_user_password = value;
		}
		
		
	}

}