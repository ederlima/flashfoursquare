package br.ederlima.FlashFoursquare.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class QueryEvent extends Event 
	{
		public static const QUERY_RESPONSE:String = "queryResponse";
		public static const QUERY_ERROR:String = "queryError";
		
		private var _data:XML;
		public function QueryEvent(type:String, data:XML = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_data = data;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new QueryEvent(type, _data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("QueryEvent", "XMLData","type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		/**
		 * XML data 
		 */
		public function get data():XML { return _data; }
		
		public function set data(value:XML):void 
		{
			_data = value;
		}
		
	}
	
}