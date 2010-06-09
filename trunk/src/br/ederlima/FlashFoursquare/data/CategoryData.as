package br.ederlima.FlashFoursquare.data 
{
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class CategoryData
	{
		private var _id:int;
		private var _fullpathname:String;
		private var _nodes:Array;
		private var _iconurl:String;
		
		public function CategoryData() 
		{
			
		}
		/**
		 * The primary category ID
		 */
		public function get id():int { return _id; }
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		/**
		 * The category full path name, eg: (Nightlife:Bar)
		 */
		public function get fullpathname():String { return _fullpathname; }
		
		public function set fullpathname(value:String):void 
		{
			_fullpathname = value;
		}
		/**
		 * An array with de nodes for category, eg ("Bar");
		 */
		public function get nodes():Array { return _nodes; }
		
		public function set nodes(value:Array):void 
		{
			_nodes = value;
		}
		/**
		 * The category icon url
		 */
		public function get iconurl():String { return _iconurl; }
		
		public function set iconurl(value:String):void 
		{
			_iconurl = value;
		}
		
	}

}