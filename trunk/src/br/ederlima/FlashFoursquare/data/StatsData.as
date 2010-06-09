package br.ederlima.FlashFoursquare.data 
{
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class StatsData
	{
		private var _checkins:int;
		private var _herenow:int;
		private var _beenHere:Boolean;
		private var _friendsBeenHere:Boolean;
		private var _mayor:UserData;
		
		public function StatsData() 
		{
			
		}
		/**
		 * Number of checkins
		 */
		public function get checkins():int { return _checkins; }
		
		public function set checkins(value:int):void 
		{
			_checkins = value;
		}
		/**
		 * Number of users here now
		 */
		public function get herenow():int { return _herenow; }
		
		public function set herenow(value:int):void 
		{
			_herenow = value;
		}
		/**
		 * The user have been here
		 */
		public function get beenHere():Boolean { return _beenHere; }
		
		public function set beenHere(value:Boolean):void 
		{
			_beenHere = value;
		}
		/**
		 * The user's frends have been here
		 */
		public function get friendsBeenHere():Boolean { return _friendsBeenHere; }
		
		public function set friendsBeenHere(value:Boolean):void 
		{
			_friendsBeenHere = value;
		}
		/**
		 * The mayor user
		 */
		public function get mayor():UserData { return _mayor; }
		
		public function set mayor(value:UserData):void 
		{
			_mayor = value;
		}
		
	}

}