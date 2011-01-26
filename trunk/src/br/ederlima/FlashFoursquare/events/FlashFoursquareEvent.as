package br.ederlima.FlashFoursquare.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class FlashFoursquareEvent extends Event 
	{
		public static const AUTHORIZATION_SUCCESS:String = "authorizationSuccess";
		public static const AUTHORIZATION_FAIL:String = "authorizationFail";
		
		public static const QUERY_RESPONSE:String = "flashfoursquareQueryResponse";
		public static const QUERY_FAILURE:String = "flashfoursquareQueryFailure";
		
		private var _xml:XML = null;
		public function FlashFoursquareEvent(type:String, xml:XML = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_xml = xml;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new FlashFoursquareEvent(type, _xml, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("FlashFoursquareEvent", "type", "XML", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}