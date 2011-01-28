package br.ederlima.FlashFoursquare.data 
{
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class UserData
	{
		/*
			<id>408136</id>
			<firstname>80.20</firstname>
			<lastname>Marketing Digital</lastname>
			<friendstatus>friend</friendstatus>
			<homecity>Imperatriz, MA</homecity>
			<photo>http://playfoursquare.s3.amazonaws.com/userpix_thumbs/LPPOUOBF1D5CG10L.jpg</photo>
			<gender>none</gender>
			<phone>556799068845</phone>
			<email>cadastro@8020mkt.com.br</email>
			<twitter>8020mkt</twitter>
		*/
		private var _id:int;
		private var _firstname:String;
		private var _lastname:String;
		private var _photo:String;
		private var _gender:String;
		private var _phone:int;
		private var _email:String;
		private var _twitter:String;
		private var _homecity:String;
		private var _status:String;
		
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
		 * The user's homecity
		 */
		public function get homecity():String { return _homecity; }
		
		public function set homecity(value:String):void 
		{
			_homecity = value;
		}
		/**
		 * The user's friend status (eg: friend)
		 */
		public function get status():String { return _status; }
		
		public function set status(value:String):void 
		{
			_status = value;
		}
		
		
	}

}