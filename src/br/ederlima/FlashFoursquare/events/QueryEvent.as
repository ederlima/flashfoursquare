package br.ederlima.FlashFoursquare.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class QueryEvent extends Event 
	{
		private static const QUERY_RESPONSE:String = "queryResponse";
		private static const QUERY_ERROR:String = "queryError";
		
		
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
		
	}
	
}