package br.ederlima.FlashFoursquare.data 
{
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class UserData
	{
		private var _id:int;
		private var _firstname:String;
		private var _lastname:String;
		private var _photo:String;
		private var _gender:String;
		private var _phone:int;
		private var _email:String;
		private var _twitter:String;
		private var _facebook:String;
		
		public function UserData() 
		{
			
		}
		/**
		 * The user ID
		 */
		public function get id():int { return _id; }
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		/**
		 * The user first Name
		 */
		public function get firstname():String { return _firstname; }
		
		public function set firstname(value:String):void 
		{
			_firstname = value;
		}
		/**
		 * The user last Name
		 */
		public function get lastname():String { return _lastname; }
		
		public function set lastname(value:String):void 
		{
			_lastname = value;
		}
		/**
		 * The user photo
		 */
		public function get photo():String { return _photo; }
		
		public function set photo(value:String):void 
		{
			_photo = value;
		}
		/**
		 * The user gender
		 */
		public function get gender():String { return _gender; }
		
		public function set gender(value:String):void 
		{
			_gender = value;
		}
		/**
		 * The user phone Number
		 */
		public function get phone():int { return _phone; }
		
		public function set phone(value:int):void 
		{
			_phone = value;
		}
		/**
		 * The user e-mail
		 */
		public function get email():String { return _email; }
		
		public function set email(value:String):void 
		{
			_email = value;
		}
		/**
		 * The user twitter account
		 */
		public function get twitter():String { return _twitter; }
		
		public function set twitter(value:String):void 
		{
			_twitter = value;
		}
		/**
		 * The user facebook account
		 */
		public function get facebook():String { return _facebook; }
		
		public function set facebook(value:String):void 
		{
			_facebook = value;
		}
		
		
	}

}