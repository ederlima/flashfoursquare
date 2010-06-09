package br.ederlima.FlashFoursquare.data 
{
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class VenueData
	{
		private var _id:int;
		private var _name:String;
		private var _primaryCategory:CategoryData;
		private var _address:String;
		private var _crossStreet:String;
		private var _city:String;
		private var _state:String;
		private var _zip:int;
		private var _phone:int;
		private var _twitter:String;
		private var _geolat:Number;
		private var _geolong:Number;
		private var _stats:StatsData;
		public function VenueData() 
		{
			
		}
		
		public function get id():int { return _id; }
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
		public function get name():String { return _name; }
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get primaryCategory():CategoryData { return _primaryCategory; }
		
		public function set primaryCategory(value:CategoryData):void 
		{
			_primaryCategory = value;
		}
		
		public function get address():String { return _address; }
		
		public function set address(value:String):void 
		{
			_address = value;
		}
		
		public function get crossStreet():String { return _crossStreet; }
		
		public function set crossStreet(value:String):void 
		{
			_crossStreet = value;
		}
		
		public function get city():String { return _city; }
		
		public function set city(value:String):void 
		{
			_city = value;
		}
		
		public function get state():String { return _state; }
		
		public function set state(value:String):void 
		{
			_state = value;
		}
		
		public function get zip():int { return _zip; }
		
		public function set zip(value:int):void 
		{
			_zip = value;
		}
		
		public function get phone():int { return _phone; }
		
		public function set phone(value:int):void 
		{
			_phone = value;
		}
		
		public function get twitter():String { return _twitter; }
		
		public function set twitter(value:String):void 
		{
			_twitter = value;
		}
		
		public function get geolat():Number { return _geolat; }
		
		public function set geolat(value:Number):void 
		{
			_geolat = value;
		}
		
		public function get geolong():Number { return _geolong; }
		
		public function set geolong(value:Number):void 
		{
			_geolong = value;
		}
		
		public function get stats():StatsData { return _stats; }
		
		public function set stats(value:StatsData):void 
		{
			_stats = value;
		}
		
	}

}