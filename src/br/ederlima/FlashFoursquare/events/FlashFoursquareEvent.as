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
		public function FlashFoursquareEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new FlashFoursquareEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("FlashFoursquareEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}